import 'package:flutter/material.dart';
import 'package:know_your_language/src/widgets/custom_safe_area.dart';
import 'package:know_your_language/src/widgets/toolbar.dart';

class WordsPage extends StatelessWidget {
  final Map<String, String?>? parameters;

  const WordsPage({super.key, this.parameters});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        appBar: Toolbar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Qual das seguintes opções é uma palavra que existe?',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
