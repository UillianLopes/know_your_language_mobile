import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:know_your_language/src/pages/words/words_page_controller.dart';
import 'package:know_your_language/src/widgets/custom_button.dart';
import 'package:know_your_language/src/widgets/custom_safe_area.dart';
import 'package:know_your_language/src/widgets/meaning_option.dart';
import 'package:know_your_language/src/widgets/toolbar.dart';

class WordsPage extends GetView<WordsPageController> {
  final Map<String, String?>? parameters;

  const WordsPage({super.key, this.parameters});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        appBar: Toolbar(),
        body: Padding(
          padding: const EdgeInsets.all(16),
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
                  child: Text('Palavra inválida'),
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Você sabe o que significa a palavra ',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: word.value,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                          text: '?',
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: word.meanings.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 16.0,
                      ),
                      itemBuilder: (context, index) {
                        final meaning = word.meanings[index];
                        return Obx(() {
                          final selectedIndex = controller.selectedIndex$.value;
                          final isDefined = controller.isDefined$.value;
                          return MeaningOption(
                            key: Key('meaing_option_${meaning.id}'),
                            meaning: meaning,
                            onTap: () {
                              if (controller.isDefined$.value) {
                                return;
                              }
                              controller.select(index);
                            },
                            isSelected: selectedIndex == index,
                            isOptionDefined: isDefined,
                          );
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() {
                        final isDefined = controller.isDefined$.value;
                        final isCorrect = controller.isCorrect$.value;
                        final isLoading = controller.isLoading$.value;

                        if (isDefined) {
                          if (isCorrect) {
                            return Column(
                              children: [
                                Text(
                                  'Meus parabéns, Você acertou! 🎉',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                CustomButton(
                                  onTap: () {
                                    controller.resetState();
                                    controller.loadWord();
                                  },
                                  text: 'Próxima palavra',
                                )
                              ],
                            );
                          }

                          return Column(
                            children: [
                              Text(
                                'Infelizmente você errou! 😢',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              CustomButton(
                                onTap: () {
                                  controller.resetState();
                                  controller.loadWord();
                                },
                                text: 'Próxima palavra',
                              )
                            ],
                          );
                        }

                        return CustomButton(
                          onTap: () {
                            controller.define();
                          },
                          text: 'Confirmar',
                          disabled: isDefined || isLoading,
                        );
                      })
                    ],
                  ),
                  const SizedBox(
                    height: 16,
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
