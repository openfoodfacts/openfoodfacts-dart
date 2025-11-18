// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'value_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValueCount _$ValueCountFromJson(Map<String, dynamic> json) => ValueCount(
      value: json['v'] as String,
      productCount: (json['product_count'] as num).toInt(),
    );

Map<String, dynamic> _$ValueCountToJson(ValueCount instance) =>
    <String, dynamic>{
      'v': instance.value,
      'product_count': instance.productCount,
    };
