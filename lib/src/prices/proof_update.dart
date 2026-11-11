import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';
import '../utils/json_helper.dart';
import 'currency.dart';
import 'location_osm_type.dart';
import 'proof_type.dart';

part 'proof_update.g.dart';

/// Updated proof object returned by the server on PATCH.
///
/// cf. `ProofUpdate` in https://prices.openfoodfacts.org/api/docs
@JsonSerializable()
class ProofUpdate extends JsonObject {
  /// ID of the location in OpenStreetMap.
  @JsonKey(name: 'location_osm_id')
  int? locationOSMId;

  /// Type of the OpenStreetMap location object.
  @JsonKey(name: 'location_osm_type')
  LocationOSMType? locationOSMType;

  /// Proof type.
  @JsonKey()
  ProofType? type;

  /// Currency of the price.
  @JsonKey()
  Currency? currency;

  /// Date when the product was bought.
  @JsonKey(fromJson: JsonHelper.nullableStringTimestampToDate)
  DateTime? date;

  /// Receipt's number of prices (user input).
  @JsonKey(name: 'receipt_price_count')
  int? receiptPriceCount;

  /// Receipt's total amount (user input).
  @JsonKey(name: 'receipt_price_total')
  num? receiptPriceTotal;

  /// Receipt's online delivery costs (user input).
  @JsonKey(name: 'receipt_online_delivery_costs')
  num? receiptOnlineDeliveryCosts;

  /// Whether the proof is ready for price tag validation.
  @JsonKey(name: 'ready_for_price_tag_validation')
  bool? readyForPriceTagValidation;

  /// Whether the items were bought for owner consumption.
  @JsonKey(name: 'owner_consumption')
  bool? ownerConsumption;

  /// Owner comment.
  @JsonKey(name: 'owner_comment')
  String? ownerComment;

  /// Location ID.
  @JsonKey(name: 'location_id')
  int? locationId;

  ProofUpdate();

  factory ProofUpdate.fromJson(Map<String, dynamic> json) =>
      _$ProofUpdateFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProofUpdateToJson(this);
}
