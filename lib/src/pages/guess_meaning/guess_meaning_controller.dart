import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:know_your_language/src/core/constants/store_keys.dart';
import 'package:know_your_language/src/core/contracts/facades/istorage_facade.dart';
import 'package:know_your_language/src/core/models/word_model.dart';

import '../../core/contracts/providers/iwords_provider.dart';
import '../../widgets/selection_list/selection_list_controller.dart';
import '../../dialogs/result_dialog.dart';

class GuessMeaningPageController extends GetxController {
  final meaningsListController = SelectionListController<MeaningModel>();

  final IWordsProvider _wordsProvider;
  final IStorageFacade _storeFacade;

  final word$ = Rx<WordModel?>(null);
  final count$ = 0.obs;
  final isLoading$ = false.obs;
  final isUpdating$ = false.obs;
  final isIncorrect$ = false.obs;

  GuessMeaningPageController(this._wordsProvider, this._storeFacade);

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadWord();
  }

  void reset() {
    word$.value = null;
    isLoading$.value = false;
    isUpdating$.value = false;
    meaningsListController.reset();
  }

  Future<void> loadWord() async {
    isLoading$.value = true;

    try {
      final response = await _wordsProvider.getUnknownWord();

      word$.value = response?.data;

      final word = word$.value;

      if (word != null) {
        final incorrectAnswers = await _getIncorrectAnswers(word.id);
        final incorrectIndexes = word.meanings
            .where((element) => incorrectAnswers.contains(element.id))
            .map((e) => word.meanings.indexOf(e))
            .toList();
        meaningsListController.seed(
          word.meanings,
          incorrectIndexes,
        );
      }
    } finally {
      isLoading$.value = false;
    }
  }

  tryAgain() {
    isIncorrect$.value = false;
  }

  Future<void> confirm({bool? force = false}) async {
    final index = meaningsListController.selectedIndex$.value;

    if (index == null) {
      return;
    }

    final word = word$.value;

    if (word == null) {
      return;
    }

    if (index >= word.meanings.length) {
      return;
    }

    final meaning = word.meanings[index];

    final response = await _wordsProvider.markAWordAsKnow(MarkWordAsKnowPayload(
      wordId: word.id,
      meaningId: meaning.id,
      force: force,
    ));

    final data = response?.data;

    if (data == null) {
      return;
    }

    if (data.completed) {
      final meaning = word.meanings
          .where((element) => element.id == data.correctMeaningId)
          .first;

      meaningsListController.complete(
        correctIndex: word.meanings.indexOf(meaning),
      );
    } else {
      meaningsListController.markCurretIndexAsIncorrect();
      await _pushIncorrectAnswers(word.id, meaning.id);
      isIncorrect$.value = true;
    }

    print(jsonEncode(data));

    final result = await Get.dialog<String?>(
      ResultDialog(
        result: data,
      ),
      barrierDismissible: false,
    );

    switch (result) {
      case 'nextWord':
        await nextWord();
        break;
      case 'incorrectNextWord':
        await _wordsProvider.markAWordAsKnow(MarkWordAsKnowPayload(
          wordId: word.id,
          meaningId: meaning.id,
          force: true,
        ));
        await nextWord();
        break;
    }
  }

  Future<void> nextWord() async {
    reset();
    await loadWord();
  }

  Future<void> _pushIncorrectAnswers(int wordId, int meaningId) async {
    final incorrectAnswersJson = _storeFacade.getString(
      StoreKeys.incorrectAnswers,
    );

    if (incorrectAnswersJson == null) {
      await _storeFacade.setString(
        StoreKeys.incorrectAnswers,
        jsonEncode({
          'wordId': wordId,
          'incorrectAnswers': [meaningId]
        }),
      );
      return;
    }

    final incorrectAnswers = jsonDecode(incorrectAnswersJson);

    if (incorrectAnswers['wordId'] == wordId) {
      final incorrectAnswer = incorrectAnswers['incorrectAnswers'] as List<int>;
      await _storeFacade.setString(
        StoreKeys.incorrectAnswers,
        jsonEncode({
          'wordId': wordId,
          'incorrectAnswers': [...incorrectAnswer, meaningId]
        }),
      );
      return;
    }

    await _storeFacade.setString(
      StoreKeys.incorrectAnswers,
      jsonEncode({
        'wordId': wordId,
        'incorrectAnswers': [meaningId]
      }),
    );
  }

  Future<List<int>> _getIncorrectAnswers(int wordId) async {
    final incorrectAnswersJson = _storeFacade.getString(
      StoreKeys.incorrectAnswers,
    );

    if (incorrectAnswersJson == null) {
      return [];
    }

    final incorrectAnswersDynamic = jsonDecode(incorrectAnswersJson);

    if (incorrectAnswersDynamic['wordId'] != wordId) {
      await _storeFacade.remove(StoreKeys.incorrectAnswers);
      return [];
    }

    final incorrectAnswers =
        ((incorrectAnswersDynamic['incorrectAnswers'] as List<dynamic>) ?? []);

    return incorrectAnswers.map((e) => e as int).toList();
  }
}
