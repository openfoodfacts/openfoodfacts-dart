// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'KnowledgePanelElement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnowledgePanelTextElement _$KnowledgePanelTextElementFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelTextElement(
      html: json['html'] as String,
      type: _$enumDecodeNullable(
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

const _$KnowledgePanelTextElementTypeEnumMap = {
  KnowledgePanelTextElementType.SUMMARY: 'summary',
  KnowledgePanelTextElementType.WARNING: 'warning',
  KnowledgePanelTextElementType.NOTES: 'notes',
  KnowledgePanelTextElementType.DEFAULT: 'notes',
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

KnowledgePanelPanelGroupElement _$KnowledgePanelPanelGroupElementFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelPanelGroupElement(
      title: json['title'] as String,
      panelIds:
          (json['panel_ids'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$KnowledgePanelPanelGroupElementToJson(
        KnowledgePanelPanelGroupElement instance) =>
    <String, dynamic>{
      'title': instance.title,
      'panel_ids': instance.panelIds,
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

KnowledgePanelTableCell _$KnowledgePanelTableCellFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelTableCell(
      text: json['text'] as String,
      percent: (json['percent'] as num?)?.toDouble(),
      iconUrl: json['icon_url'] as String?,
      evaluation: _$enumDecodeNullable(_$EvaluationEnumMap, json['evaluation'],
          unknownValue: Evaluation.UNKNOWN),
    );

Map<String, dynamic> _$KnowledgePanelTableCellToJson(
        KnowledgePanelTableCell instance) =>
    <String, dynamic>{
      'text': instance.text,
      'percent': instance.percent,
      'icon_url': instance.iconUrl,
      'evaluation': _$EvaluationEnumMap[instance.evaluation],
    };

const _$EvaluationEnumMap = {
  Evaluation.GOOD: 'good',
  Evaluation.NEUTRAL: 'neutral',
  Evaluation.BAD: 'bad',
  Evaluation.UNKNOWN: 'UNKNOWN',
};

KnowledgePanelTableRowElement _$KnowledgePanelTableRowElementFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelTableRowElement(
      values: (json['values'] as List<dynamic>)
          .map((e) =>
              KnowledgePanelTableCell.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KnowledgePanelTableRowElementToJson(
        KnowledgePanelTableRowElement instance) =>
    <String, dynamic>{
      'values': instance.values,
    };

KnowledgePanelTableColumn _$KnowledgePanelTableColumnFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelTableColumn(
      text: json['text'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$KnowledgePanelTableColumnToJson(
        KnowledgePanelTableColumn instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
    };

KnowledgePanelTableElement _$KnowledgePanelTableElementFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelTableElement(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      columns: (json['columns'] as List<dynamic>)
          .map((e) =>
              KnowledgePanelTableColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      rows: (json['rows'] as List<dynamic>)
          .map((e) =>
              KnowledgePanelTableRowElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KnowledgePanelTableElementToJson(
        KnowledgePanelTableElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'columns': instance.columns,
      'rows': instance.rows,
    };

KnowledgePanelElement _$KnowledgePanelElementFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelElement(
      elementType: _$enumDecode(
          _$KnowledgePanelElementTypeEnumMap, json['element_type']),
      textElement: json['text_element'] == null
          ? null
          : KnowledgePanelTextElement.fromJson(
              json['text_element'] as Map<String, dynamic>),
      imageElement: json['image_element'] == null
          ? null
          : KnowledgePanelImageElement.fromJson(
              json['image_element'] as Map<String, dynamic>),
      panelElement: json['panel_element'] == null
          ? null
          : KnowledgePanelPanelIdElement.fromJson(
              json['panel_element'] as Map<String, dynamic>),
      panelGroupElement: json['panel_group'] == null
          ? null
          : KnowledgePanelPanelGroupElement.fromJson(
              json['panel_group'] as Map<String, dynamic>),
      tableElement: json['table_element'] == null
          ? null
          : KnowledgePanelTableElement.fromJson(
              json['table_element'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KnowledgePanelElementToJson(
        KnowledgePanelElement instance) =>
    <String, dynamic>{
      'element_type': _$KnowledgePanelElementTypeEnumMap[instance.elementType],
      'text_element': instance.textElement,
      'image_element': instance.imageElement,
      'panel_element': instance.panelElement,
      'panel_group': instance.panelGroupElement,
      'table_element': instance.tableElement,
    };

const _$KnowledgePanelElementTypeEnumMap = {
  KnowledgePanelElementType.TEXT: 'text',
  KnowledgePanelElementType.IMAGE: 'image',
  KnowledgePanelElementType.PANEL: 'panel',
  KnowledgePanelElementType.PANEL_GROUP: 'panel_group',
  KnowledgePanelElementType.TABLE: 'table',
  KnowledgePanelElementType.UNKNOWN: 'UNKNOWN',
};
