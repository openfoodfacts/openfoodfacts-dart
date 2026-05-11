// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxonomy_nova.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonomyNova _$TaxonomyNovaFromJson(Map<String, dynamic> json) => TaxonomyNova()
  ..name = LanguageHelper.fromJsonStringMap(json['name'])
  ..synonyms = LanguageHelper.fromJsonStringMapList(json['synonyms']);

Map<String, dynamic> _$TaxonomyNovaToJson(TaxonomyNova instance) =>
    <String, dynamic>{
      'name': ?LanguageHelper.toJsonStringMap(instance.name),
      'synonyms': ?LanguageHelper.toJsonStringMapList(instance.synonyms),
    };
