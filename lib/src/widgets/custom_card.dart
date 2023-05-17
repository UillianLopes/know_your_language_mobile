import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;

  const CustomCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).cardColor,
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
