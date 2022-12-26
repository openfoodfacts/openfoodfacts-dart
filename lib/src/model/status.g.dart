// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      status: json['status'],
      statusVerbose: json['status_verbose'] as String?,
      body: json['body'] as String?,
      error: json['error'] as String?,
      imageId: JsonObject.parseInt(json['imgid']),
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'status': instance.status,
      'status_verbose': instance.statusVerbose,
      'body': instance.body,
      'error': instance.error,
      'imgid': instance.imageId,
    };
