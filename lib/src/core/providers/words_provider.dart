import 'package:know_your_language/environment.dart';

import 'package:know_your_language/src/core/models/response.dart';
import 'package:know_your_language/src/core/contracts/providers/abstracts/with_auth_provider.dart';

import '../contracts/providers/iwords_provider.dart';
import '../models/word_model.dart';

class WordsProvider extends WithAuthProvider implements IWordsProvider {
  @override
  Future<ListResponse<WordModel>?> getKnownWords(GetWordsPayload query) async {
    try {
      final resposne = await get<ListResponse<WordModel>>(
        '${Environment.apiUrl}words/known',
        query: query.toJson(),
      );

      if (!resposne.isOk) {
        return null;
      }

      return resposne.body;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<SingleResponse<WordModel>?> getUnknownWord() async {
    try {
      final resposne = await get<SingleResponse<WordModel>>(
        '${Environment.apiUrl}users/words/unknown',
        decoder: (response) {
          return SingleResponse<WordModel>.fromJson(
            response,
            (data) {
              if (data == null) {
                return null;
              }

              return WordModel.fromJson(data);
            },
          );
        },
      );

      if (!resposne.isOk) {
        return null;
      }

      return resposne.body;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<SingleResponse<MarkWordAsKnowModel?>?> markAWordAsKnow(
    MarkWordAsKnowPayload payload,
  ) async {
    try {
      final resposne = await post<SingleResponse<MarkWordAsKnowModel?>>(
        '${Environment.apiUrl}users/words/known',
        payload.toJson(),
        decoder: (response) {
          return SingleResponse<MarkWordAsKnowModel?>.fromJson(
            response,
            (data) {
              if (data == null) {
                return null;
              }

              return MarkWordAsKnowModel.fromJson(data);
            },
          );
        },
      );

      if (!resposne.isOk) {
        return null;
      }

      return resposne.body;
    } catch (e) {
      return null;
    }
  }
}
