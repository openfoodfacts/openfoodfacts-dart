import 'package:openfoodfacts/interface/Parameter.dart';
import 'package:openfoodfacts/model/parameter/TagFilter.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';

/// Product Search Query Configuration, that helps building search API URI
class ProductSearchQueryConfiguration {
  List<OpenFoodFactsLanguage> languages;
  // Allow apps to directly provide the language code and country code without
  // having to use the OpenFoodFactsLanguage helper.
  String? lc;
  String? cc;
  List<ProductField>? fields;
  List<Parameter> parametersList;

  @deprecated
  OpenFoodFactsLanguage? get language =>
      languages.isNotEmpty ? languages.first : null;
  @deprecated
  set language(OpenFoodFactsLanguage? value) {
    languages.clear();
    if (value != null) {
      languages.add(value);
    }
  }

  ProductSearchQueryConfiguration(
      {this.languages = const [],
      @deprecated OpenFoodFactsLanguage? language,
      this.lc,
      this.cc,
      this.fields,
      required this.parametersList}) {
    if (languages.isNotEmpty && language != null) {
      throw ArgumentError(
          'Please provide either language or languages, not both');
    }
    if (language != null) {
      languages = [language];
    }
  }

  List<String> getFieldsKeys() {
    List<String> result = [];

    for (ProductField field in fields!) {
      result.add(field.key);
    }

    return result;
  }

  /// Returns the corresponding search API URI parameter map
  Map<String, String> getParametersMap() {
    var result = <String, String>{};
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

    if (language != null) {
      result.putIfAbsent('lc', () => language!.code);
    } else if (lc != null) {
      result.putIfAbsent('lc', () => lc!);
    }

    if (cc != null) {
      result.putIfAbsent('cc', () => cc!);
    }

    if (fields != null) {
      bool ignoreFieldsFilter = false;
      for (ProductField field in fields!) {
        if (field == ProductField.ALL) {
          ignoreFieldsFilter = true;
          break;
        }
      }
      if (!ignoreFieldsFilter) {
        final fieldsStrings = convertFieldsToStrings(fields!, languages);
        result.putIfAbsent('fields', () => fieldsStrings.join(','));
      }
    }

    // explicit json output
    result.putIfAbsent('json', () => '1');

    return result;
  }
}
