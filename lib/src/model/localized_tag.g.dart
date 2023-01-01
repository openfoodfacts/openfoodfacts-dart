// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localized_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalizedTag _$LocalizedTagFromJson(Map<String, dynamic> json) => LocalizedTag()
  ..id = json['id'] as String?
  ..name = json['name'] as String?
  ..lcName = json['lc_name'] as String?;

Map<String, dynamic> _$LocalizedTagToJson(LocalizedTag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('lc_name', instance.lcName);
  return val;
}
