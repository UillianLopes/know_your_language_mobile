import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:know_your_language/src/pages/home/tabs/rankings_tab/rankings_tab_controller.dart';
import 'package:know_your_language/src/pages/home/widgets/ranking/ranking.dart';
import 'package:know_your_language/src/widgets/custom_card.dart';

class RankingsTab extends GetView<RankingsTabController> {
  const RankingsTab({super.key});

  CustomCard _buildEmptyData(BuildContext context) {
    return CustomCard(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.warning,
            size: 48,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Sem dados suficientes...',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
        ],
      ),
    );
  }

  Text _buildTitle(String title, BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Obx _buildDailyRanking(BuildContext context) {
    return Obx(() {
      if (controller.isDailyRankingLoading$.value) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: const CircularProgressIndicator.adaptive(),
        );
      }

      final dailyRanking = controller.dailyRanking$.value.data;

      if (dailyRanking == null) {
        return _buildEmptyData(context);
      }

      return Ranking(
        items: dailyRanking,
      );
    });
  }

  Obx _buildWeeklyRanking(BuildContext context) {
    return Obx(() {
      if (controller.isWeeklyRankingLoading$.value) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: const CircularProgressIndicator.adaptive(),
        );
      }

      final weeklyRanking = controller.weeklyRanking$.value.data;

      if (weeklyRanking == null) {
        return _buildEmptyData(context);
      }

      return Ranking(
        items: weeklyRanking,
      );
    });
  }

  Obx _buildMonthlyRanking(BuildContext context) {
    return Obx(() {
      if (controller.isMonthlyRankingLoading$.value) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: const CircularProgressIndicator.adaptive(),
        );
      }

      final monthlyRanking = controller.monthlyRanking$.value.data;

      if (monthlyRanking == null) {
        return _buildEmptyData(context);
      }

      return Ranking(
        items: monthlyRanking,
      );
    });
  }

  Obx _buildYearlyRanking(BuildContext context) {
    return Obx(() {
      if (controller.isYearlyRankingLoading$.value) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: const CircularProgressIndicator.adaptive(),
        );
      }

      final yearlyRanking = controller.yearlyRanking$.value.data;

      if (yearlyRanking == null) {
        return _buildEmptyData(context);
      }

      return Ranking(
        items: yearlyRanking,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle('Ranking diário', context),
            const SizedBox(
              height: 16,
            ),
            _buildDailyRanking(context),
            const SizedBox(
              height: 16,
            ),
            _buildTitle('Ranking semanal', context),
            const SizedBox(
              height: 16,
            ),
            _buildWeeklyRanking(context),
            const SizedBox(
              height: 16,
            ),
            _buildTitle('Ranking mensal', context),
            const SizedBox(
              height: 16,
            ),
            _buildMonthlyRanking(context),
            const SizedBox(
              height: 16,
            ),
            _buildTitle('Ranking anual', context),
            const SizedBox(
              height: 16,
            ),
            _buildYearlyRanking(context),
            const SizedBox(
              height: 92,
            )
          ],
        ),
      ),
    );
  }
}
