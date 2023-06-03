import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:know_your_language/src/core/extensions/color_scheme_extensions.dart';
import 'package:know_your_language/src/core/models/word_model.dart';
import 'package:know_your_language/src/widgets/custom_button.dart';

class GessTheWordMeaningResult extends StatelessWidget {
  final MarkWordAsKnowModel result;

  const GessTheWordMeaningResult({
    super.key,
    required this.result,
  });

  Container _buildIsCorrectModal(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(32.0),
      child: Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 32,
              color: Theme.of(context).colorScheme.success,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Parabéns, você acertou!',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '+${result.score} pontos',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Row(
              children: [
                CustomButton(
                  icon: Icons.arrow_back,
                  onTap: () {
                    Get.back();
                    Get.back();
                  },
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CustomButton(
                    onTap: () async {
                      await Future.delayed(200.ms);
                      Get.back(
                        result: 'nextWord',
                      );
                    },
                    text: 'Próxima',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _buildIsIncorrectModal(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(32.0),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 32,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Você errou',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            children: [
              CustomButton(
                onTap: () {
                  Get.back();
                  Get.back();
                },
                icon: Icons.arrow_back,
              ),
              const SizedBox(
                width: 16,
              ),
              if (!result.completed) ...[
                CustomButton(
                  onTap: () {
                    Get.back();
                  },
                  icon: Icons.refresh,
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
              Expanded(
                child: CustomButton(
                    onTap: () async {
                      await Future.delayed(200.ms);
                      Get.back(
                        result: 'incorrectNextWord',
                      );
                    },
                    child: Center(
                      child: Text(
                        'Próxima (+0 pt)',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isCorrect = result.meaningId == result.correctMeaningId;
    final widget = isCorrect
        ? _buildIsCorrectModal(context)
        : _buildIsIncorrectModal(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget,
      ],
    );
  }
}
