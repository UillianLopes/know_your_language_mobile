class WordModel {
  final String value;
  final String description;
  final List<String> descriptionOptions;
  final List<String> valueOptions;

  const WordModel({
    required this.value,
    required this.description,
    required this.descriptionOptions,
    required this.valueOptions,
  });
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
