import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:know_your_language/src/core/extensions/color_scheme_extensions.dart';
import 'package:know_your_language/src/core/models/word_model.dart';

class MeaningOption extends StatelessWidget {
  final MeaningModel meaning;
  final Function() onTap;
  final bool isSelected;
  final bool isOptionDefined;

  const MeaningOption({
    super.key,
    required this.meaning,
    required this.onTap,
    required this.isSelected,
    required this.isOptionDefined,
  });

  Color _getBoderColor(BuildContext context) {
    if (isOptionDefined) {
      if (meaning.isFake) {
        return Theme.of(context).colorScheme.error;
      }

      return Theme.of(context).colorScheme.success;
    }

    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            width:
                isOptionDefined && (!meaning.isFake || isSelected) ? 4.0 : 1.0,
            color: _getBoderColor(context),
          ),
        ),
        duration: 200.ms,
        child: Row(
          children: [
            AnimatedSwitcher(
              duration: 200.ms,
              child: isSelected
                  ? Icon(
                      Icons.radio_button_checked,
                      key: UniqueKey(),
                    )
                  : Icon(
                      Icons.radio_button_unchecked,
                      key: UniqueKey(),
                    ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                meaning.value,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
