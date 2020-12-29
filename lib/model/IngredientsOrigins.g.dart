// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IngredientsOrigins.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientsOrigins _$IngredientsOriginsFromJson(Map<String, dynamic> json) {
  return IngredientsOrigins(
    epiScore: JsonObject.parseDouble(json['epi_score']),
    epiValue: JsonObject.parseDouble(json['epi_value']),
    transportationScore: JsonObject.parseDouble(json['transportation_score']),
    transportationValue: JsonObject.parseDouble(json['transportation_value']),
  );
}

Map<String, dynamic> _$IngredientsOriginsToJson(IngredientsOrigins instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('epi_score', instance.epiScore);
  writeNotNull('epi_value', instance.epiValue);
  writeNotNull('transportation_score', instance.transportationScore);
  writeNotNull('transportation_value', instance.transportationValue);
  return val;
}
