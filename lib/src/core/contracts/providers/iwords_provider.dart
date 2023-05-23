import 'package:know_your_language/src/core/models/response.dart';
import 'package:know_your_language/src/core/models/word_model.dart';

abstract class IWordsProvider {
  Future<SingleResponse<WordModel>?> getUnknownWord();

  Future<SingleResponse<int?>?> markAWordAsKnow(int wordId, int points);

  Future<ListResponse<WordModel>?> getKnownWords(GetWordsModel query);
}
