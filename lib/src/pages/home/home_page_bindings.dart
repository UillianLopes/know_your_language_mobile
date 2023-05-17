import 'package:get/get.dart';
import 'package:know_your_language/src/pages/home/home_page_controller.dart';
import 'package:know_your_language/src/pages/home/tabs/rankings_tab/rankings_tab_controller.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => RankingsTabController(Get.find()));
  }
}
