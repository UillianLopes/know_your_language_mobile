import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:know_your_language/src/pages/guess_meaning/guess_meaning_page_controller.dart';
import 'package:know_your_language/src/widgets/custom_button.dart';
import 'package:know_your_language/src/widgets/custom_safe_area.dart';
import 'package:know_your_language/src/widgets/selection_list/selection_list.dart';
import 'package:know_your_language/src/widgets/toolbar.dart';

class GuessMeaningPage extends GetView<GuessMeaningPageController> {
  const GuessMeaningPage({super.key});

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
                  Text(
                    'Você sabe o que significa?',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      word.value.toLowerCase(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                    ),
                  )
                      .animate(
                        onPlay: (controller) => controller.repeat(),
                      )
                      .shimmer(
                        delay: 2000.ms,
                        duration: 200.ms,
                      ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: SelectionList(
                      controller: controller.meaningsListController,
                      builder: (context, item) => Text(item.value),
                      placeholder: const Text('Lista vazia...'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Obx(
                          () {
                            final isLoading = controller.isLoading$.value;

                            return CustomButton(
                              onTap: () {
                                controller.confirm();
                              },
                              text: 'Confirmar',
                              disabled: isLoading,
                            );
                          },
                        ),
                      )
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
