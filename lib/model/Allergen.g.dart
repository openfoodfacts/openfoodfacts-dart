// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Allergen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Allergen _$AllergenFromJson(Map<String, dynamic> json) => Allergen(
      LanguageHelper.fromJsonStringMap(json['name']),
      LanguageHelper.fromJsonStringsListMap(json['synonyms']),
      LanguageHelper.fromJsonStringMap(json['wikidata']),
    );

Map<String, dynamic> _$AllergenToJson(Allergen instance) {
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
