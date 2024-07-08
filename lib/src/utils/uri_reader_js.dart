import 'uri_reader.dart';

UriReader getUriReaderInstance() => UriReaderJs();

/// Reader of URI data, "web" version
class UriReaderJs extends UriReader {
  @override
  Future<List<int>> readFileAsBytes(final Uri uri) async =>
      throw Exception('Cannot read files in web version');

  @override
  bool get isWeb => true;
}
