// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocr_ingredients_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OcrIngredientsResult _$OcrIngredientsResultFromJson(
  Map<String, dynamic> json,
) => OcrIngredientsResult(
  status: (json['status'] as num?)?.toInt(),
  ingredientsTextFromImageOrig:
      json['ingredients_text_from_image_orig'] as String?,
  ingredientsTextFromImage: json['ingredients_text_from_image'] as String?,
);

Map<String, dynamic> _$OcrIngredientsResultToJson(
  OcrIngredientsResult instance,
) => <String, dynamic>{
  'status': instance.status,
  'ingredients_text_from_image_orig': instance.ingredientsTextFromImageOrig,
  'ingredients_text_from_image': instance.ingredientsTextFromImage,
};
