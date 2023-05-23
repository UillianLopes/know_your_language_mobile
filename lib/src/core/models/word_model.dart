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
  final String value;
  final List<MeaningModel> meanings;

  const WordModel({
    required this.id,
    required this.value,
    required this.meanings,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) =>
      _$WordModelFromJson(json);

  Map<String, dynamic> toJson() => _$WordModelToJson(this);
}

class GetWordsModel {
  final String filter;
  final int page;

  const GetWordsModel({
    required this.filter,
    required this.page,
  });

  Map<String, dynamic> toJson() {
    return {
      'filter': filter,
      'page': page,
    };
  }
}
