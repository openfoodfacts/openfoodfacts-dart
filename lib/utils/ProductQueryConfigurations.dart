import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';

class ProductQueryConfiguration {
  String barcode;
  OpenFoodFactsLanguage language;
  List<ProductField> fields;


  ProductQueryConfiguration(this.barcode, {this.language = OpenFoodFactsLanguage.WORLD,
    this.fields}){
    fields ??= [ProductField.ALL];
  }

  List<String> getFieldsKeys() {
    List<String> result = List<String>();

    for (ProductField field in fields) {
      result.add(field.key);
    }

    return result;
  }

  Map<String, String> getParametersMap() {
    Map<String, String> result = Map<String, String>();

    if (this.language != null) {
      result.putIfAbsent("lc", () => language.code);
    }

    if (this.fields != null) {
      bool ignoreFieldsFilter = false;
      for (ProductField field in fields) {
        if (field == ProductField.ALL) {
          ignoreFieldsFilter = true;
          break;
        }
      }

      if (!ignoreFieldsFilter) {

        String value = '';

        if(fields.contains(ProductField.CATEGORIES_TAGS_TRANSLATED)) {
          fields.remove(ProductField.CATEGORIES_TAGS_TRANSLATED);
          value = "$value,${ProductField.CATEGORIES_TAGS_TRANSLATED.key}${language.code}";
        }

        if(fields.contains(ProductField.LABELS_TAGS_TRANSLATED)) {
          fields.remove(ProductField.LABELS_TAGS_TRANSLATED);
          value = "$value,${ProductField.LABELS_TAGS_TRANSLATED.key}${language.code}";
        }

        result.putIfAbsent('fields', () => "$value,${this.getFieldsKeys().join(',')}");
      }
    }

    return result;
  }
}
