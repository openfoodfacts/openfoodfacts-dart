import 'package:openfoodfacts/interface/Parameter.dart';

// TODO(monsieurtanuki): deprecated from 2021-07-13 (#107) because useless; remove when old enough
@deprecated
class SearchSimple extends Parameter {
  @override
  String getName() => 'search_type';

  @override
  String getValue() => active ? '1' : '0';

  final bool active;

  const SearchSimple({this.active = true});
}
