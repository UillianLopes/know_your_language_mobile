import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:know_your_language/src/pages/profile/profile_page_controller.dart';
import 'package:know_your_language/src/widgets/custom_safe_area.dart';
import 'package:know_your_language/src/widgets/toolbar.dart';

class ProfilePage extends GetView<ProfilePageController> {
  const ProfilePage({super.key});

  @override
  Widget build(Object context) {
    return CustomSafeArea(
      child: Scaffold(
        appBar: Toolbar(
          canOpenProfilePage: false,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              FilledButton(
                onPressed: () async {
                  await controller.signOut();
                },
                child: const Text('SIGN OUT'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
