import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:know_your_language/src/core/extensions/color_scheme_extensions.dart';
import 'package:know_your_language/src/widgets/selection_list/selection_list_controller.dart';

class SelecionListOption extends StatelessWidget {
  final Widget child;
  final SelectionListController controller;
  final int index;
  final checkedIcon = Icon(
    Icons.radio_button_checked,
    key: UniqueKey(),
  );

  final uncheckedIcon = Icon(
    Icons.radio_button_unchecked,
    key: UniqueKey(),
  );

  SelecionListOption({
    super.key,
    required this.child,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final incorrectIndexes = controller.incorrectIndexes$.value;
        final isIncorrect = incorrectIndexes.contains(index);

        return InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: isIncorrect || controller.isCompleted$.value
              ? null
              : () {
                  controller.select(index);
                },
          child: Obx(() {
            final isCompleted = controller.isCompleted$.value;
            final correctIndex = controller.correctIndex$.value;
            final selectedIndex = controller.selectedIndex$.value;

            final isSelected = selectedIndex == index;
            final isCorrect = correctIndex == index;

            var foreground = Theme.of(context).colorScheme.onPrimary;
            Color? background = null;

            if (isCompleted) {
              if (isCorrect) {
                foreground = Theme.of(context).colorScheme.success;
              } else {
                foreground = Theme.of(context).colorScheme.error;
              }
            } else if (isIncorrect) {
              foreground = Theme.of(context).colorScheme.error;
              background = Theme.of(context).colorScheme.surfaceVariant;
            }

            return AnimatedContainer(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  width: isCompleted && (isCorrect || isSelected) ? 4.0 : 1.0,
                  color: foreground,
                ),
                color: background,
              ),
              duration: 200.ms,
              child: Row(
                children: [
                  AnimatedSwitcher(
                    duration: 200.ms,
                    child: isSelected ? checkedIcon : uncheckedIcon,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(child: child),
                ],
              ),
            );
          }),
        );
      },
    );
  }
}
