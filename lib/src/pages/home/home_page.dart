import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:know_your_language/src/pages/home/home_page_controller.dart';
import 'package:know_your_language/src/pages/home/tabs/known_words_tab/known_words_tab.dart';
import 'package:know_your_language/src/pages/home/tabs/main_tab/main_tab.dart';
import 'package:know_your_language/src/pages/home/tabs/rankings_tab/rankings_tab.dart';

import '../../widgets/custom_safe_area.dart';
import '../../widgets/positioned_floating_menu.dart';
import '../../widgets/toolbar.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        appBar: Toolbar(),
        body: Stack(
          children: [
            PageView(
              controller: controller.pageViewController,
              onPageChanged: (value) {
                controller.currentTab.value = value;
              },
              children: const [
                MainTab(),
                RankingsTab(),
                KnownWordsTab(),
              ],
            ),
            Obx(() {
              return PositionedFloatingMenu(
                bottom: 24,
                itemSize: 45,
                selectedIndex: controller.currentTab.value,
                onItemSelected: (index) {
                  controller.animateToPage(index);
                },
                items: [
                  MenuItem(icon: Icons.home),
                  MenuItem(icon: Icons.workspace_premium),
                  MenuItem(icon: Icons.abc),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
