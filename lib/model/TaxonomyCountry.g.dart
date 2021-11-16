// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaxonomyCountry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonomyCountry _$TaxonomyCountryFromJson(Map<String, dynamic> json) =>
    TaxonomyCountry(
      (json['children'] as List<dynamic>?)?.map((e) => e as String).toList(),
      LanguageHelper.fromJsonStringMap(json['country_code_2']),
      LanguageHelper.fromJsonStringMap(json['country_code_3']),
      LanguageHelper.fromJsonStringMap(json['languages']),
      LanguageHelper.fromJsonStringMap(json['name']),
      LanguageHelper.fromJsonStringMap(json['official_country_code_2']),
      (json['parents'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TaxonomyCountryToJson(TaxonomyCountry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('children', instance.children);
  writeNotNull(
      'country_code_2', LanguageHelper.toJsonStringMap(instance.countryCode2));
  writeNotNull(
      'country_code_3', LanguageHelper.toJsonStringMap(instance.countryCode3));
  writeNotNull('languages', LanguageHelper.toJsonStringMap(instance.languages));
  writeNotNull('name', LanguageHelper.toJsonStringMap(instance.name));
  writeNotNull('official_country_code_2',
      LanguageHelper.toJsonStringMap(instance.officialCountryCode2));
  writeNotNull('parents', instance.parents);
  return val;
}
