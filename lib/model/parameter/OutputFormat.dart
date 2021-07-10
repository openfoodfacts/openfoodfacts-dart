import 'package:openfoodfacts/interface/Parameter.dart';

/// "Output format" search API parameter
class OutputFormat extends Parameter {
  @override
  String getName() {
    switch (format) {
      case Format.XML:
        return 'xml';

      case Format.JQM:
        return 'jqm';

      case Format.JSON:
      default:
        return 'json';
    }
  }

  @override
  String getValue() => '1';

  final Format? format;

  const OutputFormat({this.format});
}

/// Possible output formats for search API
enum Format {
  JSON,
  XML,
  JQM,
}
