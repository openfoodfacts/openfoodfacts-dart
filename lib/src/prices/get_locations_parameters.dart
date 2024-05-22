import 'get_locations_order.dart';
import 'get_price_count_parameters_helper.dart';

/// Parameters for the "get locations" API query.
///
/// cf. https://prices.openfoodfacts.org/api/docs
class GetLocationsParameters
    extends GetPriceCountParametersHelper<GetLocationsOrderField> {
  String? osmNameLike;
  String? osmCityLike;
  String? osmPostcodeLike;
  String? osmCountryLike;

  @override
  Map<String, String> getQueryParameters() {
    super.getQueryParameters();
    addNonNullString(osmNameLike, 'osm_name__like');
    addNonNullString(osmCityLike, 'osm_address_city__like');
    addNonNullString(osmPostcodeLike, 'osm_address_postcode__like');
    addNonNullString(osmCountryLike, 'osm_address_country__like');
    return result;
  }
}
