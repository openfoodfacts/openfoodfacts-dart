// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxonomy_packaging_recycling.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonomyPackagingRecycling _$TaxonomyPackagingRecyclingFromJson(
  Map<String, dynamic> json,
) => TaxonomyPackagingRecycling()
  ..name = LanguageHelper.fromJsonStringMap(json['name'])
  ..synonyms = LanguageHelper.fromJsonStringMapList(json['synonyms'])
  ..shape = LanguageHelper.fromJsonStringMap(json['shape'])
  ..material = LanguageHelper.fromJsonStringMap(json['material'])
  ..children = (json['children'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList()
  ..parents = (json['parents'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList();

Map<String, dynamic> _$TaxonomyPackagingRecyclingToJson(
  TaxonomyPackagingRecycling instance,
) => <String, dynamic>{
  'name': ?LanguageHelper.toJsonStringMap(instance.name),
  'synonyms': ?LanguageHelper.toJsonStringMapList(instance.synonyms),
  'shape': ?LanguageHelper.toJsonStringMap(instance.shape),
  'material': ?LanguageHelper.toJsonStringMap(instance.material),
  'children': ?instance.children,
  'parents': ?instance.parents,
};
