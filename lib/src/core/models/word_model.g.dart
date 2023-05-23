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
    );

Map<String, dynamic> _$WordModelToJson(WordModel instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'meanings': instance.meanings,
    };
