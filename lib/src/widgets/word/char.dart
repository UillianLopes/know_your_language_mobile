import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Char extends StatelessWidget {
  final bool hidden;
  final Color color;
  final String char;

  const Char({
    super.key,
    required this.hidden,
    required this.color,
    required this.char,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: color,
      ),
      duration: 200.ms,
      child: AnimatedSwitcher(
        duration: 200.ms,
        child: hidden
            ? const Icon(Icons.lock)
            : FittedBox(
                fit: BoxFit.fill,
                child: Text(char.toUpperCase()),
              ),
      ),
    );
  }
}
