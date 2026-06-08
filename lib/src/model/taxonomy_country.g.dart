// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxonomy_country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonomyCountry _$TaxonomyCountryFromJson(Map<String, dynamic> json) =>
    TaxonomyCountry()
      ..countryCode2 = LanguageHelper.fromJsonStringMapIsoUnique(
        json['country_code_2'],
      )
      ..countryCode3 = LanguageHelper.fromJsonStringMapIsoUnique(
        json['country_code_3'],
      )
      ..languages = LanguageHelper.fromJsonStringMapIsoList(
        json['language_codes'],
      )
      ..name = LanguageHelper.fromJsonStringMap(json['name'])
      ..synonyms = LanguageHelper.fromJsonStringMapList(json['synonyms'])
      ..wikidata = LanguageHelper.fromJsonStringMapIsoUnique(json['wikidata'])
      ..officialCountryCode2 = LanguageHelper.fromJsonStringMapIsoUnique(
        json['official_country_code_2'],
      );

Map<String, dynamic> _$TaxonomyCountryToJson(
  TaxonomyCountry instance,
) => <String, dynamic>{
  'country_code_2': ?LanguageHelper.toJsonStringMapIsoUnique(
    instance.countryCode2,
  ),
  'country_code_3': ?LanguageHelper.toJsonStringMapIsoUnique(
    instance.countryCode3,
  ),
  'language_codes': ?LanguageHelper.toJsonStringMapIsoList(instance.languages),
  'name': ?LanguageHelper.toJsonStringMap(instance.name),
  'synonyms': ?LanguageHelper.toJsonStringMapList(instance.synonyms),
  'wikidata': ?LanguageHelper.toJsonStringMapIsoUnique(instance.wikidata),
  'official_country_code_2': ?LanguageHelper.toJsonStringMapIsoUnique(
    instance.officialCountryCode2,
  ),
};
