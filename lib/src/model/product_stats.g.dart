// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductStats _$ProductStatsFromJson(Map<String, dynamic> json) => ProductStats(
  barcode: json['product'] as String,
  numberOfKeys: (json['keys'] as num).toInt(),
  numberOfEditors: (json['editors'] as num).toInt(),
  lastEdit: JsonHelper.stringTimestampToDate(json['last_edit']),
);

Map<String, dynamic> _$ProductStatsToJson(ProductStats instance) =>
    <String, dynamic>{
      'product': instance.barcode,
      'keys': instance.numberOfKeys,
      'editors': instance.numberOfEditors,
      'last_edit': instance.lastEdit.toIso8601String(),
    };
