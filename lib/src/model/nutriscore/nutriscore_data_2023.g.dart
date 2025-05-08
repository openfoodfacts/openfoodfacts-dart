// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutriscore_data_2023.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutriScoreData2023 _$NutriScoreData2023FromJson(Map<String, dynamic> json) =>
    NutriScoreData2023()
      ..countProteins = JsonHelper.boolFromJSON(json['count_proteins'])
      ..countProteinsReason = json['count_proteins_reason'] as String?
      ..isBeverage = JsonHelper.boolFromJSON(json['is_beverage'])
      ..isCheese = JsonHelper.boolFromJSON(json['is_cheese'])
      ..isFatOilNutsSeeds =
          JsonHelper.boolFromJSON(json['is_fat_oil_nuts_seeds'])
      ..isRedMeatProduct = JsonHelper.boolFromJSON(json['is_red_meat_product'])
      ..isWater = JsonHelper.boolFromJSON(json['is_water'])
      ..negativePoints = (json['negative_points'] as num?)?.toInt()
      ..negativePointsMax = (json['negative_points_max'] as num?)?.toInt()
      ..positivePoints = (json['positive_points'] as num?)?.toInt()
      ..positivePointsMax = (json['positive_points_max'] as num?)?.toInt();

Map<String, dynamic> _$NutriScoreData2023ToJson(NutriScoreData2023 instance) =>
    <String, dynamic>{
      'count_proteins': JsonHelper.boolToJSON(instance.countProteins),
      'count_proteins_reason': instance.countProteinsReason,
      'is_beverage': JsonHelper.boolToJSON(instance.isBeverage),
      'is_cheese': JsonHelper.boolToJSON(instance.isCheese),
      'is_fat_oil_nuts_seeds':
          JsonHelper.boolToJSON(instance.isFatOilNutsSeeds),
      'is_red_meat_product': JsonHelper.boolToJSON(instance.isRedMeatProduct),
      'is_water': JsonHelper.boolToJSON(instance.isWater),
      'negative_points': instance.negativePoints,
      'negative_points_max': instance.negativePointsMax,
      'positive_points': instance.positivePoints,
      'positive_points_max': instance.positivePointsMax,
    };
