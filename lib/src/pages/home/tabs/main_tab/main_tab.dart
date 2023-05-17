import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:know_your_language/src/pages/home/home_page_controller.dart';
import 'package:know_your_language/src/pages/home/widgets/ranking/ranking.dart';

import '../../../../widgets/custom_card.dart';

class MainTab extends GetView<HomePageController> {
  const MainTab({super.key});

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
                                color: Theme.of(context).colorScheme.background,
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
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '100/10000',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
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
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        '/words',
                        arguments: {
                          'mode': 'howItIsWritten',
                        },
                      );
                    },
                    child: CustomCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.edit,
                            size: 48,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text('Como é escrita?'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        '/words',
                        arguments: {
                          'mode': 'whatDoesThatWordMean',
                        },
                      );
                    },
                    child: CustomCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.book,
                            size: 48,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text('O que significa?'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Ranking da semana",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 16,
            ),
            const Ranking(items: []),
            const SizedBox(
              height: 92,
            )
          ],
        ),
      ),
    );
  }
}
