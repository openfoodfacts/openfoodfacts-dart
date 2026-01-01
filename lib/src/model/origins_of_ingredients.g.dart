// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'origins_of_ingredients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OriginsOfIngredients _$OriginsOfIngredientsFromJson(
  Map<String, dynamic> json,
) => OriginsOfIngredients(
  epiScore: JsonObject.parseDouble(json['epi_score']),
  epiValue: JsonObject.parseDouble(json['epi_value']),
  transportationScore: JsonObject.parseDouble(json['transportation_score']),
  transportationValue: JsonObject.parseDouble(json['transportation_value']),
);

Map<String, dynamic> _$OriginsOfIngredientsToJson(
  OriginsOfIngredients instance,
) => <String, dynamic>{
  if (instance.epiScore case final value?) 'epi_score': value,
  if (instance.epiValue case final value?) 'epi_value': value,
  if (instance.transportationScore case final value?)
    'transportation_score': value,
  if (instance.transportationValue case final value?)
    'transportation_value': value,
};
