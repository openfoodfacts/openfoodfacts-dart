import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';

/// Abstract Query Configuration, that helps build API URI
abstract class AbstractQueryConfiguration {
  OpenFoodFactsLanguage? language;
  // Allow apps to directly provide the language code and country code without
  // having to use the OpenFoodFactsLanguage helper.
  String? lc;
  String? cc;
  List<ProductField>? fields;

  AbstractQueryConfiguration({
    this.language,
    this.lc,
    this.cc,
    this.fields,
  }) {
    fields ??= [ProductField.ALL];
  }

  /// Returns the corresponding API URI parameter map
  Map<String, String> getParametersMap() {
    final Map<String, String> result = {};

    if (language != null) {
      result.putIfAbsent('lc', () => language.code);
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
        final fieldsStrings = convertFieldsToStrings(fields!, language);
        result.putIfAbsent('fields', () => fieldsStrings.join(','));
      }
    }

    return result;
  }
}
