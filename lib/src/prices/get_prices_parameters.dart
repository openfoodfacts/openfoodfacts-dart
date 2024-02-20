import 'currency.dart';
import 'get_parameters_helper.dart';
import 'get_prices_order.dart';
import 'location_osm_type.dart';

/// Parameters for the "get prices" API query.
///
/// cf. https://prices.openfoodfacts.org/api/docs
class GetPricesParameters extends GetParametersHelper {
  String? productCode;
  int? productId;
  bool? productIdIsNull;
  String? categoryTag;
  String? labelsTagsLike;
  String? originsTagsLike;
  int? locationOSMId;
  LocationOSMType? locationOSMType;
  int? locationId;
  Currency? currency;
  DateTime? date;
  DateTime? dateGt;
  DateTime? dateGte;
  DateTime? dateLt;
  DateTime? dateLte;
  String? owner;
  DateTime? createdGte;
  List<GetPricesOrder>? getPricesOrder;

  @override
  Map<String, String> getQueryParameters() {
    super.getQueryParameters();
    addNonNullString(productCode, 'product_code');
    addNonNullInt(productId, 'product_id');
    addNonNullBool(productIdIsNull, 'product_id__isnull');
    addNonNullString(categoryTag, 'category_tag');
    addNonNullString(labelsTagsLike, 'labels_tags__like');
    addNonNullString(originsTagsLike, 'origins_tags__like');
    addNonNullInt(locationOSMId, 'location_osm_id');
    addNonNullString(locationOSMType?.offTag, 'location_osm_type');
    addNonNullInt(locationId, 'location_id');
    addNonNullString(currency?.name, 'currency');
    addNonNullDate(date, 'date', dayOnly: true);
    addNonNullDate(dateGt, 'date__gt', dayOnly: true);
    addNonNullDate(dateGte, 'date__gte', dayOnly: true);
    addNonNullDate(dateLt, 'date__lt', dayOnly: true);
    addNonNullDate(dateLte, 'date__lte', dayOnly: true);
    addNonNullString(owner, 'owner');
    addNonNullDate(createdGte, 'created__gte', dayOnly: false);
    if (getPricesOrder != null) {
      final List<String> orders = <String>[];
      for (final GetPricesOrder order in getPricesOrder!) {
        orders.add(order.offTag);
      }
      if (orders.isNotEmpty) {
        addNonNullString(orders.join(','), 'order_by');
      }
    }
    return result;
  }
}
