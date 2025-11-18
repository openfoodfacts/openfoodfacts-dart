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
      if (LanguageHelper.toJsonStringMap(instance.name) case final value?)
        'name': value,
      if (LanguageHelper.toJsonStringsListMap(instance.synonyms)
          case final value?)
        'synonyms': value,
      if (LanguageHelper.toJsonStringMap(instance.wikidata) case final value?)
        'wikidata': value,
    };
