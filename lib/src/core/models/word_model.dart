import 'package:json_annotation/json_annotation.dart';

part 'word_model.g.dart';

@JsonSerializable()
class MeaningModel {
  final int id;
  final String value;
  final bool isFake;

  MeaningModel({
    required this.id,
    required this.value,
    required this.isFake,
  });

  factory MeaningModel.fromJson(Map<String, dynamic> json) =>
      _$MeaningModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeaningModelToJson(this);
}

@JsonSerializable()
class WordModel {
  final int id;
  final int? incorrectAttempts;
  final String value;
  final List<MeaningModel> meanings;

  const WordModel({
    required this.id,
    required this.value,
    required this.meanings,
    this.incorrectAttempts,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) =>
      _$WordModelFromJson(json);

  Map<String, dynamic> toJson() => _$WordModelToJson(this);
}

@JsonSerializable()
class GetWordsPayload {
  final String filter;
  final int page;

  const GetWordsPayload({
    required this.filter,
    required this.page,
  });

  factory GetWordsPayload.fromJson(Map<String, dynamic> json) =>
      _$GetWordsPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$GetWordsPayloadToJson(this);
}

@JsonSerializable()
class MarkWordAsKnowPayload {
  final int wordId;
  final int? meaningId;
  final bool? force;

  const MarkWordAsKnowPayload({
    required this.wordId,
    this.meaningId,
    this.force,
  });

  factory MarkWordAsKnowPayload.fromJson(Map<String, dynamic> json) =>
      _$MarkWordAsKnowPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$MarkWordAsKnowPayloadToJson(this);
}

@JsonSerializable()
class MarkWordAsKnowModel {
  final int? correctMeaningId;
  final int? meaingId;
  final int? score;
  final int? incorrectAttempts;
  final bool completed;

  const MarkWordAsKnowModel({
    required this.completed,
    this.correctMeaningId,
    this.score,
    this.incorrectAttempts,
    this.meaingId,
  });

  factory MarkWordAsKnowModel.fromJson(Map<String, dynamic> json) =>
      _$MarkWordAsKnowModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarkWordAsKnowModelToJson(this);
}
