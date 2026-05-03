// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxonomy_allergen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonomyAllergen _$TaxonomyAllergenFromJson(Map<String, dynamic> json) =>
    TaxonomyAllergen(
      LanguageHelper.fromJsonStringMap(json['name']),
      LanguageHelper.fromJsonStringsListMap(json['synonyms']),
      LanguageHelper.fromJsonStringMap(json['wikidata']),
    );

Map<String, dynamic> _$TaxonomyAllergenToJson(TaxonomyAllergen instance) =>
    <String, dynamic>{
      'name': ?LanguageHelper.toJsonStringMap(instance.name),
      'synonyms': ?LanguageHelper.toJsonStringsListMap(instance.synonyms),
      'wikidata': ?LanguageHelper.toJsonStringMap(instance.wikidata),
    };
