import 'get_parameters_helper.dart';
import 'order_by.dart';

/// Helper class for API query parameters with price count filters.
abstract class GetPriceCountParametersHelper<T extends OrderByField>
    extends GetParametersHelper<T> {
  int? priceCount;
  int? priceCountGte;
  int? priceCountLte;

  /// Returns the parameters as a query parameter map.
  @override
  Map<String, String> getQueryParameters() {
    super.getQueryParameters();
    addNonNullInt(priceCount, 'price_count');
    addNonNullInt(priceCountGte, 'price_count__gte');
    addNonNullInt(priceCountLte, 'price_count__lte');
    return result;
  }
}
