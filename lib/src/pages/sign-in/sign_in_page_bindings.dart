import 'package:get/get.dart';
import 'package:know_your_language/src/pages/sign-in/sign_in_page_controller.dart';

class SignInPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInPageController(Get.find()));
  }
}
