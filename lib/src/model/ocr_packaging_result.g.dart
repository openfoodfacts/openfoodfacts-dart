// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocr_packaging_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OcrPackagingResult _$OcrPackagingResultFromJson(Map<String, dynamic> json) =>
    OcrPackagingResult(
      status: (json['status'] as num?)?.toInt(),
      textFromImageOrig: json['packaging_text_from_image_orig'] as String?,
      textFromImage: json['packaging_text_from_image'] as String?,
    );

Map<String, dynamic> _$OcrPackagingResultToJson(OcrPackagingResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'packaging_text_from_image_orig': instance.textFromImageOrig,
      'packaging_text_from_image': instance.textFromImage,
    };
