import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';
import '../utils/json_helper.dart';

part 'price_total_stats.g.dart';

/// Total stats for Prices.
///
/// cf. `TotalStats` in https://prices.openfoodfacts.org/api/docs
@JsonSerializable()
class PriceTotalStats extends JsonObject {
  @JsonKey(name: 'price_count')
  int? priceCount;

  @JsonKey(name: 'price_type_product_code_count')
  int? priceTypeProductCodeCount;

  @JsonKey(name: 'price_type_category_tag_count')
  int? priceTypeCategoryTagCount;

  @JsonKey(name: 'product_count')
  int? productCount;

  @JsonKey(name: 'product_with_price_count')
  int? productWithPriceCount;

  @JsonKey(name: 'location_count')
  int? locationCount;

  @JsonKey(name: 'location_with_price_count')
  int? locationWithPriceCount;

  @JsonKey(name: 'proof_count')
  int? proofCount;

  @JsonKey(name: 'proof_with_price_count')
  int? proofWithPriceCount;

  @JsonKey(name: 'proof_type_price_tag_count')
  int? proofTypePriceTagCount;

  @JsonKey(name: 'proof_type_receipt_count')
  int? proofTypeReceiptCount;

  @JsonKey(name: 'user_count')
  int? userCount;

  @JsonKey(name: 'user_with_price_count')
  int? userWithPriceCount;

  @JsonKey(fromJson: JsonHelper.nullableStringTimestampToDate)
  DateTime? updated;

  PriceTotalStats();

  factory PriceTotalStats.fromJson(Map<String, dynamic> json) =>
      _$PriceTotalStatsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PriceTotalStatsToJson(this);
}
