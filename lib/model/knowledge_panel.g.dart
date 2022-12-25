// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knowledge_panel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnowledgePanel _$KnowledgePanelFromJson(Map<String, dynamic> json) =>
    KnowledgePanel(
      titleElement: json['title_element'] == null
          ? null
          : TitleElement.fromJson(
              json['title_element'] as Map<String, dynamic>),
      level: $enumDecodeNullable(_$LevelEnumMap, json['level'],
          unknownValue: Level.UNKNOWN),
      expanded: json['expanded'] as bool?,
      elements: (json['elements'] as List<dynamic>?)
          ?.map(
              (e) => KnowledgePanelElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      topics:
          (json['topics'] as List<dynamic>?)?.map((e) => e as String).toList(),
      evaluation: $enumDecodeNullable(_$EvaluationEnumMap, json['evaluation'],
          unknownValue: Evaluation.UNKNOWN),
      size: $enumDecodeNullable(_$KnowledgePanelSizeEnumMap, json['size'],
          unknownValue: KnowledgePanelSize.UNKNOWN),
    );

Map<String, dynamic> _$KnowledgePanelToJson(KnowledgePanel instance) =>
    <String, dynamic>{
      'title_element': instance.titleElement,
      'level': _$LevelEnumMap[instance.level],
      'expanded': instance.expanded,
      'elements': instance.elements,
      'topics': instance.topics,
      'evaluation': _$EvaluationEnumMap[instance.evaluation],
      'size': _$KnowledgePanelSizeEnumMap[instance.size],
    };

const _$LevelEnumMap = {
  Level.TRIVIA: 'trivia',
  Level.INFO: 'info',
  Level.HELPFUL: 'helpful',
  Level.WARNING: 'warning',
  Level.ALERT: 'alert',
  Level.UNKNOWN: 'UNKNOWN',
};

const _$EvaluationEnumMap = {
  Evaluation.GOOD: 'good',
  Evaluation.NEUTRAL: 'neutral',
  Evaluation.AVERAGE: 'average',
  Evaluation.BAD: 'bad',
  Evaluation.UNKNOWN: 'UNKNOWN',
};

const _$KnowledgePanelSizeEnumMap = {
  KnowledgePanelSize.SMALL: 'small',
  KnowledgePanelSize.UNKNOWN: 'UNKNOWN',
};

TitleElement _$TitleElementFromJson(Map<String, dynamic> json) => TitleElement(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      grade: $enumDecodeNullable(_$GradeEnumMap, json['grade'],
          unknownValue: Grade.UNKNOWN),
      type: $enumDecodeNullable(_$TitleElementTypeEnumMap, json['type'],
          unknownValue: TitleElementType.UNKNOWN),
      iconUrl: json['icon_url'] as String?,
      iconColorFromEvaluation:
          json['icon_color_from_evaluation'] as bool? ?? false,
    );

Map<String, dynamic> _$TitleElementToJson(TitleElement instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'grade': _$GradeEnumMap[instance.grade],
      'type': _$TitleElementTypeEnumMap[instance.type],
      'icon_url': instance.iconUrl,
      'icon_color_from_evaluation': instance.iconColorFromEvaluation,
    };

const _$GradeEnumMap = {
  Grade.A: 'a',
  Grade.B: 'b',
  Grade.C: 'c',
  Grade.D: 'd',
  Grade.E: 'e',
  Grade.UNKNOWN: 'UNKNOWN',
};

const _$TitleElementTypeEnumMap = {
  TitleElementType.GRADE: 'grade',
  TitleElementType.UNKNOWN: 'UNKNOWN',
};
