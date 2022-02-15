// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BadgeBase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BadgeBase _$BadgeBaseFromJson(Map<String, dynamic> json) => BadgeBase(
      badgeName: json['badge_name'] as String,
      level: json['level'] as int,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$BadgeBaseToJson(BadgeBase instance) => <String, dynamic>{
      'user_id': instance.userId,
      'badge_name': instance.badgeName,
      'level': instance.level,
    };
