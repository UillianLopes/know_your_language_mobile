import 'package:flutter/material.dart';
import 'package:know_your_language/src/pages/home/widgets/ranking_item/ranking_item.dart';
import 'package:know_your_language/src/widgets/custom_card.dart';

import '../../../../core/models/ranking_item_model.dart';

class Ranking extends StatelessWidget {
  final List<RankingItemModel> items;

  const Ranking({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: SizedBox(
        height: 400,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ...items.map(
                (item) => RankingItem(
                  item: item,
                  index: items.indexOf(item),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
