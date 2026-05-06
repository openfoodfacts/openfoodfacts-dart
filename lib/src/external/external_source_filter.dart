import '../model/product.dart';
import '../utils/country_helper.dart';
import '../utils/language_helper.dart';
import 'json_map.dart';

/// External Source Filter.
class ExternalSourceFilter extends JsonMap {
  ExternalSourceFilter(super.jsonMap);

  /// e.g. `["en:eggs"]`
  List<String> get categories =>
      (jsonMap['categories'] as List<dynamic>).map((e) => e as String).toList();

  List<String> get countries =>
      (jsonMap['countries'] as List<dynamic>).map((e) => e as String).toList();

  List<String> get languages =>
      (jsonMap['languages'] as List<dynamic>).map((e) => e as String).toList();

  /// e.g. `["food"]`
  List<String> get productTypes => (jsonMap['product_types'] as List<dynamic>)
      .map((e) => e as String)
      .toList();

  /// Returns the causes of filter rejections, or an empty list if OK.
  List<String> getRejectionCauses(
    final Product product,
    final OpenFoodFactsLanguage language,
    final OpenFoodFactsCountry country,
  ) => <String>[
    if (!acceptsString(product.productType?.offTag, productTypes))
      'productType(${product.productType?.offTag})',
    if (!acceptsListString(product.categoriesTags, categories))
      'categories(${product.categoriesTags})',
    if (!acceptsString(language.offTag, languages))
      'language(${language.offTag})',
    if (!acceptsString(country.offTag, countries)) 'country(${country.offTag})',
  ];

  /// Returns true if a value id part of expected values.
  bool acceptsString(final String? value, final List<String> expectedValues) {
    if (expectedValues.isEmpty) {
      return true;
    }
    if (value == null) {
      return false;
    }
    return expectedValues.contains(value);
  }

  /// Returns true if values and expected values share common... erm... values.
  bool acceptsListString(
    final List<String>? values,
    final List<String> expectedValues,
  ) {
    if (expectedValues.isEmpty) {
      return true;
    }
    if (values == null) {
      return false;
    }
    for (final String value in values) {
      if (expectedValues.contains(value)) {
        return true;
      }
    }
    return false;
  }
}
