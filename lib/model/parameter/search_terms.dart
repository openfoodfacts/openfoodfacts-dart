import 'package:openfoodfacts/interface/parameter.dart';

/// Term list search API parameter
class SearchTerms extends Parameter {
  @override
  String getName() => 'search_terms';

  @override
  String getValue() => terms.join('+');

  final List<String> terms;

  const SearchTerms({required this.terms});
}
