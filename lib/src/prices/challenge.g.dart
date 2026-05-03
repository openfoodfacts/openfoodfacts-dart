// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Challenge _$ChallengeFromJson(Map<String, dynamic> json) => Challenge()
  ..id = (json['id'] as num?)?.toInt()
  ..locations = (json['locations'] as List<dynamic>?)
      ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
      .toList()
  ..status = json['status'] as String?
  ..tag = json['tag'] as String?
  ..title = json['title'] as String?
  ..icon = json['icon'] as String?
  ..subtitle = json['subtitle'] as String?
  ..startDate = JsonHelper.stringTimestampToDate(json['start_date'])
  ..endDate = JsonHelper.stringTimestampToDate(json['end_date'])
  ..categories = (json['categories'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList()
  ..exampleProofUrl = json['example_proof_url'] as String?
  ..isPublished = json['is_published'] as bool?
  ..stats = json['stats']
  ..created = JsonHelper.stringTimestampToDate(json['created'])
  ..updated = JsonHelper.nullableStringTimestampToDate(json['updated']);

Map<String, dynamic> _$ChallengeToJson(Challenge instance) => <String, dynamic>{
  'id': instance.id,
  'locations': instance.locations,
  'status': instance.status,
  'tag': instance.tag,
  'title': instance.title,
  'icon': instance.icon,
  'subtitle': instance.subtitle,
  'start_date': instance.startDate?.toIso8601String(),
  'end_date': instance.endDate?.toIso8601String(),
  'categories': instance.categories,
  'example_proof_url': instance.exampleProofUrl,
  'is_published': instance.isPublished,
  'stats': instance.stats,
  'created': instance.created?.toIso8601String(),
  'updated': instance.updated?.toIso8601String(),
};
