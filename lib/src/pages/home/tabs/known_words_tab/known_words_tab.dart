import 'package:flutter/material.dart';
import 'package:know_your_language/src/widgets/custom_card.dart';

class KnownWordsTab extends StatelessWidget {
  const KnownWordsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        CustomCard(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: Column(
            children: const [
              Text('THIS IS A TEST'),
              Text('THIS IS A TEST'),
              Text('THIS IS A TEST'),
            ],
          ),
        ),
      ]),
    );
  }
}
