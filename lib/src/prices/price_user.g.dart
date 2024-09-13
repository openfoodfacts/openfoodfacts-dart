// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceUser _$PriceUserFromJson(Map<String, dynamic> json) => PriceUser()
  ..userId = json['user_id'] as String
  ..priceCount = (json['price_count'] as num).toInt()
  ..isModerator = json['is_moderator'] as bool?;

Map<String, dynamic> _$PriceUserToJson(PriceUser instance) => <String, dynamic>{
      'user_id': instance.userId,
      'price_count': instance.priceCount,
      'is_moderator': instance.isModerator,
    };
