import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:know_your_language/src/core/models/word_model.dart';

import '../../core/contracts/providers/iwords_provider.dart';

class WordsPageController extends GetxController {
  final IWordsProvider _wordsProvider;
  final word$ = Rx<WordModel?>(null);
  final selectedIndex$ = Rx<int?>(null);
  final isDefined$ = false.obs;
  final isLoading$ = false.obs;
  final isCorrect$ = false.obs;
  final isUpdating$ = false.obs;

  WordsPageController(this._wordsProvider);

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadWord();
  }

  resetState() {
    word$.value = null;
    selectedIndex$.value = null;
    isDefined$.value = false;
    isLoading$.value = false;
    isCorrect$.value = false;
    isUpdating$.value = false;
  }

  Future<void> loadWord() async {
    isLoading$.value = true;
    try {
      final response = await _wordsProvider.getUnknownWord();
      word$.value = response?.data;
    } finally {
      isLoading$.value = false;
    }
  }

  void select(int index) {
    final meanings = word$.value?.meanings;

    if (meanings == null || meanings.isEmpty) {
      return;
    }

    selectedIndex$.value = index;
  }

  Future<void> define() async {
    final word = word$.value;

    if (word == null) {
      return;
    }

    final selectedIndex = selectedIndex$.value;

    if (selectedIndex == null) {
      return;
    }

    final meaning = word.meanings[selectedIndex];
    final isCorrect = !meaning.isFake;

    isUpdating$.value = true;
    try {
      final response =
          await _wordsProvider.markAWordAsKnow(word.id, isCorrect ? 10 : 0);

      if (response == null) {
        return;
      }

      isCorrect$.value = isCorrect;
      isDefined$.value = true;
    } catch (e) {
    } finally {
      isUpdating$.value = false;
    }
  }
}
