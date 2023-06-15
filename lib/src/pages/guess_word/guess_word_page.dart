import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:know_your_language/src/pages/guess_word/guess_word_page_controller.dart';
import 'package:know_your_language/src/widgets/custom_button.dart';
import 'package:know_your_language/src/widgets/custom_safe_area.dart';
import 'package:know_your_language/src/widgets/toolbar.dart';
import 'package:know_your_language/src/widgets/word/word.dart';

class GuessWordPage extends GetView<GuessWordPageController> {
  const GuessWordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        appBar: Toolbar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () {
              final isLoading = controller.isLoading$.value;
              final word = controller.word$.value;
              if (isLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              if (word == null) {
                return const Center(
                  child: Text('No word found'),
                );
              }

              final meaning = word.meanings
                  .where(
                    (meaning) => !meaning.isFake,
                  )
                  .first;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meaning.value,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Word(
                    word: word.value,
                    status: WordStatus.hidden,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const TextField(),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onTap: () {},
                            child: const Center(child: Text('CONFIRMAR')),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
