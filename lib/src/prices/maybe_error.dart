import 'dart:convert';

import 'package:http/http.dart';

/// Contains a successful value OR an error.
class MaybeError<T> {
  const MaybeError.value(T this._value)
      : error = null,
        statusCode = null,
        isError = false;
  MaybeError.responseError(final Response response)
      : _value = null,
        error = utf8.decode(response.bodyBytes),
        statusCode = response.statusCode,
        isError = true;
  MaybeError.unreadableResponse(final Response response)
      : _value = null,
        error = utf8.decode(response.bodyBytes),
        statusCode = response.statusCode,
        isError = false;
  MaybeError.error({
    required String this.error,
    required int this.statusCode,
  })  : _value = null,
        isError = true;

  final T? _value;
  final bool isError;
  final String? error;
  final int? statusCode;

  T get value => _value!;

  String get detailError {
    try {
      final Map<String, dynamic> json = jsonDecode(error!);
      return json['detail'];
    } catch (e) {
      return error!;
    }
  }
}
