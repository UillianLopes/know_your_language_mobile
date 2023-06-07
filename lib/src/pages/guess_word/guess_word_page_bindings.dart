import 'package:get/get.dart';
import 'package:know_your_language/src/pages/guess_word/guess_word_page_controller.dart';

class GuessWordPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GuessWordPageController(Get.find()));
  }
}
