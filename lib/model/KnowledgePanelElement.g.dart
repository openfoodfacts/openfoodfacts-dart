// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'KnowledgePanelElement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnowledgePanelTextElement _$KnowledgePanelTextElementFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelTextElement(
      html: json['html'] as String,
      type: _$enumDecode(
          _$KnowledgePanelTextElementTypeEnumMap, json['text_type'],
          unknownValue: KnowledgePanelTextElementType.UNKNOWN),
    );

Map<String, dynamic> _$KnowledgePanelTextElementToJson(
        KnowledgePanelTextElement instance) =>
    <String, dynamic>{
      'html': instance.html,
      'text_type': _$KnowledgePanelTextElementTypeEnumMap[instance.type],
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

const _$KnowledgePanelTextElementTypeEnumMap = {
  KnowledgePanelTextElementType.SUMMARY: 'summary',
  KnowledgePanelTextElementType.WARNING: 'warning',
  KnowledgePanelTextElementType.NOTES: 'notes',
  KnowledgePanelTextElementType.UNKNOWN: 'UNKNOWN',
};

KnowledgePanelImageElement _$KnowledgePanelImageElementFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelImageElement(
      url: json['url'] as String,
      width: json['width'] as int?,
      height: json['height'] as int?,
      altText: json['alt_text'] as String?,
    );

Map<String, dynamic> _$KnowledgePanelImageElementToJson(
        KnowledgePanelImageElement instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'alt_text': instance.altText,
    };

KnowledgePanelPanelIdElement _$KnowledgePanelPanelIdElementFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelPanelIdElement(
      panelId: json['panel_id'] as String,
    );

Map<String, dynamic> _$KnowledgePanelPanelIdElementToJson(
        KnowledgePanelPanelIdElement instance) =>
    <String, dynamic>{
      'panel_id': instance.panelId,
    };

KnowledgePanelTableElement _$KnowledgePanelTableElementFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelTableElement(
      tableId: json['table_id'] as String,
      tableType: json['table_type'] as String,
      title: json['title'] as String,
      headers:
          (json['headers'] as List<dynamic>).map((e) => e as String).toList(),
      rows: (json['rows'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
    );

Map<String, dynamic> _$KnowledgePanelTableElementToJson(
        KnowledgePanelTableElement instance) =>
    <String, dynamic>{
      'table_id': instance.tableId,
      'table_type': instance.tableType,
      'title': instance.title,
      'headers': instance.headers,
      'rows': instance.rows,
    };

KnowledgePanelElement _$KnowledgePanelElementFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelElement(
      type: _$enumDecode(_$KnowledgePanelElementTypeEnumMap, json['type']),
      textElement: json['textElement'] == null
          ? null
          : KnowledgePanelTextElement.fromJson(
              json['textElement'] as Map<String, dynamic>),
      imageElement: json['imageElement'] == null
          ? null
          : KnowledgePanelImageElement.fromJson(
              json['imageElement'] as Map<String, dynamic>),
      panelIdElement: json['panelIdElement'] == null
          ? null
          : KnowledgePanelPanelIdElement.fromJson(
              json['panelIdElement'] as Map<String, dynamic>),
      tableElement: json['tableElement'] == null
          ? null
          : KnowledgePanelTableElement.fromJson(
              json['tableElement'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KnowledgePanelElementToJson(
        KnowledgePanelElement instance) =>
    <String, dynamic>{
      'type': _$KnowledgePanelElementTypeEnumMap[instance.type],
      'textElement': instance.textElement,
      'imageElement': instance.imageElement,
      'panelIdElement': instance.panelIdElement,
      'tableElement': instance.tableElement,
    };

const _$KnowledgePanelElementTypeEnumMap = {
  KnowledgePanelElementType.TEXT: 'text',
  KnowledgePanelElementType.IMAGE: 'image',
  KnowledgePanelElementType.PANEL: 'panel',
  KnowledgePanelElementType.TABLE: 'table',
  KnowledgePanelElementType.UNKNOWN: 'UNKNOWN',
};
