// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'KnowledgePanel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnowledgePanel _$KnowledgePanelFromJson(Map<String, dynamic> json) =>
    KnowledgePanel(
      parent_panel_id: json['parent_panel_id'] as String,
      type: _$enumDecode(_$KnowledgePanelTypeEnumMap, json['type']),
      level: _$enumDecode(_$LevelEnumMap, json['level'],
          unknownValue: Level.UNKNOWN),
      title: json['title'] as String,
      elements: (json['elements'] as List<dynamic>)
          .map((e) => KnowledgePanelElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      topics:
          (json['topics'] as List<dynamic>?)?.map((e) => e as String).toList(),
      subtitle: json['subtitle'] as String?,
      iconUrl: json['icon_url'] as String?,
      grade: _$enumDecodeNullable(_$GradeEnumMap, json['grade'],
          unknownValue: Grade.UNKNOWN),
    );

Map<String, dynamic> _$KnowledgePanelToJson(KnowledgePanel instance) =>
    <String, dynamic>{
      'parent_panel_id': instance.parent_panel_id,
      'type': _$KnowledgePanelTypeEnumMap[instance.type],
      'level': _$LevelEnumMap[instance.level],
      'topics': instance.topics,
      'title': instance.title,
      'elements': instance.elements,
      'subtitle': instance.subtitle,
      'icon_url': instance.iconUrl,
      'grade': _$GradeEnumMap[instance.grade],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$KnowledgePanelTypeEnumMap = {
  KnowledgePanelType.DO_YOU_KNOW: 'doyouknow',
  KnowledgePanelType.SCORE: 'score',
  KnowledgePanelType.ECOSCORE_LCA: 'ecoscore_lca',
  KnowledgePanelType.UNKNOWN: 'UNKNOWN',
};

const _$LevelEnumMap = {
  Level.TRIVIA: 'trivia',
  Level.INFO: 'info',
  Level.HELPFUL: 'helpful',
  Level.WARNING: 'warning',
  Level.ALERT: 'alert',
  Level.UNKNOWN: 'UNKNOWN',
};

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$GradeEnumMap = {
  Grade.A: 'A',
  Grade.B: 'B',
  Grade.C: 'C',
  Grade.D: 'D',
  Grade.E: 'E',
  Grade.UNKNOWN: 'UNKNOWN',
};
