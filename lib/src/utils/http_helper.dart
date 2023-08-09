import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:path/path.dart';

import '../model/status.dart';
import '../model/user.dart';
import 'open_food_api_configuration.dart';
import 'query_type.dart';
import 'uri_reader.dart';

/// General functions for sending http requests (post, get, multipart, ...)
class HttpHelper {
  /// Gets the instance
  static HttpHelper get instance => _instance ??= HttpHelper.internal();
  static HttpHelper? _instance;

  @visibleForTesting
  static set instance(HttpHelper value) => _instance = value;

  factory HttpHelper() => instance;

  @protected

  /// A protected constructor to allow subclasses to create themselves.
  HttpHelper.internal();

  static const String USER_AGENT = 'Dart API';
  static const String FROM = 'anonymous';

  /// Adds user agent data to parameters, for statistics purpose
  static Map<String, dynamic>? addUserAgentParameters(
    Map<String, dynamic>? map,
  ) {
    map ??= <String, dynamic>{};
    if (OpenFoodAPIConfiguration.userAgent?.name != null) {
      map['app_name'] = OpenFoodAPIConfiguration.userAgent!.name!;
    }
    if (OpenFoodAPIConfiguration.userAgent?.version != null) {
      map['app_version'] = OpenFoodAPIConfiguration.userAgent!.version!;
    }
    if (OpenFoodAPIConfiguration.uuid != null) {
      map['app_uuid'] = OpenFoodAPIConfiguration.uuid!;
    }
    if (OpenFoodAPIConfiguration.userAgent?.system != null) {
      map['app_platform'] = OpenFoodAPIConfiguration.userAgent?.system ?? '';
    }
    if (OpenFoodAPIConfiguration.userAgent?.comment != null) {
      map['comment'] = OpenFoodAPIConfiguration.userAgent?.comment ?? '';
    }

    if (map.isEmpty) {
      return null;
    }

    return map;
  }

  /// Send a http get request to the specified uri.
  /// The data of the request (if any) has to be provided as parameter within the uri.
  /// The result of the request will be returned as string.
  /// By default the query will hit the PROD DB
  Future<http.Response> doGetRequest(
    Uri uri, {
    User? user,
    QueryType? queryType,
  }) async {
    http.Response response = await http.get(
      uri,
      headers: _buildHeaders(
        user: user,
        isTestModeActive:
            OpenFoodAPIConfiguration.getQueryType(queryType) != QueryType.PROD,
      ),
    );

    return response;
  }

  /// Send a http post request to the specified uri.
  /// The data / body of the request has to be provided as map. (key, value)
  /// The result of the request will be returned as string.
  ///
  /// [addCredentialsToBody] should be only use for Robotoff,
  /// See: https://github.com/openfoodfacts/openfoodfacts-dart/issues/553#issuecomment-1269810032
  /// When using [addCredentialsToBody] a User or globalUser needed, blocks [QueryType.TEST] authentication
  Future<http.Response> doPostRequest(
    Uri uri,
    Map<String, String> body,
    User? user, {
    QueryType? queryType,
    required bool addCredentialsToBody,
    bool addCredentialsToHeader = false,
  }) async {
    if (addCredentialsToBody) {
      if (user != null) {
        body.addAll(user.toData());
      }
    }

    http.Response response = await http.post(
      uri,
      headers: _buildHeaders(
        user: user,
        isTestModeActive:
            OpenFoodAPIConfiguration.getQueryType(queryType) != QueryType.PROD,
        addCredentialsToHeader: addCredentialsToHeader,
      ),
      body: addUserAgentParameters(body),
    );
    return response;
  }

  static const String userInfoForTest = 'off:off';

  /// Send a http PATCH request to the specified uri.
  ///
  /// The data / body of the request has to be provided as map. (key, value)
  /// The result of the request will be returned as string.
  Future<http.Response> doPatchRequest(
    final Uri uri,
    final Map<String, dynamic> body,
    final User? user, {
    final QueryType? queryType,
  }) async =>
      http.patch(
        uri,
        headers: _buildHeaders(
          user: user,
          isTestModeActive: OpenFoodAPIConfiguration.getQueryType(queryType) !=
              QueryType.PROD,
          addCredentialsToHeader: false,
        ),
        body: jsonEncode(addUserAgentParameters(body)),
      );

  /// Send a multipart post request to the specified uri.
  /// The data / body of the request has to be provided as map. (key, value)
  /// The files to send have to be provided as map containing the source file uri.
  /// As result a json object of the "type" Status is expected.
  Future<Status> doMultipartRequest(
    Uri uri,
    Map<String, String> body, {
    Map<String, Uri>? files,
    User? user,
    QueryType? queryType,
  }) async {
    var request = http.MultipartRequest('POST', uri);

    request.headers.addAll(
      _buildHeaders(
        user: user,
        isTestModeActive:
            OpenFoodAPIConfiguration.getQueryType(queryType) != QueryType.PROD,
      ) as Map<String, String>,
    );

    request.headers.addAll({'Content-Type': 'multipart/form-data'});
    addUserAgentParameters(body);
    request.fields.addAll(body);
    if (user != null) {
      request.fields.addAll(user.toData());
    }

    // add all file entries to the request
    if (files != null) {
      for (MapEntry<String, Uri> entry in files.entries) {
        List<int> fileBytes =
            await UriReader.instance!.readAsBytes(entry.value);
        var multipartFile = http.MultipartFile.fromBytes(entry.key, fileBytes,
            filename: basename(entry.value.toString()));
        request.files.add(multipartFile);
      }
    }

    // get the response status
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await _extractResponseAsString(response);
      try {
        return Status.fromJson(jsonDecode(responseBody));
      } catch (e) {
        //When the server returns html instead of json
        return Status(status: 200, body: responseBody);
      }
    } else {
      return Status(
        status: response.statusCode,
        error: response.reasonPhrase,
      );
    }
  }

  Future<String> _extractResponseAsString(
      http.StreamedResponse response) async {
    final Completer<String> completer = Completer<String>();
    final StringBuffer contents = StringBuffer();
    response.stream.transform(utf8.decoder).listen((data) {
      contents.write(data);
    }, onDone: () => completer.complete(contents.toString()));
    return completer.future;
  }

  /// Returns the request headers.
  ///
  /// Note: [addCredentialsToHeader] and [isTestModeActive] exclude each other.
  Map<String, String>? _buildHeaders({
    User? user,
    bool isTestModeActive = false,
    bool addCredentialsToHeader = false,
  }) {
    Map<String, String>? headers = {};

    headers.addAll({
      'Accept': 'application/json',
      'User-Agent':
          OpenFoodAPIConfiguration.userAgent?.toValueString() ?? USER_AGENT,
      'From': OpenFoodAPIConfiguration.getUser(user)?.userId ?? FROM,
    });

    if (isTestModeActive && !addCredentialsToHeader) {
      var token = 'Basic ${base64Encode(utf8.encode(userInfoForTest))}';
      headers.addAll({'Authorization': token});
    }

    if (addCredentialsToHeader) {
      final User? myUser = OpenFoodAPIConfiguration.getUser(user);
      if (myUser != null) {
        final String userId = myUser.userId;
        final String password = myUser.password;
        var token = 'Basic ${base64Encode(utf8.encode('$userId:$password'))}';
        headers.addAll({'Authorization': token});
      }
    }
    return headers;
  }

  /// "Normal" json.decode, with an additional "html" exception.
  ///
  /// Typically, when the OFF server is not happy, it returns an html page.
  /// With this method we display the html page title instead of just a
  /// "it's not a json" exception.
  dynamic jsonDecode(final String string) {
    try {
      return json.decode(string);
    } catch (e) {
      if (string.startsWith('<html>')) {
        throw Exception('JSON expected, html found: ${string.split('\n')[1]}');
      }
      if (string.startsWith('<h1>Software error:</h1>')) {
        throw Exception(
            'JSON expected, software error found: ${string.split('\n')[1]}');
      }
      rethrow;
    }
  }
}
