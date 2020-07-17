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
        result.putIfAbsent('fields', () => this.getFieldsKeys().join(','));
      }
    }

    return result;
  }
}
