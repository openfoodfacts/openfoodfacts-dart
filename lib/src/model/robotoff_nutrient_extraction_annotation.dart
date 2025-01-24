import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/src/model/nutrient_modified.dart';
import 'package:openfoodfacts/src/model/per_size.dart';
import 'package:openfoodfacts/src/utils/unit_helper.dart';

part 'robotoff_nutrient_extraction_annotation.g.dart';

@JsonSerializable()
class RobotoffNutrientAnnotationData {
  @JsonKey(toJson: UnitHelper.unitToString, fromJson: UnitHelper.stringToUnit)
  final Unit? unit;
  final String value;
  final NutrientModifier? modifier;
  final double? numericalValue;

  RobotoffNutrientAnnotationData({
    this.unit,
    required this.value,
  })  : modifier = NutrientModifierExtension.fromValue(value),
        numericalValue = double.tryParse(value.trim().substring(1));

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
