import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';
import '../utils/json_helper.dart';

part 'receipt_item.g.dart';

/// Item of a receipt.
///
/// cf. `ReceiptItemFull` in https://prices.openfoodfacts.org/api/docs
@JsonSerializable()
class ReceiptItem extends JsonObject {
  /// Receipt item ID. Read-only.
  @JsonKey()
  int? id;

  /// The proof linked to this item.
  @JsonKey(name: 'proof_id')
  int? proofId;

  /// The price linked to this item.
  @JsonKey(name: 'price_id')
  int? priceId;

  /// The order of the item in the receipt. Item on top is 1.
  @JsonKey()
  int? order;

  /// A dict representing the predicted data of the receipt item.
  /// For example the product name, the price etc.
  @JsonKey(name: 'predicted_data')
  Map<String, dynamic>? predictedData;

  /// The current status of the item.
  @JsonKey()
  int? status;

  /// The schema version of the predicted data.
  @JsonKey(name: 'schema_version')
  String? schemaVersion;

  /// When the item was created in DB.
  @JsonKey(fromJson: JsonHelper.nullableStringTimestampToDate)
  DateTime? created;

  /// When the item was last updated. Read-only.
  @JsonKey(fromJson: JsonHelper.nullableStringTimestampToDate)
  DateTime? updated;

  /// The proof prediction used to create this receipt item.
  /// Null if created by a user.
  @JsonKey(name: 'proof_prediction')
  int? proofPrediction;

  ReceiptItem();

  factory ReceiptItem.fromJson(Map<String, dynamic> json) =>
      _$ReceiptItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ReceiptItemToJson(this);
}
