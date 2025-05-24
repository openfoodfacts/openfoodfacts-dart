import 'package:json_annotation/json_annotation.dart';
import '../../interface/json_object.dart';
import '../../utils/json_helper.dart';
import 'nutriscore.dart';

part 'nutriscore_data_2023.g.dart';

/// Detailed data of NutriScore version 2023.
@JsonSerializable()
class NutriScoreData2023 extends JsonObject {
  @JsonKey(
    name: 'count_proteins',
    toJson: JsonHelper.boolToJSON,
    fromJson: JsonHelper.boolFromJSON,
  )
  bool? countProteins;

  @JsonKey(name: 'count_proteins_reason')
  String? countProteinsReason;

  @JsonKey(
    name: 'is_beverage',
    toJson: JsonHelper.boolToJSON,
    fromJson: JsonObject.parseBool,
  )
  bool? isBeverage;

  @JsonKey(
    name: 'is_cheese',
    toJson: JsonHelper.boolToJSON,
    fromJson: JsonObject.parseBool,
  )
  bool? isCheese;

  @JsonKey(
    name: 'is_fat_oil_nuts_seeds',
    toJson: JsonHelper.boolToJSON,
    fromJson: JsonObject.parseBool,
  )
  bool? isFatOilNutsSeeds;

  @JsonKey(
    name: 'is_red_meat_product',
    toJson: JsonHelper.boolToJSON,
    fromJson: JsonObject.parseBool,
  )
  bool? isRedMeatProduct;

  @JsonKey(
    name: 'is_water',
    toJson: JsonHelper.boolToJSON,
    fromJson: JsonObject.parseBool,
  )
  bool? isWater;

  @JsonKey(name: 'negative_points')
  int? negativePoints;

  @JsonKey(name: 'negative_points_max')
  int? negativePointsMax;

  @JsonKey(name: 'positive_points')
  int? positivePoints;

  @JsonKey(name: 'positive_points_max')
  int? positivePointsMax;

  NutriScoreData2023();

  /// Infers the [NutriScoreCategory2023] based on boolean flags.
  NutriScoreCategory2023 get category {
    // water must be checked first to avoid beverage+water conflict
    if (isWater == true) return NutriScoreCategory2023.water;
    if (isBeverage == true) return NutriScoreCategory2023.beverage;
    if (isFatOilNutsSeeds == true)
      return NutriScoreCategory2023.fatOilNutsSeeds;
    if (isCheese == true) return NutriScoreCategory2023.cheese;
    if (isRedMeatProduct == true) return NutriScoreCategory2023.redMeatProduct;
    return NutriScoreCategory2023.general;
  }

  factory NutriScoreData2023.fromJson(Map<String, dynamic> json) =>
      _$NutriScoreData2023FromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NutriScoreData2023ToJson(this);
}
