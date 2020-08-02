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
    energyKcal100g: JsonObject.parseDouble(json['energy-kcal_100g']),
    energyKcal: JsonObject.parseDouble(json['energy-kcal']),
    carbohydrates: JsonObject.parseDouble(json['carbohydrates_100g']),
    saltServing: JsonObject.parseDouble(json['salt_serving']),
    fiberServing: JsonObject.parseDouble(json['fiber_serving']),
    sugarsServing: JsonObject.parseDouble(json['sugars_serving']),
    fatServing: JsonObject.parseDouble(json['fat_serving']),
    saturatedFatServing: JsonObject.parseDouble(json['saturated-fat_serving']),
    proteinsServing: JsonObject.parseDouble(json['proteins_serving']),
    novaGroupServing: JsonObject.parseInt(json['nova-group_serving']),
    energyServing: JsonObject.parseDouble(json['energy_serving']),
    carbohydratesServing: JsonObject.parseDouble(json['carbohydrates_serving']),
    energyKcalUnit: UnitHelper.stringToUnit(json['energy-kcal_unit'] as String),
    energyUnit: UnitHelper.stringToUnit(json['energy_unit'] as String),
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
  writeNotNull('energy-kcal_100g', instance.energyKcal100g);
  writeNotNull('carbohydrates_100g', instance.carbohydrates);
  writeNotNull('salt_serving', instance.saltServing);
  writeNotNull('fiber_serving', instance.fiberServing);
  writeNotNull('sugars_serving', instance.sugarsServing);
  writeNotNull('fat_serving', instance.fatServing);
  writeNotNull('saturated-fat_serving', instance.saturatedFatServing);
  writeNotNull('proteins_serving', instance.proteinsServing);
  writeNotNull('nova-group_serving', instance.novaGroupServing);
  writeNotNull('energy_serving', instance.energyServing);
  writeNotNull('carbohydrates_serving', instance.carbohydratesServing);
  writeNotNull('energy-kcal_unit', _$UnitEnumMap[instance.energyKcalUnit]);
  writeNotNull('energy_unit', _$UnitEnumMap[instance.energyUnit]);
  return val;
}

const _$UnitEnumMap = {
  Unit.KCAL: 'KCAL',
  Unit.KJ: 'KJ',
  Unit.G: 'G',
  Unit.MILLI_G: 'MILLI_G',
  Unit.MICRO_G: 'MICRO_G',
  Unit.UNKNOWN: 'UNKNOWN',
};
