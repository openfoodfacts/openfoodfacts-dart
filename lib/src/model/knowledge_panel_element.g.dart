// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knowledge_panel_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnowledgePanelTextElement _$KnowledgePanelTextElementFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelTextElement(
      html: json['html'] as String,
      type: $enumDecodeNullable(
          _$KnowledgePanelTextElementTypeEnumMap, json['type'],
          unknownValue: KnowledgePanelTextElementType.DEFAULT),
      sourceLanguage: json['source_language'] as String?,
      sourceLocale: json['source_lc'] as String?,
      sourceText: json['source_text'] as String?,
      sourceUrl: json['source_url'] as String?,
    );

Map<String, dynamic> _$KnowledgePanelTextElementToJson(
        KnowledgePanelTextElement instance) =>
    <String, dynamic>{
      'html': instance.html,
      'type': _$KnowledgePanelTextElementTypeEnumMap[instance.type],
      'source_language': instance.sourceLanguage,
      'source_lc': instance.sourceLocale,
      'source_text': instance.sourceText,
      'source_url': instance.sourceUrl,
    };

const _$KnowledgePanelTextElementTypeEnumMap = {
  KnowledgePanelTextElementType.SUMMARY: 'summary',
  KnowledgePanelTextElementType.WARNING: 'warning',
  KnowledgePanelTextElementType.NOTES: 'notes',
  KnowledgePanelTextElementType.DEFAULT: 'notes',
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
      title: json['title'] as String?,
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
      evaluation: $enumDecodeNullable(_$EvaluationEnumMap, json['evaluation'],
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
  Evaluation.AVERAGE: 'average',
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
      type: $enumDecodeNullable(_$KnowledgePanelColumnTypeEnumMap, json['type'],
          unknownValue: KnowledgePanelColumnType.TEXT),
      textForSmallScreens: json['text_for_small_screens'] as String?,
      showByDefault: json['shown_by_default'] as bool?,
      columnGroupId: json['column_group_id'] as String?,
      style: json['style'] as String?,
    );

Map<String, dynamic> _$KnowledgePanelTableColumnToJson(
        KnowledgePanelTableColumn instance) =>
    <String, dynamic>{
      'text': instance.text,
      'text_for_small_screens': instance.textForSmallScreens,
      'shown_by_default': instance.showByDefault,
      'column_group_id': instance.columnGroupId,
      'style': instance.style,
      'type': _$KnowledgePanelColumnTypeEnumMap[instance.type],
    };

const _$KnowledgePanelColumnTypeEnumMap = {
  KnowledgePanelColumnType.TEXT: 'text',
  KnowledgePanelColumnType.PERCENT: 'percent',
};

KnowledgePanelWorldMapElement _$KnowledgePanelWorldMapElementFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelWorldMapElement(
      pointers: (json['pointers'] as List<dynamic>)
          .map((e) =>
              KnowledgePanelGeoPointer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KnowledgePanelWorldMapElementToJson(
        KnowledgePanelWorldMapElement instance) =>
    <String, dynamic>{
      'pointers': instance.pointers,
    };

KnowledgePanelGeoPointer _$KnowledgePanelGeoPointerFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelGeoPointer(
      geo: json['geo'] == null
          ? null
          : KnowledgePanelLatLng.fromJson(json['geo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KnowledgePanelGeoPointerToJson(
        KnowledgePanelGeoPointer instance) =>
    <String, dynamic>{
      'geo': instance.geo,
    };

KnowledgePanelLatLng _$KnowledgePanelLatLngFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelLatLng(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$KnowledgePanelLatLngToJson(
        KnowledgePanelLatLng instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

KnowledgePanelTableElement _$KnowledgePanelTableElementFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelTableElement(
      id: json['id'] as String,
      title: json['title'] as String?,
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
      'title': instance.title,
      'columns': instance.columns,
      'rows': instance.rows,
    };

KnowledgePanelActionElement _$KnowledgePanelActionElementFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelActionElement(
      html: json['html'] as String,
      actions:
          (json['actions'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$KnowledgePanelActionElementToJson(
        KnowledgePanelActionElement instance) =>
    <String, dynamic>{
      'html': instance.html,
      'actions': instance.actions,
    };

KnowledgePanelElement _$KnowledgePanelElementFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelElement(
      elementType: $enumDecode(
          _$KnowledgePanelElementTypeEnumMap, json['element_type'],
          unknownValue: KnowledgePanelElementType.UNKNOWN),
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
      panelGroupElement: json['panel_group_element'] == null
          ? null
          : KnowledgePanelPanelGroupElement.fromJson(
              json['panel_group_element'] as Map<String, dynamic>),
      tableElement: json['table_element'] == null
          ? null
          : KnowledgePanelTableElement.fromJson(
              json['table_element'] as Map<String, dynamic>),
      mapElement: json['map_element'] == null
          ? null
          : KnowledgePanelWorldMapElement.fromJson(
              json['map_element'] as Map<String, dynamic>),
      actionElement: json['action_element'] == null
          ? null
          : KnowledgePanelActionElement.fromJson(
              json['action_element'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KnowledgePanelElementToJson(
        KnowledgePanelElement instance) =>
    <String, dynamic>{
      'element_type': _$KnowledgePanelElementTypeEnumMap[instance.elementType]!,
      'text_element': instance.textElement,
      'image_element': instance.imageElement,
      'panel_element': instance.panelElement,
      'panel_group_element': instance.panelGroupElement,
      'table_element': instance.tableElement,
      'map_element': instance.mapElement,
      'action_element': instance.actionElement,
    };

const _$KnowledgePanelElementTypeEnumMap = {
  KnowledgePanelElementType.TEXT: 'text',
  KnowledgePanelElementType.IMAGE: 'image',
  KnowledgePanelElementType.PANEL: 'panel',
  KnowledgePanelElementType.PANEL_GROUP: 'panel_group',
  KnowledgePanelElementType.TABLE: 'table',
  KnowledgePanelElementType.ACTION: 'action',
  KnowledgePanelElementType.MAP: 'map',
  KnowledgePanelElementType.UNKNOWN: 'UNKNOWN',
};
