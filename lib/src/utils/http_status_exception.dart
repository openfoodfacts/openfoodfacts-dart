import 'package:http/http.dart';

/// Generic exception for non-success HTTP responses.
class HttpStatusException implements Exception {
  const HttpStatusException({required this.statusCode, required this.message});

  final int statusCode;
  final String message;

  static void check(
    final Response response, {
    List<int> includeCodes = const [],
  }) {
    if ((response.statusCode < 200 || response.statusCode >= 300) &&
        !includeCodes.contains(response.statusCode)) {
      throw HttpStatusException(
        statusCode: response.statusCode,
        message: response.body,
      );
    }
  }

  @override
  String toString() => 'HttpStatusException(statusCode: $statusCode)';
}
