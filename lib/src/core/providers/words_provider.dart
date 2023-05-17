import 'package:know_your_language/flavors.dart';

import 'package:know_your_language/src/core/models/response.dart';
import 'package:know_your_language/src/core/contracts/providers/abstracts/with_auth_provider.dart';

import '../contracts/providers/iwords_provider.dart';
import '../models/word_model.dart';

class WordsProvider extends WithAuthProvider implements IWordsProvider {
  WordsProvider(super.storageFacade);

  @override
  Future<ListResponse<WordModel>?> getKnownWords(GetWordsModel query) async {
    try {
      final resposne = await get<ListResponse<WordModel>>(
        '${Flavors.apiUrl}words/known',
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
  Future<ListResponse<WordModel>?> getUnknownWords(GetWordsModel query) async {
    try {
      final resposne = await get<ListResponse<WordModel>>(
        '${Flavors.apiUrl}words/known',
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
}
