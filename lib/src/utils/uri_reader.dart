import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'uri_reader_stub.dart'
    if (dart.library.io) 'uri_reader_io.dart'
    if (dart.library.js) 'uri_reader_js.dart';

/// Abstract reader of URI data, declined in "not web" and "web" versions
abstract class UriReader {
  static UriReader? _instance;

  static UriReader? get instance {
    _instance ??= getUriReaderInstance();
    return _instance;
  }

  Future<List<int>> readAsBytes(final Uri uri) async {
    final Uint8List? content = uri.data?.contentAsBytes();
    if (content != null) {
      return content;
    }
    switch (uri.scheme) {
      case '':
      case 'file':
        return await readFileAsBytes(uri);
      case 'http':
      case 'https':
        final http.Response response = await http.get(uri);
        return response.bodyBytes;
    }
    throw Exception('Unknown uri scheme for $uri');
  }

  Future<List<int>> readFileAsBytes(final Uri uri);
}
