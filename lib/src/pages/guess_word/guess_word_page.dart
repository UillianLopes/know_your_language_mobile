import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:know_your_language/src/pages/guess_word/guess_word_page_controller.dart';
import 'package:know_your_language/src/widgets/custom_safe_area.dart';
import 'package:know_your_language/src/widgets/toolbar.dart';

class GuessWordPage extends GetView<GuessWordPageController> {
  const GuessWordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        appBar: Toolbar(),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text('TEst'),
          ),
        ),
      ),
    );
  }
}
