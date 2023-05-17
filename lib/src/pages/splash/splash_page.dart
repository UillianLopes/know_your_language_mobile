import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:know_your_language/src/pages/splash/splash_page_controller.dart';

import '../../widgets/custom_safe_area.dart';

class SplashPage extends GetView<SplashPageController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        body: Center(
          child: Obx(
            () {
              return controller.isLoading$.value
                  ? const CircularProgressIndicator.adaptive()
                  : Container();
            },
          ),
        ),
      ),
    );
  }
}
