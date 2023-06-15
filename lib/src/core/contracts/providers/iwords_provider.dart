import 'package:know_your_language/src/core/models/response.dart';
import 'package:know_your_language/src/core/models/word_model.dart';

abstract class IWordsProvider {
  Future<ListResponse<WordModel>?> getKnownWords(GetWordsPayload query);

  Future<SingleResponse<WordModel>?> getUnknownWord();

  Future<SingleResponse<GuessMeaningResponseModel?>?> guessMeaning(
    GuessMeaningPayloadModel payload,
  );

  Future<SingleResponse<GuessWordResponseModel?>?> guessWord(
    GuessWordPayloadModel payload,
  );
}
