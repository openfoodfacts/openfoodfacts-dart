// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaxonomyLanguage.dart';

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

Map<String, dynamic> _$TaxonomyLanguageToJson(TaxonomyLanguage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('language_code_2',
      LanguageHelper.toJsonStringMap(instance.languageCode2));
  writeNotNull('language_code_3',
      LanguageHelper.toJsonStringMap(instance.languageCode3));
  writeNotNull('name', LanguageHelper.toJsonStringMap(instance.name));
  writeNotNull('wikidata', LanguageHelper.toJsonStringMap(instance.wikidata));
  return val;
}
