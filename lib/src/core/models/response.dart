class _Response {
  final String? message;

  _Response({this.message});
}

class SingleResponse<T> extends _Response {
  T? data;

  SingleResponse({this.data, String? message}) : super(message: message);

  factory SingleResponse.fromJson(
    Map<String, dynamic> json,
    T? Function(Map<String, dynamic>?) decoder,
  ) {
    return SingleResponse(
      message: json['message'],
      data: decoder(json['data']),
    );
  }
}

class ListResponse<T> extends SingleResponse<List<T>> {}
