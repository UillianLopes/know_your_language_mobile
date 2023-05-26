import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool disabled;
  final Function() onTap;
  final Color? backgroudColor;
  final Color? foregroundColor;
  final String text;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.backgroudColor,
    this.foregroundColor,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: disabled != true ? onTap : null,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: disabled
                      ? Theme.of(context).colorScheme.onSurfaceVariant
                      : Theme.of(
                          context,
                        ).colorScheme.primary,
                ),
                color: disabled
                    ? Theme.of(context).colorScheme.surfaceVariant
                    : backgroudColor,
              ),
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: disabled
                          ? Theme.of(context).colorScheme.onSurfaceVariant
                          : foregroundColor ??
                              Theme.of(context).colorScheme.primary,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
