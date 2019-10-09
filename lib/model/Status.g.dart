// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) {
  return Status(
    status: json['status'],
    statusVerbose: json['status_verbose'] as String,
    error: json['error'] as String,
    imageId: json['imgid'] as int,
  );
}

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'status': instance.status,
      'status_verbose': instance.statusVerbose,
      'error': instance.error,
      'imgid': instance.imageId,
    };
