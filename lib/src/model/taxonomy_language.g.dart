// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxonomy_language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonomyLanguage _$TaxonomyLanguageFromJson(Map<String, dynamic> json) =>
    TaxonomyLanguage(
      LanguageHelper.fromJsonStringMap(json['language_code_2']),
      LanguageHelper.fromJsonStringMap(json['language_code_3']),
      LanguageHelper.fromJsonStringMap(json['name']),
      LanguageHelper.fromJsonStringMap(json['wikidata']),
    );

Map<String, dynamic> _$TaxonomyLanguageToJson(
  TaxonomyLanguage instance,
) => <String, dynamic>{
  'language_code_2': ?LanguageHelper.toJsonStringMap(instance.languageCode2),
  'language_code_3': ?LanguageHelper.toJsonStringMap(instance.languageCode3),
  'name': ?LanguageHelper.toJsonStringMap(instance.name),
  'wikidata': ?LanguageHelper.toJsonStringMap(instance.wikidata),
};
