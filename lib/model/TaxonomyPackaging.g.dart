// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaxonomyPackaging.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonomyPackaging _$TaxonomyPackagingFromJson(Map<String, dynamic> json) =>
    TaxonomyPackaging()
      ..name = LanguageHelper.fromJsonStringMap(json['name'])
      ..synonyms = LanguageHelper.fromJsonStringsListMap(json['synonyms'])
      ..wikidata = LanguageHelper.fromJsonStringMap(json['wikidata'])
      ..children =
          (json['children'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..parents =
          (json['parents'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$TaxonomyPackagingToJson(TaxonomyPackaging instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', LanguageHelper.toJsonStringMap(instance.name));
  writeNotNull(
      'synonyms', LanguageHelper.toJsonStringsListMap(instance.synonyms));
  writeNotNull('wikidata', LanguageHelper.toJsonStringMap(instance.wikidata));
  writeNotNull('children', instance.children);
  writeNotNull('parents', instance.parents);
  return val;
}
