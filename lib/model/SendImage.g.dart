// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SendImage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendImage _$SendImageFromJson(Map<String, dynamic> json) {
  return SendImage(
    lang: json['lang'] as String,
    barcode: json['code'] as String,
    imageField: json['imagefield'] as String,
  );
}

Map<String, dynamic> _$SendImageToJson(SendImage instance) => <String, dynamic>{
      'lang': instance.lang,
      'code': instance.barcode,
      'imagefield': instance.imageField,
    };
