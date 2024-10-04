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

  PriceUser();

  factory PriceUser.fromJson(Map<String, dynamic> json) =>
      _$PriceUserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PriceUserToJson(this);
}
