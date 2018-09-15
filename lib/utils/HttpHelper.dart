
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'dart:io';
import 'dart:async';
import 'dart:convert';

import '../model/Status.dart';

/// General functions for sending http requests (post, get, multipart, ...)
class HttpHelper {

  /// Send a http post request to the specified uri.
  /// The data / body of the request has to be provided as map. (key, value)
  /// The result of the request will be returned as string.
  static Future<String> doPostRequest(Uri uri, Map<String, String> body) async {
    var url = uri.toString();
    var token = 'Basic ' + base64Encode(utf8.encode('off:off'));

    print("url: " + url);
    print("body: " + body.toString());
    print("token: " + token);

    http.Response response = await http.post(
      url,
      headers: {
        'authorization':token,
        'Accept': 'application/json',
      },
      body: body,
    );

    return response.body;
  }

  /// Send a multipart post request to the specified uri.
  /// The data / body of the request has to be provided as map. (key, value)
  /// The files to send have to be provided as map containing the source file uri.
  /// As result a json object of the "type" Status is expected.
  static Future<Status> doMultipartRequest(Uri uri, Map<String, String> body, Map<String, Uri> files) async {

    var token = 'Basic ' + base64Encode(utf8.encode('off:off'));
    var request = new http.MultipartRequest("POST", uri);
    request.headers.addAll({
      'authorization':token,
      'Accept': 'application/json'});
    request.fields.addAll(body);

    // add all file entries to the request
    for (MapEntry<String, Uri> entry in files.entries) {
      List<int> fileBytes = await File.fromUri(entry.value).readAsBytes();
      print(fileBytes.toString());

      var multipartFile = new http.MultipartFile.fromBytes(
          entry.key,
          fileBytes);
      request.files.add(multipartFile);
    }

    print("body " + body.toString());
    print("files " + files.toString());

    // get the response status
    Status status = await request.send().then((response) {
      if (response.statusCode == 200) {
        return response.stream.first.then((responseBody) {
          //print(utf8.decode(responseBody));
          return Status.fromJson(json.decode(utf8.decode(responseBody)));
        });
      } else {
        print("Error: " + response.statusCode.toString());
      }
    });
    print(status.toJson().toString());
    return status;
  }

  /// Send a http get request to the specified uri.
  /// The data of the request (if any) has to be provided as parameter within the uri.
  /// The result of the request will be returned as string.
  static Future<String> doGetRequest(Uri uri) async {
    var url = uri.toString();
    var token = 'Basic ' + base64Encode(utf8.encode('off:off'));

    print("url: " + url);
    print("token: " + token);

    http.Response response = await http.get(
        url,
        headers: {'authorization':token, 'Accept': 'application/json'}
    );

    return response.body;
  }
}