import 'get_locations_order.dart';
import 'order_by.dart';
import 'get_parameters_helper.dart';

/// Parameters for the "get locations" API query.
///
/// cf. https://prices.openfoodfacts.org/api/docs
class GetLocationsParameters extends GetParametersHelper {
  String? osmNameLike;
  String? osmCityLike;
  String? osmPostcodeLike;
  String? osmCountryLike;
  int? priceCount;
  int? priceCountGte;
  int? priceCountLte;
  List<OrderBy<GetLocationsOrderField>>? orderBy;

  @override
  Map<String, String> getQueryParameters() {
    super.getQueryParameters();
    addNonNullString(osmNameLike, 'osm_name__like');
    addNonNullString(osmCityLike, 'osm_address_city__like');
    addNonNullString(osmPostcodeLike, 'osm_address_postcode__like');
    addNonNullString(osmCountryLike, 'osm_address_country__like');
    addNonNullInt(priceCount, 'price_count');
    addNonNullInt(priceCountGte, 'price_count__gte');
    addNonNullInt(priceCountLte, 'price_count__lte');
    if (orderBy != null) {
      final List<String> orders = <String>[];
      for (final OrderBy order in orderBy!) {
        orders.add(order.offTag);
      }
      if (orders.isNotEmpty) {
        addNonNullString(orders.join(','), 'order_by');
      }
    }
    return result;
  }
}
