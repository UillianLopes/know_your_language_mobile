import 'package:know_your_language/src/core/models/response.dart';
import 'package:know_your_language/src/core/models/word_model.dart';

abstract class IWordsProvider {
  Future<SingleResponse<WordModel>?> getUnknownWord();

  Future<SingleResponse<MarkWordAsKnowModel?>?> markAWordAsKnow(
    MarkWordAsKnowPayload payload,
  );

  Future<ListResponse<WordModel>?> getKnownWords(GetWordsPayload query);
}
