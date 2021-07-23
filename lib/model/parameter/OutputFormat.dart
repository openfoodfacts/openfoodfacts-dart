import 'package:openfoodfacts/interface/Parameter.dart';

// TODO: deprecated from 2021-07-13 (#107); remove when old enough
@Deprecated('Pointless because in fact always JSON; just do not use it anymore')
class OutputFormat extends Parameter {
  @override
  String getName() => 'json';

  @override
  String getValue() => '1';

  final Format? format;

  const OutputFormat({this.format});
}

// TODO: deprecated from 2021-07-13 (#107); remove when old enough
@Deprecated('Pointless because in fact always JSON; just do not use it anymore')
enum Format {
  JSON,
  XML,
  JQM,
}
