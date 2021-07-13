import 'package:openfoodfacts/interface/Parameter.dart';

// TODO(monsieurtanuki): deprecated from 2021-07-13 (#107) because in fact always JSON; remove when old enough
@deprecated
class OutputFormat extends Parameter {
  @override
  String getName() => 'json';

  @override
  String getValue() => '1';

  final Format? format;

  const OutputFormat({this.format});
}

// TODO(monsieurtanuki): deprecated from 2021-07-13 (#107) because in fact always JSON; remove when old enough
@deprecated
enum Format {
  JSON,
  XML,
  JQM,
}
