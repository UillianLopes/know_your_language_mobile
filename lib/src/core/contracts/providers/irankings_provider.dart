import 'package:know_your_language/src/core/models/ranking_item_model.dart';
import 'package:know_your_language/src/core/models/response.dart';

abstract class IRankingsProvider {
  Future<ListResponse<RankingItemModel>?> getDailyRanking();

  Future<ListResponse<RankingItemModel>?> getWeeklyRanking();

  Future<ListResponse<RankingItemModel>?> getMonthlyRanking();

  Future<ListResponse<RankingItemModel>?> getYearlyRanking();
}
