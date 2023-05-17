import 'package:get/get.dart';
import 'package:know_your_language/src/pages/profile/profile_page_controller.dart';

class ProfilePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfilePageController(Get.find()));
  }
}
