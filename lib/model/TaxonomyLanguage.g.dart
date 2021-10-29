// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaxonomyLanguage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonomyLanguage _$TaxonomyLanguageFromJson(Map<String, dynamic> json) =>
    TaxonomyLanguage(
      (json['children'] as List<dynamic>?)?.map((e) => e as String).toList(),
      LanguageHelper.fromJsonStringMap(json['language_code_2']),
      LanguageHelper.fromJsonStringMap(json['language_code_3']),
      LanguageHelper.fromJsonStringMap(json['name']),
      (json['parents'] as List<dynamic>?)?.map((e) => e as String).toList(),
      LanguageHelper.fromJsonStringMap(json['wikidata']),
    );

Map<String, dynamic> _$TaxonomyLanguageToJson(TaxonomyLanguage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('children', instance.children);
  writeNotNull('language_code_2',
      LanguageHelper.toJsonStringMap(instance.languageCode2));
  writeNotNull('language_code_3',
      LanguageHelper.toJsonStringMap(instance.languageCode3));
  writeNotNull('name', LanguageHelper.toJsonStringMap(instance.name));
  writeNotNull('parents', instance.parents);
  writeNotNull('wikidata', LanguageHelper.toJsonStringMap(instance.wikidata));
  return val;
}
