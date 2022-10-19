import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:openfoodfacts/model/UserAgent.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/QueryType.dart';

class _Query {
  _Query(Uri uri, {this.body = const {}, this.files = const {}})
      : uri = uri.toString();

  final String uri;
  final Map<String, String?> body;
  final Map<String, Uri> files;

  bool _deepBodyEqual(Map<String, String?> other) {
    if (body.length != other.length) {
      return false;
    }
    for (final String key in body.keys) {
      if (body[key] != other[key]) {
        return false;
      }
    }
    return true;
  }

  bool _deepFilesEqual(Map<String, Uri> other) {
    if (files.length != other.length) {
      return false;
    }
    for (final String key in files.keys) {
      if (files[key].toString() != other[key].toString()) {
        return false;
      }
    }
    return true;
  }

  @override
  bool operator ==(Object other) {
    if (other is _Query) {
      return uri.toString() == other.uri.toString() &&
          _deepBodyEqual(other.body) &&
          _deepFilesEqual(other.files);
    }
    return false;
  }

  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      uri,
      ...files.keys,
      ...files.values.map<String>((Uri file) => file.toString()),
      ...body.keys,
      ...body.values,
    ]);
  }
}

class FakeHttpHelper extends HttpHelper {
  FakeHttpHelper({this.verbose = false}) : super.internal();

  bool verbose;

  final Map<_Query, http.Response> _responses = <_Query, http.Response>{};
  final Map<_Query, Status> _multipartResponses = <_Query, Status>{};

  final http.Response http404 = http.Response('{"404 - Not Found": true}', 404);

  static http.Response buildResponse(Object? responseJson, {int status = 200}) {
    return http.Response(json.encode(responseJson), status);
  }

  void setResponse(Uri request,
      {http.Response? httpResponse, Object? response, int status = 200}) {
    assert(httpResponse != null || response != null);
    _Query query = _Query(request);
    _responses[query] = httpResponse ?? buildResponse(response, status: status);
  }

  void _logRequest(Uri request, {http.Response? response, Status? status}) {
    assert(response != null || status != null);
    if (verbose) {
      print('Received $request');
      if (response != null) {
        print('Responding with ${response.statusCode}: "${response.body}"');
      }
      if (status != null) {
        print('Responding with status $status"');
      }
    }
  }

  void setPostResponse(
    Uri request,
    Map<String, String?> body, {
    http.Response? httpResponse,
    Object? response,
    int status = 200,
  }) {
    assert(httpResponse != null || response != null);
    final _Query query = _Query(request, body: body);
    _responses[query] = httpResponse ?? buildResponse(response, status: status);
  }

  void setMultipartResponse(
    Uri request,
    Map<String, String?> body,
    http.Response response, {
    Map<String, Uri> files = const {},
  }) {
    final _Query query = _Query(request, body: body, files: files);
    _responses[query] = response;
  }

  @override
  Future<http.Response> doGetRequest(
    Uri uri, {
    User? user,
    UserAgent? userAgent,
    QueryType? queryType,
  }) async {
    final _Query query = _Query(uri);
    http.Response response = _responses[query] ?? http404;
    _logRequest(uri, response: response);
    return response;
  }

  Future<http.Response> doPostRequest(
    Uri uri,
    Map<String, String?> body,
    User? user, {
    QueryType? queryType,
    required bool addCredentialsToBody,
    bool addCredentialsToHeader = false,
  }) async {
    final _Query query = _Query(uri, body: body);
    final http.Response response = _responses[query] ?? http404;
    _logRequest(uri, response: response);
    return response;
  }

  Future<Status> doMultipartRequest(
    Uri uri,
    Map<String, String> body, {
    Map<String, Uri>? files,
    User? user,
    QueryType? queryType,
  }) async {
    final _Query query = _Query(uri, body: body, files: files ?? const {});
    final Status status =
        _multipartResponses[query] ?? Status.fromJson(const {});
    _logRequest(uri, status: status);
    return status;
  }
}
