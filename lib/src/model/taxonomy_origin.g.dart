// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxonomy_origin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonomyOrigin _$TaxonomyOriginFromJson(Map<String, dynamic> json) =>
    TaxonomyOrigin()
      ..name = LanguageHelper.fromJsonStringMap(json['name'])
      ..synonyms = LanguageHelper.fromJsonStringMapList(json['synonyms'])
      ..children = (json['children'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..parents = (json['parents'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList();

Map<String, dynamic> _$TaxonomyOriginToJson(TaxonomyOrigin instance) =>
    <String, dynamic>{
      'name': ?LanguageHelper.toJsonStringMap(instance.name),
      'synonyms': ?LanguageHelper.toJsonStringMapList(instance.synonyms),
      'children': ?instance.children,
      'parents': ?instance.parents,
    };
