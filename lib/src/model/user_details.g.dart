// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
  name: json['name'] as String?,
  preferredLanguage: LanguageHelper.fromNullableJson(
    json['preferred_language'] as String?,
  ),
  country: CountryHelper.fromJson(json['cc'] as String?),
  isModerator: JsonHelper.boolFromJSON(json['moderator']),
  isAdmin: JsonHelper.boolFromJSON(json['admin']),
);

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'preferred_language': LanguageHelper.toNullableJson(
        instance.preferredLanguage,
      ),
      'cc': CountryHelper.toJson(instance.country),
      'moderator': JsonHelper.boolToJSON(instance.isModerator),
      'admin': JsonHelper.boolToJSON(instance.isAdmin),
    };
