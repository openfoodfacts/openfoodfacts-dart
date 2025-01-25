// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'robotoff_nutrient_extraction_annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RobotoffNutrientAnnotationData _$RobotoffNutrientAnnotationDataFromJson(
        Map<String, dynamic> json) =>
    RobotoffNutrientAnnotationData(
      unit: UnitHelper.stringToUnit(json['unit'] as String?),
      valueWithModifer: json['valueWithModifer'] as String,
    );

Map<String, dynamic> _$RobotoffNutrientAnnotationDataToJson(
        RobotoffNutrientAnnotationData instance) =>
    <String, dynamic>{
      'unit': UnitHelper.unitToString(instance.unit),
      'valueWithModifer': instance.valueWithModifer,
    };

RobotoffNutrientAnnotation _$RobotoffNutrientAnnotationFromJson(
        Map<String, dynamic> json) =>
    RobotoffNutrientAnnotation(
      nutrients: (json['nutrients'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k,
            RobotoffNutrientAnnotationData.fromJson(e as Map<String, dynamic>)),
      ),
      servingSize: json['serving_size'] as String?,
      perSize: PerSize.fromOffTag(json['nutrition_data_per'] as String?),
    );

Map<String, dynamic> _$RobotoffNutrientAnnotationToJson(
        RobotoffNutrientAnnotation instance) =>
    <String, dynamic>{
      'nutrients': instance.nutrients,
      'serving_size': instance.servingSize,
      'nutrition_data_per': _$PerSizeEnumMap[instance.perSize],
    };

const _$PerSizeEnumMap = {
  PerSize.serving: 'serving',
  PerSize.oneHundredGrams: 'oneHundredGrams',
};
