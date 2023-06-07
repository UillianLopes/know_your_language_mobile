import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:know_your_language/src/pages/home/home_page_controller.dart';

import '../../../../widgets/custom_card.dart';

class MainTab extends GetView<HomePageController> {
  const MainTab({super.key});

  _buildGameModeCard(
    BuildContext context, {
    required IconData icon,
    required String content,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: CustomCard(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 48,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Estatísticas",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                controller.animateToPage(2);
              },
              child: CustomCard(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            ClipOval(
                              child: Container(
                                height: 80,
                                width: 80,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: Center(
                                child: Text(
                                  '100%',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Palavras conhecidas',
                                softWrap: true,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                    ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '100/10000',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                        ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
                  .animate(onPlay: (c) => c.repeat())
                  .shimmer(delay: 2000.ms, duration: 1000.ms),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Escolha como quer jogar",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: _buildGameModeCard(
                    context,
                    content: 'Qual é a palavra?',
                    icon: Icons.edit,
                    onTap: () {
                      Get.toNamed('/guess-word');
                    },
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: _buildGameModeCard(
                    context,
                    content: 'O que significa?',
                    icon: Icons.book,
                    onTap: () {
                      Get.toNamed('/guess-meaning');
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
