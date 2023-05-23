class _Response {
  final String? message;

  _Response({this.message});
}

class SingleResponse<T> extends _Response {
  T? data;

  SingleResponse({this.data, String? message}) : super(message: message);

  factory SingleResponse.fromJson(
    Map<String, dynamic> json,
    T? Function(dynamic) decoder,
  ) {
    return SingleResponse(
      message: json['message'],
      data: decoder(json['data']),
    );
  }

  toJson(
    Map<String, dynamic>? Function(T?) encoder,
  ) {
    return {
      'message': message,
      'data': data != null ? encoder(data) : null,
    };
  }
}

class ListResponse<T> extends SingleResponse<List<T>> {}
