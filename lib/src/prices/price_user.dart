import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';

part 'price_user.g.dart';

/// Price user object.
///
/// cf. `UserBase`  in https://prices.openfoodfacts.org/api/docs
@JsonSerializable()
class PriceUser extends JsonObject {
  @JsonKey(name: 'user_id')
  late String userId;

  /// Number of prices for this user.
  @JsonKey(name: 'price_count')
  late int priceCount;

  /// Number of prices for this user.
  @JsonKey(name: 'is_moderator')
  bool? isModerator;

  PriceUser();

  factory PriceUser.fromJson(Map<String, dynamic> json) =>
      _$PriceUserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PriceUserToJson(this);
}
