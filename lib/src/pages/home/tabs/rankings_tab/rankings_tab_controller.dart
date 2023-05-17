import 'package:get/get.dart';
import 'package:know_your_language/src/core/contracts/providers/irankings_provider.dart';
import 'package:know_your_language/src/core/models/response.dart';

import '../../../../core/models/ranking_item_model.dart';

class RankingsTabController extends GetxController {
  final IRankingsProvider _rankingsProvider;

  final isDailyRankingLoading$ = false.obs;
  final isWeeklyRankingLoading$ = false.obs;
  final isMonthlyRankingLoading$ = false.obs;
  final isYearlyRankingLoading$ = false.obs;

  set _isDailyRankingLoading(bool value) {
    isDailyRankingLoading$.value = value;
  }

  set _isWeeklyRankingLoading(bool value) {
    isWeeklyRankingLoading$.value = value;
  }

  set _isMothlyRankingLoading(bool value) {
    isMonthlyRankingLoading$.value = value;
  }

  set _isYearlyRankingLoading(bool value) {
    isYearlyRankingLoading$.value = value;
  }

  final dailyRanking$ = ListResponse<RankingItemModel>().obs;
  final weeklyRanking$ = ListResponse<RankingItemModel>().obs;
  final monthlyRanking$ = ListResponse<RankingItemModel>().obs;
  final yearlyRanking$ = ListResponse<RankingItemModel>().obs;

  RankingsTabController(this._rankingsProvider);

  @override
  void onInit() {
    super.onInit();

    _loadDailyRanking();
    _loadWeeklyRanking();
    _loadMonthlyRanking();
    _loadYearlyRanking();
  }

  void _loadDailyRanking() {
    _isDailyRankingLoading = true;
    _rankingsProvider.getDailyRanking().then((value) {
      if (value == null) {
        return;
      }

      dailyRanking$.value = value;
    }).whenComplete(() {
      _isDailyRankingLoading = false;
    });
  }

  void _loadWeeklyRanking() {
    _isWeeklyRankingLoading = true;
    _rankingsProvider.getWeeklyRanking().then((value) {
      if (value == null) {
        return;
      }

      weeklyRanking$.value = value;
    }).whenComplete(() {
      _isWeeklyRankingLoading = false;
    });
  }

  void _loadMonthlyRanking() {
    _isMothlyRankingLoading = true;
    _rankingsProvider.getMonthlyRanking().then((value) {
      if (value == null) {
        return;
      }

      monthlyRanking$.value = value;
    }).whenComplete(() {
      _isMothlyRankingLoading = false;
    });
  }

  void _loadYearlyRanking() {
    _isYearlyRankingLoading = true;
    _rankingsProvider.getYearlyRanking().then((value) {
      if (value == null) {
        return;
      }

      yearlyRanking$.value = value;
    }).whenComplete(() {
      _isYearlyRankingLoading = false;
    });
  }
}
