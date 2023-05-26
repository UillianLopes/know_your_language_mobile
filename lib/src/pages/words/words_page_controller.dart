import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:know_your_language/src/core/constants/store_keys.dart';
import 'package:know_your_language/src/core/contracts/facades/istorage_facade.dart';
import 'package:know_your_language/src/core/models/word_model.dart';

import '../../core/contracts/providers/iwords_provider.dart';
import '../../widgets/selection_list/selection_list_controller.dart';
import 'guess_the_word_meaning/guess_the_word_meaning.dart';

class WordsPageController extends GetxController {
  final meaningsController = SelectionListController<MeaningModel>();

  final IWordsProvider _wordsProvider;
  final IStorageFacade _storeFacade;
  final word$ = Rx<WordModel?>(null);
  final isLoading$ = false.obs;
  final isUpdating$ = false.obs;
  final isIncorrect$ = false.obs;
  final count$ = 0.obs;

  WordsPageController(this._wordsProvider, this._storeFacade);

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadWord();
  }

  void reset() {
    word$.value = null;
    isLoading$.value = false;
    isUpdating$.value = false;
    meaningsController.reset();
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
        meaningsController.seed(
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
    final index = meaningsController.selectedIndex$.value;

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

      meaningsController.complete(
        correctIndex: word.meanings.indexOf(meaning),
      );
    } else {
      meaningsController.markCurretIndexAsIncorrect();
      await _pushIncorrectAnswers(word.id, meaning.id);
      isIncorrect$.value = true;
    }

    final result = await Get.dialog<String?>(
      GessTheWordResult(
        result: data,
      ),
      barrierDismissible: false,
    );

    switch (result) {
      case 'nextWord':
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
