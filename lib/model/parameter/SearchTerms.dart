import 'package:openfoodfacts/interface/Parameter.dart';

class SearchTerms extends Parameter {
  @override
  String getName() {
    return "search_terms";
  }

  @override
  String getValue() {
    return terms!.join('+');
  }

  final List<String>? terms;

  const SearchTerms({this.terms});
}
