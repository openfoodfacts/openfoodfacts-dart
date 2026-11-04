import 'get_parameters_helper.dart';
import 'get_price_tags_order.dart';
import 'price_tag_status.dart';

/// Parameters for the "get price tags" API query.
///
/// cf. https://prices.openfoodfacts.org/api/docs
class GetPriceTagsParameters
    extends GetParametersHelper<GetPriceTagsOrderField> {
  DateTime? createdGte;
  DateTime? createdLte;
  int? predictionCount;
  int? predictionCountGte;
  int? predictionCountLte;
  int? priceId;
  int? proofId;
  String? proofOwner;
  String? proofLocationOSMAddressCountryCode;
  bool? proofReadyForPriceTagValidation;
  PriceTagStatus? status;
  bool? statusIsNull;
  String? tagsContains;
  String? tagsNotContains;

  /// Returns the parameters as a query parameter map.
  @override
  Map<String, String> getQueryParameters() {
    super.getQueryParameters();
    addNonNullDate(createdGte, 'created__gte', dayOnly: false);
    addNonNullDate(createdLte, 'created__lte', dayOnly: false);
    addNonNullInt(predictionCount, 'prediction_count');
    addNonNullInt(predictionCountGte, 'prediction_count__gte');
    addNonNullInt(predictionCountLte, 'prediction_count__lte');
    addNonNullInt(priceId, 'price_id');
    addNonNullInt(proofId, 'proof_id');
    addNonNullString(proofOwner, 'proof__owner');
    addNonNullString(
      proofLocationOSMAddressCountryCode,
      'proof__location__osm_address_country_code',
    );
    addNonNullBool(
      proofReadyForPriceTagValidation,
      'proof__ready_for_price_tag_validation',
    );
    addNonNullString(status?.offTag, 'status');
    addNonNullBool(statusIsNull, 'status__isnull');
    addNonNullString(tagsContains, 'tags__contains');
    addNonNullString(tagsNotContains, 'tags__not_contains');
    return result;
  }
}
