// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'KnowledgePanel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnowledgePanel _$KnowledgePanelFromJson(Map<String, dynamic> json) =>
    KnowledgePanel(
      id: json['id'] as String,
      title: json['title'] as String,
      relevance: _$enumDecode(_$RelevanceEnumMap, json['relevance']),
      layout:
          KnowledgePanelLayout.fromJson(json['layout'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KnowledgePanelToJson(KnowledgePanel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'relevance': _$RelevanceEnumMap[instance.relevance],
      'layout': instance.layout,
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

const _$RelevanceEnumMap = {
  Relevance.TRIVIAL: 'TRIVIAL',
  Relevance.INFORMATIVE: 'INFORMATIVE',
  Relevance.HELPFUL: 'HELPFUL',
  Relevance.WARNING: 'WARNING',
  Relevance.ALERT: 'ALERT',
};
