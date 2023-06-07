import 'package:get/get.dart';
import 'package:know_your_language/src/pages/guess_meaning/guess_meaning_controller.dart';

class GuessMeaningPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(GuessMeaningPageController(Get.find(), Get.find()));
  }
}
