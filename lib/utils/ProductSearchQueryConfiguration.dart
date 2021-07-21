import 'package:openfoodfacts/interface/Parameter.dart';
import 'package:openfoodfacts/model/parameter/TagFilter.dart';
import 'package:openfoodfacts/utils/AbstractQueryConfiguration.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';

/// Query Configuration for search parameters
class ProductSearchQueryConfiguration extends AbstractQueryConfiguration {
  final List<Parameter> parametersList;

  /// See [AbstractQueryConfiguration.languages] for
  /// parameter's description.
  ProductSearchQueryConfiguration({
    final OpenFoodFactsLanguage? language,
    final List<OpenFoodFactsLanguage> languages = const [],
    final String? lc,
    final String? cc,
    final List<ProductField>? fields,
    required this.parametersList,
  }) : super(
          language: language,
          languages: languages,
          lc: lc,
          cc: cc,
          fields: fields,
        );

  List<String> getFieldsKeys() {
    List<String> result = [];

    for (ProductField field in fields!) {
      result.add(field.key);
    }

    return result;
  }

  @override
  Map<String, String> getParametersMap() {
    final Map<String, String> result = super.getParametersMap();

    int filterTagCount = 0;
    for (Parameter p in parametersList) {
      if (p is TagFilter) {
        TagFilter tf = p;
        result.putIfAbsent('tagtype_$filterTagCount', () => tf.getTagType());
        result.putIfAbsent(
            'tag_contains_$filterTagCount', () => tf.getContains());
        result.putIfAbsent('tag_$filterTagCount', () => tf.getTagName());
        filterTagCount++;
      } else {
        result.putIfAbsent(p.getName(), () => p.getValue());
      }
    }
    result.putIfAbsent('search_terms', () => '');

    // explicit json output
    result.putIfAbsent('json', () => '1');

    return result;
  }
}
