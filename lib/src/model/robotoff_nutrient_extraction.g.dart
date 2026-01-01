// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'robotoff_nutrient_extraction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RobotoffNutrientExtractionResult _$RobotoffNutrientExtractionResultFromJson(
  Map<String, dynamic> json,
) => RobotoffNutrientExtractionResult(
  status: json['status'] as String?,
  count: (json['count'] as num?)?.toInt(),
  insights: (json['insights'] as List<dynamic>?)
      ?.map(
        (e) => RobotoffNutrientExtractionInsight.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

Map<String, dynamic> _$RobotoffNutrientExtractionResultToJson(
  RobotoffNutrientExtractionResult instance,
) => <String, dynamic>{
  'status': instance.status,
  'count': instance.count,
  'insights': instance.insights,
};

RobotoffNutrientEntity _$RobotoffNutrientEntityFromJson(
  Map<String, dynamic> json,
) => RobotoffNutrientEntity(
  start: (json['start'] as num?)?.toInt(),
  end: (json['end'] as num?)?.toInt(),
  text: json['text'] as String?,
  unit: UnitHelper.stringToUnit(json['unit'] as String?),
  score: (json['score'] as num?)?.toDouble(),
  valid: json['valid'] as bool?,
  value: json['value'] as String?,
  entity: json['entity'] as String?,
  charStart: (json['char_start'] as num?)?.toInt(),
  charEnd: (json['char_end'] as num?)?.toInt(),
);

Map<String, dynamic> _$RobotoffNutrientEntityToJson(
  RobotoffNutrientEntity instance,
) => <String, dynamic>{
  'start': instance.start,
  'end': instance.end,
  'text': instance.text,
  'unit': UnitHelper.unitToString(instance.unit),
  'score': instance.score,
  'valid': instance.valid,
  'value': instance.value,
  'entity': instance.entity,
  'char_start': instance.charStart,
  'char_end': instance.charEnd,
};
