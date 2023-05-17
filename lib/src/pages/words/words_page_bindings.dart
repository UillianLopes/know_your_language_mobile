import 'package:get/get.dart';
import 'package:know_your_language/src/pages/words/words_page_controller.dart';

class WordsPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WordsPageController());
  }
}
