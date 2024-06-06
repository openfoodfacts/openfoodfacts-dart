// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductTag _$ProductTagFromJson(Map<String, dynamic> json) => ProductTag(
      barcode: json['product'] as String,
      key: json['k'] as String,
      value: json['v'] as String,
      owner: json['owner'] as String,
      version: (json['version'] as num).toInt(),
      editor: json['editor'] as String,
      lastEdit: JsonHelper.stringTimestampToDate(json['last_edit']),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$ProductTagToJson(ProductTag instance) =>
    <String, dynamic>{
      'product': instance.barcode,
      'k': instance.key,
      'v': instance.value,
      'owner': instance.owner,
      'version': instance.version,
      'editor': instance.editor,
      'last_edit': instance.lastEdit.toIso8601String(),
      'comment': instance.comment,
    };
