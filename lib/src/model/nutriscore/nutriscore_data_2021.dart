import 'package:json_annotation/json_annotation.dart';
import '../../interface/json_object.dart';
import '../../utils/json_helper.dart';
import 'nutriscore.dart';

part 'nutriscore_data_2021.g.dart';

/// Detailed data of NutriScore version 2021.
@JsonSerializable()
class NutriScoreData2021 extends JsonObject {
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
    name: 'is_fat',
    toJson: JsonHelper.boolToJSON,
    fromJson: JsonObject.parseBool,
  )
  bool? isFat;

  @JsonKey(
    name: 'is_water',
    toJson: JsonHelper.boolToJSON,
    fromJson: JsonObject.parseBool,
  )
  bool? isWater;

  @JsonKey(name: 'negative_points')
  int? negativePoints;

  @JsonKey(name: 'positive_points')
  int? positivePoints;

  NutriScoreData2021();

  /// Infers the [NutriScoreCategory2021] based on boolean flags.
  NutriScoreCategory2021 get category {
    // water must be checked first to avoid beverage+water conflict
    if (isWater == true) return NutriScoreCategory2021.water;
    if (isBeverage == true) return NutriScoreCategory2021.beverage;
    if (isFat == true) return NutriScoreCategory2021.fat;
    if (isCheese == true) return NutriScoreCategory2021.cheese;
    return NutriScoreCategory2021.general;
  }

  factory NutriScoreData2021.fromJson(Map<String, dynamic> json) =>
      _$NutriScoreData2021FromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NutriScoreData2021ToJson(this);
}
