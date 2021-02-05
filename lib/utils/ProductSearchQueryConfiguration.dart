import 'package:openfoodfacts/interface/Parameter.dart';
import 'package:openfoodfacts/model/parameter/TagFilter.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';

class ProductSearchQueryConfiguration {
  OpenFoodFactsLanguage language;
  // Allow apps to directly provide the language code and country code without
  // having to use the OpenFoodFactsLanguage helper.
  String lc;
  String cc;
  List<ProductField> fields;
  List<Parameter> parametersList;

  ProductSearchQueryConfiguration(
      {this.language, this.lc, this.cc, this.fields, this.parametersList});

  List<String> getFieldsKeys() {
    List<String> result = List<String>();

    for (ProductField field in fields) {
      result.add(field.key);
    }

    return result;
  }

  Map<String, String> getParametersMap() {
    var result = new Map<String, String>();
    int filterTagCount = 0;
    for (Parameter p in parametersList) {
      if (p is TagFilter) {
        TagFilter tf = p;
        result.putIfAbsent("tagtype_$filterTagCount", () => tf.getTagType());
        result.putIfAbsent(
            "tag_contains_$filterTagCount", () => tf.getContains());
        result.putIfAbsent("tag_$filterTagCount", () => tf.getTagName());
        filterTagCount++;
      } else {
        result.putIfAbsent(p.getName(), () => p.getValue());
      }
    }
    result.putIfAbsent('search_terms', () => "");

    if (this.language != null) {
      result.putIfAbsent("lc", () => language.code);
    } else if (this.lc != null) {
      result.putIfAbsent("lc", () => lc);
    }

    if (this.cc != null) {
      result.putIfAbsent("cc", () => cc);
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

        if (fields.contains(ProductField.CATEGORIES_TAGS_TRANSLATED)) {
          fields.remove(ProductField.CATEGORIES_TAGS_TRANSLATED);
          value =
              "$value,${ProductField.CATEGORIES_TAGS_TRANSLATED.key}${language.code}";
        }

        if (fields.contains(ProductField.LABELS_TAGS_TRANSLATED)) {
          fields.remove(ProductField.LABELS_TAGS_TRANSLATED);
          value =
              "$value,${ProductField.LABELS_TAGS_TRANSLATED.key}${language.code}";
        }

        result.putIfAbsent(
            'fields', () => "$value,${this.getFieldsKeys().join(',')}");
      }
    }

    return result;
  }
}
