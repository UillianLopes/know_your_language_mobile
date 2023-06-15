import 'package:flutter/material.dart';
import 'package:know_your_language/src/core/extensions/color_scheme_extensions.dart';
import 'package:know_your_language/src/widgets/word/char.dart';

enum WordStatus { correct, incorrect, hidden }

class Word extends StatelessWidget {
  final String word;
  final WordStatus status;

  const Word({
    super.key,
    required this.word,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Color color = Theme.of(context).colorScheme.primaryContainer;

              switch (status) {
                case WordStatus.correct:
                  color = Theme.of(context).colorScheme.success;
                  break;
                case WordStatus.incorrect:
                  color = Theme.of(context).colorScheme.error;
                  break;
                case WordStatus.hidden:
                  color = Theme.of(context).colorScheme.primaryContainer;
                  break;
              }

              return Char(
                char: word[index],
                hidden: status == WordStatus.hidden,
                color: color,
              );
            },
            separatorBuilder: (contex, builder) => const SizedBox(
              width: 8,
            ),
            itemCount: word.length,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text('Tamanho: ${word.length}')
      ],
    );
  }
}
