// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceUser _$PriceUserFromJson(Map<String, dynamic> json) => PriceUser()
  ..userId = json['user_id'] as String
  ..priceCount = (json['price_count'] as num?)?.toInt()
  ..locationCount = (json['location_count'] as num?)?.toInt()
  ..productCount = (json['product_count'] as num?)?.toInt()
  ..proofCount = (json['proof_count'] as num?)?.toInt();

Map<String, dynamic> _$PriceUserToJson(PriceUser instance) => <String, dynamic>{
      'user_id': instance.userId,
      'price_count': instance.priceCount,
      'location_count': instance.locationCount,
      'product_count': instance.productCount,
      'proof_count': instance.proofCount,
    };
