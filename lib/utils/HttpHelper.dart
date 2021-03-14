import 'package:openfoodfacts/utils/UriReader.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import '../model/Status.dart';
import '../model/User.dart';
import 'QueryType.dart';

/// General functions for sending http requests (post, get, multipart, ...)
class HttpHelper {
  static final HttpHelper _singleton = HttpHelper._internal();
  factory HttpHelper() => _singleton;
  HttpHelper._internal();

  static const String USER_AGENT = 'Dart API';
  static const String FROM = 'anonymous';

  /// Send a http get request to the specified uri.
  /// The data of the request (if any) has to be provided as parameter within the uri.
  /// The result of the request will be returned as string.
  /// By default the query will hit the PROD DB
  Future<http.Response> doGetRequest(Uri uri,
      {User? user, QueryType queryType = QueryType.PROD}) async {
    http.Response response = await http.get(uri,
        headers: _buildHeaders(user,
            isTestModeActive: queryType == QueryType.PROD ? false : true));

    return response;
  }

  /// Send a http post request to the specified uri.
  /// The data / body of the request has to be provided as map. (key, value)
  /// The result of the request will be returned as string.
  Future<http.Response> doPostRequest(
      Uri uri, Map<String, String?> body, User user,
      {QueryType queryType = QueryType.PROD}) async {
    http.Response response = await http.post(
      uri,
      headers: _buildHeaders(user,
          isTestModeActive: queryType == QueryType.PROD ? false : true),
      body: body,
    );
    return response;
  }

  /// Send a multipart post request to the specified uri.
  /// The data / body of the request has to be provided as map. (key, value)
  /// The files to send have to be provided as map containing the source file uri.
  /// As result a json object of the "type" Status is expected.
  Future<Status> doMultipartRequest(
      Uri uri, Map<String, String> body, Map<String, Uri> files, User user,
      {QueryType queryType = QueryType.PROD}) async {
    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll(_buildHeaders(user,
            isTestModeActive: queryType == QueryType.PROD ? false : true)
        as Map<String, String>);
    request.headers.addAll({'Content-Type': 'multipart/form-data'});
    request.fields.addAll(body);

    // add all file entries to the request
    for (MapEntry<String, Uri> entry in files.entries) {
      List<int> fileBytes = await UriReader.instance!.readAsBytes(entry.value);
      var multipartFile = http.MultipartFile.fromBytes(entry.key, fileBytes,
          filename: basename(entry.value.toString()));
      request.files.add(multipartFile);
    }

    // get the response status
    Status status = await request.send().then((response) {
      if (response.statusCode == 200) {
        return response.stream.first.then((responseBody) {
          return Status.fromJson(json.decode(utf8.decode(responseBody)));
        });
      } else {
        return Status(status: response.statusCode);
      }
    });
    return status;
  }

  /// build the request headers
  /// By default isTestMode is false
  Map<String, String>? _buildHeaders(User? user,
      {bool isTestModeActive = false}) {
    Map<String, String>? headers = {};
    headers.addAll({'Accept': 'application/json'});
    headers.addAll({
      'UserAgent':
          (user != null && user.comment != null) ? user.comment! : USER_AGENT
    });
    headers.addAll(
        {'From': (user != null && user.userId != null) ? user.userId! : FROM});

    if (isTestModeActive) {
      var token = 'Basic ' + base64Encode(utf8.encode('off:off'));
      headers.addAll({'authorization': token});
    }

    return headers;
  }
}
