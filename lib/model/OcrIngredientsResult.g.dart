// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OcrIngredientsResult.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OcrIngredientsResultCWProxy {
  OcrIngredientsResult ingredientsTextFromImage(
      String? ingredientsTextFromImage);

  OcrIngredientsResult ingredientsTextFromImageOrig(
      String? ingredientsTextFromImageOrig);

  OcrIngredientsResult status(int? status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OcrIngredientsResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OcrIngredientsResult(...).copyWith(id: 12, name: "My name")
  /// ````
  OcrIngredientsResult call({
    String? ingredientsTextFromImage,
    String? ingredientsTextFromImageOrig,
    int? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOcrIngredientsResult.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOcrIngredientsResult.copyWith.fieldName(...)`
class _$OcrIngredientsResultCWProxyImpl
    implements _$OcrIngredientsResultCWProxy {
  final OcrIngredientsResult _value;

  const _$OcrIngredientsResultCWProxyImpl(this._value);

  @override
  OcrIngredientsResult ingredientsTextFromImage(
          String? ingredientsTextFromImage) =>
      this(ingredientsTextFromImage: ingredientsTextFromImage);

  @override
  OcrIngredientsResult ingredientsTextFromImageOrig(
          String? ingredientsTextFromImageOrig) =>
      this(ingredientsTextFromImageOrig: ingredientsTextFromImageOrig);

  @override
  OcrIngredientsResult status(int? status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OcrIngredientsResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OcrIngredientsResult(...).copyWith(id: 12, name: "My name")
  /// ````
  OcrIngredientsResult call({
    Object? ingredientsTextFromImage = const $CopyWithPlaceholder(),
    Object? ingredientsTextFromImageOrig = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return OcrIngredientsResult(
      ingredientsTextFromImage:
          ingredientsTextFromImage == const $CopyWithPlaceholder()
              ? _value.ingredientsTextFromImage
              // ignore: cast_nullable_to_non_nullable
              : ingredientsTextFromImage as String?,
      ingredientsTextFromImageOrig:
          ingredientsTextFromImageOrig == const $CopyWithPlaceholder()
              ? _value.ingredientsTextFromImageOrig
              // ignore: cast_nullable_to_non_nullable
              : ingredientsTextFromImageOrig as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as int?,
    );
  }
}

extension $OcrIngredientsResultCopyWith on OcrIngredientsResult {
  /// Returns a callable class that can be used as follows: `instanceOfOcrIngredientsResult.copyWith(...)` or like so:`instanceOfOcrIngredientsResult.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OcrIngredientsResultCWProxy get copyWith =>
      _$OcrIngredientsResultCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OcrIngredientsResult _$OcrIngredientsResultFromJson(
        Map<String, dynamic> json) =>
    OcrIngredientsResult(
      status: json['status'] as int?,
      ingredientsTextFromImageOrig:
          json['ingredients_text_from_image_orig'] as String?,
      ingredientsTextFromImage: json['ingredients_text_from_image'] as String?,
    );

Map<String, dynamic> _$OcrIngredientsResultToJson(
        OcrIngredientsResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'ingredients_text_from_image_orig': instance.ingredientsTextFromImageOrig,
      'ingredients_text_from_image': instance.ingredientsTextFromImage,
    };
