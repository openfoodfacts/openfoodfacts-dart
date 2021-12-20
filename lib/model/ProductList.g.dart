// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductList _$ProductListFromJson(Map<String, dynamic> json) => ProductList(
      barcode: json['product'] as String,
      key: json['k'] as String,
      value: json['v'] as String,
    );

Map<String, dynamic> _$ProductListToJson(ProductList instance) =>
    <String, dynamic>{
      'product': instance.barcode,
      'k': instance.key,
      'v': instance.value,
    };
