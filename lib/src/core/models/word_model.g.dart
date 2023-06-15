// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeaningModel _$MeaningModelFromJson(Map<String, dynamic> json) => MeaningModel(
      id: json['id'] as int,
      value: json['value'] as String,
      isFake: json['isFake'] as bool,
    );

Map<String, dynamic> _$MeaningModelToJson(MeaningModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'isFake': instance.isFake,
    };

WordModel _$WordModelFromJson(Map<String, dynamic> json) => WordModel(
      id: json['id'] as int,
      value: json['value'] as String,
      meanings: (json['meanings'] as List<dynamic>)
          .map((e) => MeaningModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      incorrectAttempts: json['incorrectAttempts'] as int?,
    );

Map<String, dynamic> _$WordModelToJson(WordModel instance) => <String, dynamic>{
      'id': instance.id,
      'incorrectAttempts': instance.incorrectAttempts,
      'value': instance.value,
      'meanings': instance.meanings,
    };

GetWordsPayload _$GetWordsPayloadFromJson(Map<String, dynamic> json) =>
    GetWordsPayload(
      filter: json['filter'] as String,
      page: json['page'] as int,
    );

Map<String, dynamic> _$GetWordsPayloadToJson(GetWordsPayload instance) =>
    <String, dynamic>{
      'filter': instance.filter,
      'page': instance.page,
    };

GuessMeaningPayloadModel _$GuessMeaningPayloadModelFromJson(
        Map<String, dynamic> json) =>
    GuessMeaningPayloadModel(
      wordId: json['wordId'] as int,
      meaningId: json['meaningId'] as int?,
      force: json['force'] as bool?,
    );

Map<String, dynamic> _$GuessMeaningPayloadModelToJson(
        GuessMeaningPayloadModel instance) =>
    <String, dynamic>{
      'wordId': instance.wordId,
      'meaningId': instance.meaningId,
      'force': instance.force,
    };

GuessMeaningResponseModel _$GuessMeaningResponseModelFromJson(
        Map<String, dynamic> json) =>
    GuessMeaningResponseModel(
      completed: json['completed'] as bool,
      correctMeaningId: json['correctMeaningId'] as int?,
      score: json['score'] as int?,
      incorrectAttempts: json['incorrectAttempts'] as int?,
      meaningId: json['meaningId'] as int?,
    );

Map<String, dynamic> _$GuessMeaningResponseModelToJson(
        GuessMeaningResponseModel instance) =>
    <String, dynamic>{
      'correctMeaningId': instance.correctMeaningId,
      'meaningId': instance.meaningId,
      'score': instance.score,
      'incorrectAttempts': instance.incorrectAttempts,
      'completed': instance.completed,
    };

GuessWordPayloadModel _$GuessWordPayloadModelFromJson(
        Map<String, dynamic> json) =>
    GuessWordPayloadModel(
      wordId: json['wordId'] as int,
      word: json['word'] as String,
      force: json['force'] as bool?,
    );

Map<String, dynamic> _$GuessWordPayloadModelToJson(
        GuessWordPayloadModel instance) =>
    <String, dynamic>{
      'wordId': instance.wordId,
      'word': instance.word,
      'force': instance.force,
    };

GuessWordResponseModel _$GuessWordResponseModelFromJson(
        Map<String, dynamic> json) =>
    GuessWordResponseModel(
      completed: json['completed'] as bool,
      score: json['score'] as int?,
      incorrectAttempts: json['incorrectAttempts'] as int?,
    );

Map<String, dynamic> _$GuessWordResponseModelToJson(
        GuessWordResponseModel instance) =>
    <String, dynamic>{
      'score': instance.score,
      'incorrectAttempts': instance.incorrectAttempts,
      'completed': instance.completed,
    };
