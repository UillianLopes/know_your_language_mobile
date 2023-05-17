import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:know_your_language/src/pages/sign-in/sign_in_page_controller.dart';
import 'package:know_your_language/src/widgets/toolbar.dart';

import '../../widgets/custom_safe_area.dart';

class SignInPage extends GetView<SignInPageController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        appBar: Toolbar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                FilledButton(
                  onPressed: () {
                    controller.signInWithGoogle();
                  },
                  child: const Text(
                    'Entrar com google',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
