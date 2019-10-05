// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Nutriments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Nutriments _$NutrimentsFromJson(Map<String, dynamic> json) {
  return Nutriments(
    salt: (json['salt_100g'] as num)?.toDouble(),
    fiber: (json['fiber_100g'] as num)?.toDouble(),
    sugars: (json['sugars_100g'] as num)?.toDouble(),
    fat: (json['fat_100g'] as num)?.toDouble(),
    saturatedFat: (json['saturated-fat_100g'] as num)?.toDouble(),
    proteins: (json['proteins_100g'] as num)?.toDouble(),
    novaGroup: JsonObject.parseInt(json['nova-group_100g']),
    energy: (json['energy_100g'] as num)?.toDouble(),
    energyUnit: json['energy_unit'] as String,
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
  writeNotNull('energy_unit', instance.energyUnit);
  return val;
}
