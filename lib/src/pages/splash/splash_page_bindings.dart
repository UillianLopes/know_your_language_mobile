import 'package:get/get.dart';
import 'package:know_your_language/src/pages/splash/splash_page_controller.dart';

class SplashPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashPageController(Get.find(), Get.find()));
  }
}
