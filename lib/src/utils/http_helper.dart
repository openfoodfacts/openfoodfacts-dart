import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';

import '../model/status.dart';
import '../model/user.dart';
import 'open_food_api_configuration.dart';
import 'uri_helper.dart';
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

  static const String FROM = 'anonymous';

  /// Adds user agent data to parameters, for statistics purpose
  static Map<String, dynamic> addUserAgentParameters(
    Map<String, dynamic>? map,
  ) {
    if (OpenFoodAPIConfiguration.userAgent == null) {
      throw Exception('A User-Agent must be set before calling this method');
    }
    map ??= <String, dynamic>{};
    map['app_name'] = OpenFoodAPIConfiguration.userAgent!.name;

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

    return map;
  }

  /// Send a http get request to the specified uri.
  ///
  /// The data of the request (if any) has to be provided as parameter within
  /// the uri.
  Future<http.Response> doGetRequest(
    Uri uri, {
    User? user,
    required final UriHelper uriHelper,
    final String? bearerToken,
  }) async {
    http.Response response = await http.get(
      uri,
      headers: _buildHeaders(
        user: user,
        uriHelper: uriHelper,
        addCredentialsToHeader: false,
        bearerToken: bearerToken,
      ),
    );

    return response;
  }

  /// Send a http post request to the specified uri.
  ///
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
    required final UriHelper uriHelper,
    required bool addCredentialsToBody,
    bool addCredentialsToHeader = false,
  }) async {
    if (addCredentialsToBody) {
      if (user != null) {
        body.addAll(user.toData());
      }
    }

    return http.post(
      uri,
      headers: _buildHeaders(
        user: user,
        uriHelper: uriHelper,
        addCredentialsToHeader: addCredentialsToHeader,
      ),
      body: addUserAgentParameters(body),
    );
  }

  /// Sends an http DELETE request to the specified uri.
  Future<http.Response> doDeleteRequest(
    Uri uri, {
    User? user,
    required final UriHelper uriHelper,
    final String? bearerToken,
  }) async =>
      http.delete(
        uri,
        headers: _buildHeaders(
          user: user,
          uriHelper: uriHelper,
          addCredentialsToHeader: false,
          bearerToken: bearerToken,
        ),
      );

  /// Sends an http POST request to the specified uri with a JSON body.
  Future<http.Response> doPostJsonRequest(
    final Uri uri,
    final String jsonBody, {
    required final UriHelper uriHelper,
    required final String bearerToken,
  }) async =>
      http.post(
        uri,
        headers: _getBearerHeader(bearerToken),
        body: jsonBody,
      );

  static const String userInfoForTest = 'off:off';

  /// Send a http PATCH request to the specified uri.
  ///
  /// The data / body of the request has to be provided as map. (key, value)
  /// The result of the request will be returned as string.
  Future<http.Response> doPatchRequest(
    final Uri uri,
    final Map<String, dynamic> body,
    final User? user, {
    required final UriHelper uriHelper,
  }) async =>
      http.patch(
        uri,
        headers: _buildHeaders(
          user: user,
          uriHelper: uriHelper,
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
    required final UriHelper uriHelper,
  }) async {
    var request = http.MultipartRequest('POST', uri);

    request.headers.addAll(
      _buildHeaders(
        user: user,
        uriHelper: uriHelper,
        addCredentialsToHeader: false,
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
      String responseBody = await extractResponseAsString(response);
      try {
        return Status.fromJson(jsonDecode(responseBody));
      } catch (e) {
        //When the server returns html instead of JSON
        return Status(status: 200, body: responseBody);
      }
    } else {
      return Status(
        status: response.statusCode,
        error: response.reasonPhrase,
      );
    }
  }

  Future<String> extractResponseAsString(http.StreamedResponse response) async {
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
  Map<String, String>? _getBearerHeader(
    final String bearerToken,
  ) =>
      <String, String>{
        'Authorization': 'bearer $bearerToken',
        'Content-Type': 'application/json',
      };

  /// Returns the request headers.
  ///
  /// Note: [addCredentialsToHeader] and [isTestModeActive] exclude each other.
  Map<String, String>? _buildHeaders({
    User? user,
    required final UriHelper uriHelper,
    required bool addCredentialsToHeader,
    final String? bearerToken,
  }) {
    if (bearerToken != null) {
      return _getBearerHeader(bearerToken);
    }

    Map<String, String>? headers = {};

    if (OpenFoodAPIConfiguration.userAgent == null) {
      throw Exception('A User-Agent must be set before calling this method');
    }

    headers.addAll({
      'Accept': 'application/json',
      'User-Agent': OpenFoodAPIConfiguration.userAgent!.toValueString(),
      'From': _getSafeString(
        OpenFoodAPIConfiguration.getUser(user)?.userId ?? FROM,
      ),
    });

    final bool isTestModeActive = uriHelper.isTestMode;
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
      if (string.startsWith('<!DOCTYPE html>')) {
        const String titleOpen = '<title>';
        const String titleClose = '</title>';
        int pos1 = string.indexOf(titleOpen);
        if (pos1 >= 0) {
          pos1 += titleOpen.length;
          final int pos2 = string.indexOf(titleClose);
          if (pos2 >= 0 && pos1 < pos2) {
            throw Exception(
                'JSON expected, server error found: ${string.substring(pos1, pos2)}');
          }
        }
      }
      rethrow;
    }
  }

  /// json.decode, with utf8 conversion and additional "html" exception.
  dynamic jsonDecodeUtf8(final http.Response response) =>
      jsonDecode(utf8.decode(response.bodyBytes));

  /// Returns true if the [input] string is ISO-8859-1 encoded.
  static bool _isIso88591(final String input) {
    try {
      latin1.encode(input);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Returns the [input] string if ISO-8859-1 encoded, or a safer version of it
  ///
  /// Used for HTTP headers, that do not accept any other charset.
  /// Here instead of encoding systematically, we keep ISO-8859-1 inputs and
  /// only encode the other "problematic" inputs.
  /// cf. https://github.com/openfoodfacts/openfoodfacts-dart/issues/829
  static String _getSafeString(final String input) {
    if (_isIso88591(input)) {
      return input;
    }
    return base64Encode(utf8.encode(input));
  }

  /// Returns the probable media type associated to that filename.
  MediaType? imagineMediaType(final String filename) {
    String ext = extension(filename);
    if (ext.isEmpty) {
      return null;
    }
    ext = ext.substring(1).toLowerCase();
    switch (ext) {
      case 'jpg':
      case 'jpeg':
        return MediaType('image', 'jpeg');
      case 'png':
        return MediaType('image', 'png');
      case 'webp':
        return MediaType('image', 'webp');
    }
    return null;
  }
}
