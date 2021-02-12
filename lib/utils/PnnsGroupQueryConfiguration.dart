import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/PnnsGroups.dart';

class PnnsGroupQueryConfiguration {
  PnnsGroup2 group;
  OpenFoodFactsLanguage language;
  List<ProductField> fields;
  int page;

  PnnsGroupQueryConfiguration(this.group,
      {this.language, this.fields, this.page = 1});

  List<String> getFieldsKeys() {
    List<String> result = [];

    for (ProductField field in fields) {
      result.add(field.key);
    }

    return result;
  }

  Map<String, String> getParametersMap() {
    Map<String, String> result = {};

    if (language != null) {
      result.putIfAbsent("lc", () => language.code);
    }

    if (fields != null) {
      bool ignoreFieldsFilter = false;
      for (ProductField field in fields) {
        if (field == ProductField.ALL) {
          ignoreFieldsFilter = true;
          break;
        }
      }

      if (!ignoreFieldsFilter) {
        result.putIfAbsent('fields', () => getFieldsKeys().join(','));
      }
    }

    return result;
  }
}
