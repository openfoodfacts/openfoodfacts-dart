import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';

class ProductQueryConfiguration {
  String barcode;
  List<OpenFoodFactsLanguage> languages;
  // Allow apps to directly provide the language code and country code without
  // having to use the OpenFoodFactsLanguage helper.
  String? lc;
  String? cc;
  List<ProductField>? fields;

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

  ProductQueryConfiguration(this.barcode,
      {this.languages = const [],
      @deprecated OpenFoodFactsLanguage? language,
      this.lc,
      this.cc,
      this.fields}) {
    fields ??= [ProductField.ALL];
    if (languages.isNotEmpty && language != null) {
      throw ArgumentError(
          'Please provide either language or languages, not both');
    }
    if (language != null) {
      languages = [language];
    }
  }

  Map<String, String?> getParametersMap() {
    Map<String, String?> result = {};

    if (language != null) {
      result.putIfAbsent('lc', () => language.code);
    } else if (lc != null) {
      result.putIfAbsent('lc', () => lc);
    }

    if (cc != null) {
      result.putIfAbsent('cc', () => cc);
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

    return result;
  }
}
