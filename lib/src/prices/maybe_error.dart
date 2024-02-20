import 'dart:convert';

import 'package:http/http.dart';

/// Contains a successful value OR an error.
class MaybeError<T> {
  const MaybeError.value(T this._value)
      : error = null,
        statusCode = null;
  MaybeError.responseError(final Response response)
      : _value = null,
        error = utf8.decode(response.bodyBytes),
        statusCode = response.statusCode;
  MaybeError.error({
    required String this.error,
    required int this.statusCode,
  }) : _value = null;

  final T? _value;
  final String? error;
  final int? statusCode;

  bool get isError => _value == null;

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
