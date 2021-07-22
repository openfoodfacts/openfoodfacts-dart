import 'package:openfoodfacts/interface/Parameter.dart';

// TODO: deprecated from 2021-07-13 (#107); remove when old enough
@Deprecated('No use actually; just do not use anymore')
class SearchSimple extends Parameter {
  @override
  String getName() => 'search_type';

  @override
  String getValue() => active ? '1' : '0';

  final bool active;

  const SearchSimple({this.active = true});
}
