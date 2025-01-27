import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/src/model/nutrient_modifier.dart';
import 'package:openfoodfacts/src/model/per_size.dart';
import 'package:openfoodfacts/src/utils/unit_helper.dart';

part 'robotoff_nutrient_extraction_annotation.g.dart';

@JsonSerializable()
class RobotoffNutrientAnnotationData {
  @JsonKey(toJson: UnitHelper.unitToString, fromJson: UnitHelper.stringToUnit)
  Unit? unit;
  @JsonKey(name: 'value')
  String valueWithModifer;

  RobotoffNutrientAnnotationData({
    this.unit,
    required this.valueWithModifer,
  });

  NutrientModifier? get modifier =>
      NutrientModifier.fromValue(valueWithModifer);

  double? get value {
    final String trimmed = valueWithModifer.trim();
    if (trimmed.isEmpty) {
      return null;
    }
    return modifier == null
        ? double.tryParse(trimmed)
        : double.tryParse(trimmed.substring(1));
  }

  factory RobotoffNutrientAnnotationData.fromJson(Map<String, dynamic> json) =>
      _$RobotoffNutrientAnnotationDataFromJson(json);

  Map<String, dynamic> toJson() => _$RobotoffNutrientAnnotationDataToJson(this);
}

@JsonSerializable()
class RobotoffNutrientAnnotation {
  final Map<String, RobotoffNutrientAnnotationData>? nutrients;
  @JsonKey(name: 'serving_size')
  final String? servingSize;
  @JsonKey(name: 'nutrition_data_per', fromJson: PerSize.fromOffTag)
  final PerSize? perSize;

  const RobotoffNutrientAnnotation({
    this.nutrients,
    this.servingSize,
    this.perSize,
  });

  factory RobotoffNutrientAnnotation.fromJson(Map<String, dynamic> json) =>
      _$RobotoffNutrientAnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$RobotoffNutrientAnnotationToJson(this);
}
