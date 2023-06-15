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
class GuessMeaningPayloadModel {
  final int wordId;
  final int? meaningId;
  final bool? force;

  const GuessMeaningPayloadModel({
    required this.wordId,
    this.meaningId,
    this.force,
  });

  factory GuessMeaningPayloadModel.fromJson(Map<String, dynamic> json) =>
      _$GuessMeaningPayloadModelFromJson(json);

  Map<String, dynamic> toJson() => _$GuessMeaningPayloadModelToJson(this);
}

@JsonSerializable()
class GuessMeaningResponseModel {
  final int? correctMeaningId;
  final int? meaningId;
  final int? score;
  final int? incorrectAttempts;
  final bool completed;

  const GuessMeaningResponseModel({
    required this.completed,
    this.correctMeaningId,
    this.score,
    this.incorrectAttempts,
    this.meaningId,
  });

  factory GuessMeaningResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GuessMeaningResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GuessMeaningResponseModelToJson(this);
}
