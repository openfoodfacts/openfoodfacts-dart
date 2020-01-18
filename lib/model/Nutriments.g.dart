// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Nutriments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Nutriments _$NutrimentsFromJson(Map<String, dynamic> json) {
  return Nutriments(
    salt: JsonObject.parseDouble(json['salt_100g']),
    fiber: JsonObject.parseDouble(json['fiber_100g']),
    sugars: JsonObject.parseDouble(json['sugars_100g']),
    fat: JsonObject.parseDouble(json['fat_100g']),
    saturatedFat: JsonObject.parseDouble(json['saturated-fat_100g']),
    proteins: JsonObject.parseDouble(json['proteins_100g']),
    novaGroup: JsonObject.parseInt(json['nova-group_100g']),
    energy: JsonObject.parseDouble(json['energy_100g']),
    carbohydrates: JsonObject.parseDouble(json['carbohydrates_100g']),
  );
}

Map<String, dynamic> _$NutrimentsToJson(Nutriments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('salt_100g', instance.salt);
  writeNotNull('fiber_100g', instance.fiber);
  writeNotNull('sugars_100g', instance.sugars);
  writeNotNull('fat_100g', instance.fat);
  writeNotNull('saturated-fat_100g', instance.saturatedFat);
  writeNotNull('proteins_100g', instance.proteins);
  writeNotNull('nova-group_100g', instance.novaGroup);
  writeNotNull('energy_100g', instance.energy);
  writeNotNull('carbohydrates_100g', instance.carbohydrates);
  return val;
}
