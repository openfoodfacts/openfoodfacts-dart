import 'package:http/http.dart';

/// Exception when the server returns "Too many requests".
class TooManyRequestsException implements Exception {
  const TooManyRequestsException();

  /// Start of the response body when the server received too many requests.
  static const String _tooManyRequestsError =
      '<!DOCTYPE html><html><head><meta name="robots" content="noindex"></head><body><h1>TOO MANY REQUESTS</h1>';

  static void check(final Response response) {
    if (response.body.startsWith(_tooManyRequestsError)) {
      throw TooManyRequestsException();
    }
  }

  @override
  String toString() => 'Too many requests';
}
