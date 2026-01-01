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
  if (LanguageHelper.toJsonStringMap(instance.languageCode2) case final value?)
    'language_code_2': value,
  if (LanguageHelper.toJsonStringMap(instance.languageCode3) case final value?)
    'language_code_3': value,
  if (LanguageHelper.toJsonStringMap(instance.name) case final value?)
    'name': value,
  if (LanguageHelper.toJsonStringMap(instance.wikidata) case final value?)
    'wikidata': value,
};
