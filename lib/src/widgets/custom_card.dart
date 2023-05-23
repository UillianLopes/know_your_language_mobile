import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const CustomCard({
    super.key,
    required this.backgroundColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: backgroundColor,
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
