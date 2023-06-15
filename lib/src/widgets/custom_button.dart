import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool disabled;
  final Function() onTap;
  final Color? backgroudColor;
  final Color? foregroundColor;
  final Widget? child;
  final String? text;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.onTap,
    this.text,
    this.child,
    this.icon,
    this.backgroudColor,
    this.foregroundColor,
    this.disabled = false,
  });

  _buildContent(BuildContext context) {
    if (child != null) {
      return child;
    }

    Icon? _icon;
    Text? _text;

    if (icon != null) {
      _icon = Icon(icon);
    }

    if (text != null) {
      _text = Text(
        text!,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: disabled
                  ? Theme.of(context).colorScheme.onSurfaceVariant
                  : foregroundColor ?? Theme.of(context).colorScheme.primary,
              overflow: TextOverflow.ellipsis,
            ),
        softWrap: true,
      );
    }

    return Row(
      children: [
        if (_icon != null) _icon,
        if (_text != null) Expanded(child: _text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: disabled != true ? onTap : null,
        child: Container(
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
          child: _buildContent(context),
        ),
      ),
    );
  }
}
