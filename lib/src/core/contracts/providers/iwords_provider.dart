import 'package:know_your_language/src/core/models/response.dart';
import 'package:know_your_language/src/core/models/word_model.dart';

abstract class IWordsProvider {
  Future<ListResponse<WordModel>?> getUnknownWords(GetWordsModel query);

  Future<ListResponse<WordModel>?> getKnownWords(GetWordsModel query);
}
