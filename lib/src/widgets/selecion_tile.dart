import 'package:flutter/material.dart';

class SelectionTile extends StatelessWidget {
  final Function() onTap;
  final String content;
  final Color? backgroundColor;

  const SelectionTile({
    super.key,
    required this.onTap,
    required this.content,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final textBrightness = backgroundColor?.computeLuminance() ?? 0.00;
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        child: Container(
          color: backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              content,
              style: TextStyle(
                color: textBrightness > 0.5 ? Colors.black : Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
