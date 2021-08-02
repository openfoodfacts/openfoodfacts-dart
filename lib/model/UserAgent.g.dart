// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserAgent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAgent _$UserAgentFromJson(Map<String, dynamic> json) => UserAgent(
      name: json['name'] as String?,
      version: json['version'] as String?,
      system: json['system'] as String?,
      url: json['url'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$UserAgentToJson(UserAgent instance) => <String, dynamic>{
      'name': instance.name,
      'version': instance.version,
      'system': instance.system,
      'url': instance.url,
      'comment': instance.comment,
    };
