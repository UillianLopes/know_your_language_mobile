import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final PageController pageViewController = PageController();
  RxInt currentTab$ = 0.obs;

  void animateToPage(int index) {
    pageViewController.animateToPage(
      index,
      duration: 200.ms,
      curve: Curves.linear,
    );
    currentTab$.value = index;
  }

  @override
  void onInit() {
    if (pageViewController.hasClients) {
      pageViewController.jumpToPage(currentTab$.value);
    }

    super.onInit();
  }
}
