import 'package:http/http.dart';

/// Generic exception for non-success HTTP responses.
class HttpStatusException implements Exception {
  const HttpStatusException({required this.statusCode, required this.body});

  final int statusCode;
  final String body;

  static void check(final Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw HttpStatusException(
        statusCode: response.statusCode,
        body: response.body,
      );
    }
  }

  @override
  String toString() => 'HttpStatusException(statusCode: $statusCode)';
}
