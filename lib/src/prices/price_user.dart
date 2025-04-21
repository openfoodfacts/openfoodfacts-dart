import '../interface/json_object.dart';

/// Price user object.
///
/// cf. `User`  in https://prices.openfoodfacts.org/api/docs
class PriceUser extends JsonObject {
  final Map<String, dynamic> json;

  PriceUser(this.json);

  factory PriceUser.fromJson(Map<String, dynamic> json) => PriceUser(json);

  String get userId => json['user_id'] as String;

  /// Number of prices for this user.
  int? get priceCount => getInt('price_count');

  /// Number of locations for this user.
  int? get locationCount => getInt('location_count');

  /// Number of products for this user.
  int? get productCount => getInt('product_count');

  /// Number of proofs for this user.
  int? get proofCount => getInt('proof_count');

  int? get priceTypeProductCount => getInt('price_type_product_count');
  int? get priceTypeCategoryCount => getInt('price_type_category_count');
  int? get priceKindCommunityCount => getInt('price_kind_community_count');
  int? get priceKindConsumptionCount => getInt('price_kind_consumption_count');
  int? get priceCurrencyCount => getInt('price_currency_count');
  int? get priceInProofOwnedCount => getInt('price_in_proof_owned_count');
  int? get priceInProofNotOwnedCount =>
      getInt('price_in_proof_not_owned_count');
  int? get priceNotOwnedInProofOwnedCount =>
      getInt('price_not_owned_in_proof_owned_count');
  int? get proofKindCommunityCount => getInt('proof_kind_community_count');
  int? get proofKindConsumptionCount => getInt('proof_kind_consumption_count');
  int? get locationTypeOsmCountryCount =>
      getInt('location_type_osm_country_count');

  int? getInt(String key) => json.containsKey(key) ? json[key] as int? : null;

  @override
  Map<String, dynamic> toJson() => json;
}
