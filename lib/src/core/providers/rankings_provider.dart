import 'package:know_your_language/src/core/contracts/providers/abstracts/with_auth_provider.dart';
import 'package:know_your_language/src/core/contracts/providers/irankings_provider.dart';
import 'package:know_your_language/src/core/models/response.dart';
import 'package:know_your_language/src/core/models/ranking_item_model.dart';

import '../../../environment.dart';

class RankingsProvider extends WithAuthProvider implements IRankingsProvider {
  @override
  Future<ListResponse<RankingItemModel>?> getDailyRanking() async {
    try {
      final response = await get<ListResponse<RankingItemModel>>(
        '${Environment.apiUrl}/rankings/daily',
      );

      if (!response.isOk) {
        return null;
      }

      return response.body;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<ListResponse<RankingItemModel>?> getWeeklyRanking() async {
    try {
      final response = await get<ListResponse<RankingItemModel>>(
        '${Environment.apiUrl}/rankings/weekly',
      );

      if (!response.isOk) {
        return null;
      }

      return response.body;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<ListResponse<RankingItemModel>?> getMonthlyRanking() async {
    try {
      final response = await get<ListResponse<RankingItemModel>>(
        '${Environment.apiUrl}/rankings/monthly',
      );

      if (!response.isOk) {
        return null;
      }

      return response.body;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<ListResponse<RankingItemModel>?> getYearlyRanking() async {
    try {
      final response = await get<ListResponse<RankingItemModel>>(
        '${Environment.apiUrl}/rankings/yearly',
      );

      if (!response.isOk) {
        return null;
      }

      return response.body;
    } catch (e) {
      return null;
    }
  }
}
