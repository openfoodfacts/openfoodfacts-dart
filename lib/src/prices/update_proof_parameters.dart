import '../interface/json_object.dart';
import 'currency.dart';
import 'get_parameters_helper.dart';
import 'location_osm_type.dart';
import 'proof_type.dart';

/// Parameters for the "update proof" API query.
///
/// cf. https://prices.openfoodfacts.org/api/docs
class UpdateProofParameters extends JsonObject {
  /// Proof type.
  ProofType? type;

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
      };
}
