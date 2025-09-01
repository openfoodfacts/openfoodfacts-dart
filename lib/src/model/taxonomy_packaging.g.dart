// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxonomy_packaging.dart';

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

Map<String, dynamic> _$TaxonomyPackagingToJson(TaxonomyPackaging instance) =>
    <String, dynamic>{
      if (LanguageHelper.toJsonStringMap(instance.name) case final value?)
        'name': value,
      if (LanguageHelper.toJsonStringsListMap(instance.synonyms)
          case final value?)
        'synonyms': value,
      if (LanguageHelper.toJsonStringMap(instance.wikidata) case final value?)
        'wikidata': value,
      if (instance.children case final value?) 'children': value,
      if (instance.parents case final value?) 'parents': value,
    };
