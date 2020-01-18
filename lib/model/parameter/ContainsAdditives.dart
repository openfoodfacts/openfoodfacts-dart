import 'package:openfoodfacts/interface/Parameter.dart';

class ContainsAdditives extends Parameter {
  @override
  String getName() {
    return "additives";
  }

  @override
  String getValue() {
    return filter ? "without" : "";
  }

  final bool filter;

  const ContainsAdditives({this.filter});
}
