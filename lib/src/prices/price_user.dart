import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';

part 'price_user.g.dart';

/// Price user object.
///
/// cf. `User`  in https://prices.openfoodfacts.org/api/docs
@JsonSerializable()
class PriceUser extends JsonObject {
  @JsonKey(name: 'user_id')
  late String userId;

  /// Number of prices for this user.
  @JsonKey(name: 'price_count')
  int? priceCount;

  /// Number of locations for this user.
  @JsonKey(name: 'location_count')
  int? locationCount;

  /// Number of products for this user.
  @JsonKey(name: 'product_count')
  int? productCount;

  /// Number of proofs for this user.
  @JsonKey(name: 'proof_count')
  int? proofCount;

  @JsonKey(name: 'price_type_product_count')
  int? priceTypeProductCount;

  @JsonKey(name: 'price_type_category_count')
  int? priceTypeCategoryCount;

  @JsonKey(name: 'price_kind_community_count')
  int? priceKindCommunityCount;

  @JsonKey(name: 'price_kind_consumption_count')
  int? priceKindConsumptionCount;

  @JsonKey(name: 'price_currency_count')
  int? priceCurrencyCount;

  @JsonKey(name: 'price_in_proof_owned_count')
  int? priceInProofOwnedCount;

  @JsonKey(name: 'price_in_proof_not_owned_count')
  int? priceInProofNotOwnedCount;

  @JsonKey(name: 'price_not_owned_in_proof_owned_count')
  int? priceNotOwnedInProofOwnedCount;

  @JsonKey(name: 'proof_kind_community_count')
  int? proofKindCommunityCount;

  @JsonKey(name: 'proof_kind_consumption_count')
  int? proofKindConsumptionCount;

  @JsonKey(name: 'location_type_osm_country_count')
  int? locationTypeOsmCountryCount;

  PriceUser();

  factory PriceUser.fromJson(Map<String, dynamic> json) =>
      _$PriceUserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PriceUserToJson(this);
}
