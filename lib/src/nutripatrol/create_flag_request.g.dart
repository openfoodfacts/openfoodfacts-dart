// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_flag_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFlagRequest _$CreateFlagRequestFromJson(Map<String, dynamic> json) =>
    CreateFlagRequest()
      ..barcode = json['barcode'] as String?
      ..type = json['type'] as String
      ..url = json['url'] as String
      ..userId = json['user_id'] as String
      ..deviceId = json['device_id'] as String
      ..source = json['source'] as String
      ..confidence = (json['confidence'] as num?)?.toDouble()
      ..imageId = json['image_id'] as String?
      ..flavor = json['flavor'] as String
      ..reason = json['reason'] as String?
      ..comment = json['comment'] as String?
      ..createdAt = DateTime.parse(json['created_at'] as String);

Map<String, dynamic> _$CreateFlagRequestToJson(CreateFlagRequest instance) =>
    <String, dynamic>{
      'barcode': instance.barcode,
      'type': instance.type,
      'url': instance.url,
      'user_id': instance.userId,
      'device_id': instance.deviceId,
      'source': instance.source,
      'confidence': instance.confidence,
      'image_id': instance.imageId,
      'flavor': instance.flavor,
      'reason': instance.reason,
      'comment': instance.comment,
      'created_at': instance.createdAt.toIso8601String(),
    };
