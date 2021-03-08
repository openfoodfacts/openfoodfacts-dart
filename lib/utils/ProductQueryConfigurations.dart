import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';

class ProductQueryConfiguration {
  String barcode;
  OpenFoodFactsLanguage? language;
  // Allow apps to directly provide the language code and country code without
  // having to use the OpenFoodFactsLanguage helper.
  String? lc;
  String? cc;
  List<ProductField>? fields;

  ProductQueryConfiguration(this.barcode,
      {this.language, this.lc, this.cc, this.fields}) {
    fields ??= [ProductField.ALL];
  }

  List<String> getFieldsKeys() {
    List<String> result = [];

    for (ProductField field in fields!) {
      result.add(field.key);
    }

    return result;
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
        String value = '';

        if (fields!.contains(ProductField.CATEGORIES_TAGS_TRANSLATED)) {
          fields!.remove(ProductField.CATEGORIES_TAGS_TRANSLATED);
          value =
              '$value,${ProductField.CATEGORIES_TAGS_TRANSLATED.key}${language.code}';
        }

        if (fields!.contains(ProductField.LABELS_TAGS_TRANSLATED)) {
          fields!.remove(ProductField.LABELS_TAGS_TRANSLATED);
          value =
              '$value,${ProductField.LABELS_TAGS_TRANSLATED.key}${language.code}';
        }

        result.putIfAbsent(
            'fields', () => "$value,${getFieldsKeys().join(',')}");
      }
    }

    return result;
  }
}
