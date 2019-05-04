import 'package:openfoodfacts/interface/Parameter.dart';

class OutputFormat extends Parameter {

  @override
  String getName() {
    switch(format) {
      case Format.XML:
        return "xml";

      case Format.JQM:
        return "jqm";

      case Format.JSON:
      default:
        return "json";
    };
  }

  @override
  String getValue() {
    return "1";
  }

  final Format format;

  const OutputFormat({
    this.format
  });
}

enum Format {
  JSON,
  XML,
  JQM,
}