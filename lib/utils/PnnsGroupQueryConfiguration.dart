import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/AbstractQueryConfiguration.dart';
import 'package:openfoodfacts/utils/PnnsGroups.dart';

// TODO: deprecated from 2021-07-13 (#92); remove when old enough
@Deprecated('Use PnnsGroup2Filter with ProductSearchQueryConfiguration instead')
class PnnsGroupQueryConfiguration extends AbstractQueryConfiguration {
  PnnsGroup2 group;
  int page;

  PnnsGroupQueryConfiguration(
    this.group, {
    final OpenFoodFactsLanguage? language,
    final String? lc,
    final String? cc,
    final List<ProductField>? fields,
    this.page = 1,
  }) : super(
          language: language,
          lc: lc,
          cc: cc,
          fields: fields,
        );

  /// Returns the [fields] as [String]s
  List<String> getFieldsKeys() {
    List<String> result = [];

    if (fields != null) {
      for (ProductField field in fields!) {
        result.add(field.key);
      }
    }

    return result;
  }

  @override
  Map<String, String> getParametersMap() {
    final Map<String, String> result = super.getParametersMap();

    // explicit json output
    result.putIfAbsent('json', () => '1');

    return result;
  }

  @override
  String getUriPath() => '/pnns-group-2/${group.id}/$page';
}
