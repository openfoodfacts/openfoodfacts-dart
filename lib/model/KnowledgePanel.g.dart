// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'KnowledgePanel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnowledgePanel _$KnowledgePanelFromJson(Map<String, dynamic> json) =>
    KnowledgePanel(
      id: json['id'] as String,
      topics:
          (json['topics'] as List<dynamic>).map((e) => e as String).toList(),
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      iconUrl: json['icon_url'] as String,
      level: _$enumDecode(_$LevelEnumMap, json['level']),
      elements: (json['elements'] as List<dynamic>)
          .map((e) => KnowledgePanelElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      grade: _$enumDecodeNullable(_$GradeEnumMap, json['grade']),
    );

Map<String, dynamic> _$KnowledgePanelToJson(KnowledgePanel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topics': instance.topics,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'icon_url': instance.iconUrl,
      'level': _$LevelEnumMap[instance.level],
      'elements': instance.elements,
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

const _$LevelEnumMap = {
  Level.TRIVIA: 'TRIVIA',
  Level.INFORMATIVE: 'INFORMATIVE',
  Level.HELPFUL: 'HELPFUL',
  Level.WARNING: 'WARNING',
  Level.ALERT: 'ALERT',
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
};
