import 'package:openfoodfacts/interface/Parameter.dart';

// TODO(teolemon): find what this parameter is all about
class SearchSimple extends Parameter {
  @override
  String getName() => 'search_type';

  @override
  String getValue() => active ? '1' : '0';

  final bool active;

  const SearchSimple({this.active = true});
}
