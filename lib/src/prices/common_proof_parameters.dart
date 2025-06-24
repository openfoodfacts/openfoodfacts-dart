import '../interface/json_object.dart';
import 'currency.dart';
import 'get_parameters_helper.dart';
import 'location_osm_type.dart';
import 'proof_type.dart';

/// Common parameters for the "upload and update proof" API queries.
///
/// cf. https://prices.openfoodfacts.org/api/docs
abstract class CommonProofParameters extends JsonObject {
  /// Proof type.
  ProofType? get type;

  /// Date when the product was bought.
  DateTime? date;

  /// Currency of the price.
  Currency? currency;

  /// ID of the location in OpenStreetMap.
  int? locationOSMId;

  /// Type of the OpenStreetMap location object.
  LocationOSMType? locationOSMType;

  /// Receipt's number of prices.
  int? receiptPriceCount;

  /// Receipt's total amount (user input).
  num? receiptPriceTotal;

  num? receiptOnlineDeliveryCosts;

  bool? readyForPriceTagValidation;

  bool? ownerConsumption;

  String? ownerComment;

  int? locationId;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        if (type != null) 'type': type!.offTag,
        if (date != null) 'date': GetParametersHelper.formatDate(date!),
        if (currency != null) 'currency': currency!.name,
        if (locationOSMId != null) 'location_osm_id': locationOSMId,
        if (locationOSMType != null)
          'location_osm_type': locationOSMType!.offTag,
        if (receiptPriceCount != null) 'receipt_price_count': receiptPriceCount,
        if (receiptPriceTotal != null) 'receipt_price_total': receiptPriceTotal,
        if (receiptOnlineDeliveryCosts != null)
          'receipt_online_delivery_costs': receiptOnlineDeliveryCosts,
        if (readyForPriceTagValidation != null)
          'ready_for_price_tag_validation': readyForPriceTagValidation,
        if (ownerConsumption != null) 'owner_consumption': ownerConsumption,
        if (ownerComment != null) 'owner_comment': ownerComment,
        if (locationId != null) 'location_id': locationId,
      };
}
