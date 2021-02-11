import 'package:openfoodfacts/interface/Parameter.dart';

class SearchSimple extends Parameter {
  @override
  String getName() {
    return "search_type";
  }

  @override
  String getValue() {
    return active ? "1" : "0";
  }

  final bool active;

  const SearchSimple({this.active = true});
}
