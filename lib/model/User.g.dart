// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    comment: json['comment'] as String?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    userId: json['user_id'] as String,
    password: json['password'] as String,
    pro: json['pro'] as bool,
    requested_org: json['requested_org'] as String?,
    newsletter: json['newsletter'] as bool,
  );
}

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('comment', instance.comment);
  val['name'] = instance.name;
  val['email'] = instance.email;
  val['user_id'] = instance.userId;
  val['password'] = instance.password;
  val['pro'] = instance.pro;
  val['requested_org'] = instance.requested_org;
  val['newsletter'] = instance.newsletter;
  return val;
}
