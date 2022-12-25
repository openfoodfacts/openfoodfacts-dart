import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/abstract_query_configuration.dart';
import 'package:openfoodfacts/utils/country_helper.dart';

/// Query Configuration for search parameters
class ProductSearchQueryConfiguration extends AbstractQueryConfiguration {
  /// See [AbstractQueryConfiguration.languages] for
  /// parameter's description.
  ProductSearchQueryConfiguration({
    final OpenFoodFactsLanguage? language,
    final List<OpenFoodFactsLanguage> languages = const [],
    final OpenFoodFactsCountry? country,
    final List<ProductField>? fields,
    required List<Parameter> parametersList,
    this.version = ProductQueryVersion.v3,
  }) : super(
          language: language,
          languages: languages,
          country: country,
          fields: fields,
          additionalParameters: parametersList,
        );

  final ProductQueryVersion version;

  List<String> getFieldsKeys() {
    List<String> result = [];

    for (ProductField field in fields!) {
      result.add(field.offTag);
    }

    return result;
  }

  @override
  Map<String, String> getParametersMap() {
    final Map<String, String> result = super.getParametersMap();
    result.putIfAbsent('search_terms', () => '');
    // explicit json output
    result.putIfAbsent('json', () => '1');
    result.putIfAbsent('api_version', () => '${version.version}');
    return result;
  }

  @override
  String getUriPath() => '/cgi/search.pl';
}
