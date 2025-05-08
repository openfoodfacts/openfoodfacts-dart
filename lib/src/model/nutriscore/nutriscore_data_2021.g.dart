// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutriscore_data_2021.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutriScoreData2021 _$NutriScoreData2021FromJson(Map<String, dynamic> json) =>
    NutriScoreData2021()
      ..isBeverage = JsonHelper.boolFromJSON(json['is_beverage'])
      ..isCheese = JsonHelper.boolFromJSON(json['is_cheese'])
      ..isFat = JsonHelper.boolFromJSON(json['is_fat'])
      ..isWater = JsonHelper.boolFromJSON(json['is_water'])
      ..negativePoints = (json['negative_points'] as num?)?.toInt()
      ..positivePoints = (json['positive_points'] as num?)?.toInt();

Map<String, dynamic> _$NutriScoreData2021ToJson(NutriScoreData2021 instance) =>
    <String, dynamic>{
      'is_beverage': JsonHelper.boolToJSON(instance.isBeverage),
      'is_cheese': JsonHelper.boolToJSON(instance.isCheese),
      'is_fat': JsonHelper.boolToJSON(instance.isFat),
      'is_water': JsonHelper.boolToJSON(instance.isWater),
      'negative_points': instance.negativePoints,
      'positive_points': instance.positivePoints,
    };
