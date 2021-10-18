// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaxonomyAllergen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonomyAllergen _$TaxonomyAllergenFromJson(Map<String, dynamic> json) =>
    TaxonomyAllergen(
      LanguageHelper.fromJsonStringMap(json['name']),
      LanguageHelper.fromJsonStringsListMap(json['synonyms']),
      LanguageHelper.fromJsonStringMap(json['wikidata']),
    );

Map<String, dynamic> _$TaxonomyAllergenToJson(TaxonomyAllergen instance) {
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
  return val;
}
