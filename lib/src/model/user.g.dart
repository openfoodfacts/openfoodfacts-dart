// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      comment: json['comment'] as String?,
      userId: json['user_id'] as String,
      password: json['password'] as String,
      cookie: json['cookie'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      if (instance.comment case final value?) 'comment': value,
      'user_id': instance.userId,
      'password': instance.password,
      'cookie': instance.cookie,
    };
