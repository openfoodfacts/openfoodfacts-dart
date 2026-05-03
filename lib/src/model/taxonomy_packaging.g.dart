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
      ..children = (json['children'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..parents = (json['parents'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList();

Map<String, dynamic> _$TaxonomyPackagingToJson(TaxonomyPackaging instance) =>
    <String, dynamic>{
      'name': ?LanguageHelper.toJsonStringMap(instance.name),
      'synonyms': ?LanguageHelper.toJsonStringsListMap(instance.synonyms),
      'wikidata': ?LanguageHelper.toJsonStringMap(instance.wikidata),
      'children': ?instance.children,
      'parents': ?instance.parents,
    };
