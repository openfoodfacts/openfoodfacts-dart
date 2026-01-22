import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';
import '../utils/country_helper.dart';
import '../utils/json_helper.dart';
import '../utils/language_helper.dart';

part 'user_details.g.dart';

/// User details extracted from login operation.
@JsonSerializable()
class UserDetails extends JsonObject {
  @JsonKey()
  final String? name;

  @JsonKey(
    name: 'preferred_language',
    toJson: LanguageHelper.toNullableJson,
    fromJson: LanguageHelper.fromNullableJson,
  )
  final OpenFoodFactsLanguage? preferredLanguage;

  @JsonKey(
    name: 'cc',
    toJson: CountryHelper.toJson,
    fromJson: CountryHelper.fromJson,
  )
  final OpenFoodFactsCountry? country;

  @JsonKey(
    name: 'moderator',
    toJson: JsonHelper.boolToJSON,
    fromJson: JsonHelper.boolFromJSON,
  )
  final bool? isModerator;

  @JsonKey(
    name: 'admin',
    toJson: JsonHelper.boolToJSON,
    fromJson: JsonHelper.boolFromJSON,
  )
  final bool? isAdmin;

  const UserDetails({
    this.name,
    this.preferredLanguage,
    this.country,
    this.isModerator,
    this.isAdmin,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);

  @override
  String toString() =>
      'UserDetails('
      'name:$name'
      ',preferredLanguage:$preferredLanguage'
      ',country:$country'
      ',isAdmin:$isAdmin'
      ',isModerator:$isModerator'
      ')';
}
