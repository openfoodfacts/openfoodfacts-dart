// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'KnowledgePanelLayout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DescriptionUnit _$DescriptionUnitFromJson(Map<String, dynamic> json) =>
    DescriptionUnit(
      html: json['html'] as String,
    );

Map<String, dynamic> _$DescriptionUnitToJson(DescriptionUnit instance) =>
    <String, dynamic>{
      'html': instance.html,
    };

ImageUnit _$ImageUnitFromJson(Map<String, dynamic> json) => ImageUnit(
      url: json['url'] as String,
      width: json['width'] as int?,
      height: json['height'] as int?,
      altText: json['alt_text'] as String?,
    );

Map<String, dynamic> _$ImageUnitToJson(ImageUnit instance) => <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'alt_text': instance.altText,
    };

KnowledgePanelElement _$KnowledgePanelElementFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelElement(
      elementStyle: _$enumDecode(_$ElementStyleEnumMap, json['element_style']),
      descriptionUnit: json['description_unit'] == null
          ? null
          : DescriptionUnit.fromJson(
              json['description_unit'] as Map<String, dynamic>),
      imageUnit: json['image_unit'] == null
          ? null
          : ImageUnit.fromJson(json['image_unit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KnowledgePanelElementToJson(
        KnowledgePanelElement instance) =>
    <String, dynamic>{
      'element_style': _$ElementStyleEnumMap[instance.elementStyle],
      'description_unit': instance.descriptionUnit,
      'image_unit': instance.imageUnit,
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

const _$ElementStyleEnumMap = {
  ElementStyle.CONTINUOUS: 'CONTINUOUS',
  ElementStyle.SEPARATE: 'SEPARATE',
};

KnowledgePanelLayout _$KnowledgePanelLayoutFromJson(
        Map<String, dynamic> json) =>
    KnowledgePanelLayout(
      elements: (json['elements'] as List<dynamic>)
          .map((e) => KnowledgePanelElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KnowledgePanelLayoutToJson(
        KnowledgePanelLayout instance) =>
    <String, dynamic>{
      'elements': instance.elements,
    };
