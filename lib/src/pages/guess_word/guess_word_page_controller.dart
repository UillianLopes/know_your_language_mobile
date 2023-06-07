import 'package:get/get.dart';
import 'package:know_your_language/src/core/contracts/providers/iwords_provider.dart';
import 'package:know_your_language/src/core/models/word_model.dart';

class GuessWordPageController extends GetxController {
  final IWordsProvider _wordsProvider;
  final word$ = Rx<WordModel?>(null);
  final isLoading$ = false.obs;

  GuessWordPageController(this._wordsProvider);

  @override
  void onInit() {
    super.onInit();
    loadWord();
  }

  Future<void> loadWord() async {
    try {
      isLoading$.value = true;
      final response = await _wordsProvider.getUnknownWord();
      word$.value = response?.data;
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading$.value = false;
    }
  }
}
