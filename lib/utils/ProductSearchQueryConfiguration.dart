import 'package:openfoodfacts/interface/Parameter.dart';
import 'package:openfoodfacts/utils/AbstractQueryConfiguration.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';

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
  }) : super(
          language: language,
          languages: languages,
          country: country,
          fields: fields,
          additionalParameters: parametersList,
        );

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
    return result;
  }

  @override
  String getUriPath() => '/cgi/search.pl';
}
