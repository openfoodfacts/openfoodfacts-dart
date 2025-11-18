// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localized_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalizedTag _$LocalizedTagFromJson(Map<String, dynamic> json) => LocalizedTag()
  ..id = json['id'] as String?
  ..name = json['name'] as String?
  ..lcName = json['lc_name'] as String?;

Map<String, dynamic> _$LocalizedTagToJson(LocalizedTag instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.lcName case final value?) 'lc_name': value,
    };
