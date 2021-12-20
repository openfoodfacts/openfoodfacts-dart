// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductStats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductStats _$ProductStatsFromJson(Map<String, dynamic> json) => ProductStats(
      barcode: json['product'] as String,
      numberOfKeys: json['keys'] as int,
      numberOfEditors: json['editors'] as int,
      lastEdit: JsonHelper.stringTimestampToDate(json['last_edit']),
    );

Map<String, dynamic> _$ProductStatsToJson(ProductStats instance) =>
    <String, dynamic>{
      'product': instance.barcode,
      'keys': instance.numberOfKeys,
      'editors': instance.numberOfEditors,
      'last_edit': instance.lastEdit.toIso8601String(),
    };
