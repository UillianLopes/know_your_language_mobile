import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:know_your_language/src/core/models/ranking_item_model.dart';

class RankingItem extends StatelessWidget {
  final RankingItemModel item;
  final int index;

  const RankingItem({super.key, required this.item, required this.index});

  _getColor(BuildContext context) {
    switch (index) {
      case 1:
        return Colors.yellow[600];
      case 2:
        return Colors.blueGrey[200];
      case 3:
        return Colors.brown[400];

      default:
        return Theme.of(context).canvasColor;
    }
  }

  _getCircle(BuildContext context) {
    final stack = Stack(
      children: [
        ClipOval(
          child: Container(
            height: 40,
            width: 40,
            color: Theme.of(context).canvasColor,
          ),
        ),
        Positioned(
          top: (40 / 2) - (24 / 2),
          left: (40 / 2) - (24 / 2),
          child: Icon(
            Icons.workspace_premium,
            size: 24,
            color: _getColor(context),
          ),
        )
      ],
    );

    if (index <= 3) {
      return stack
          .animate(onPlay: (c) => c.repeat())
          .shimmer(delay: 5000.ms, duration: 1000.ms);
    }

    return stack;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _getCircle(context),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 2),
          child: Text(
            '${item.points}',
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
        )
      ],
    );
  }
}
