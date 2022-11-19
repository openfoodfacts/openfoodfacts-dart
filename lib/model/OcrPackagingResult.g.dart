// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OcrPackagingResult.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OcrPackagingResultCWProxy {
  OcrPackagingResult status(int? status);

  OcrPackagingResult textFromImage(String? textFromImage);

  OcrPackagingResult textFromImageOrig(String? textFromImageOrig);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OcrPackagingResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OcrPackagingResult(...).copyWith(id: 12, name: "My name")
  /// ````
  OcrPackagingResult call({
    int? status,
    String? textFromImage,
    String? textFromImageOrig,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOcrPackagingResult.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOcrPackagingResult.copyWith.fieldName(...)`
class _$OcrPackagingResultCWProxyImpl implements _$OcrPackagingResultCWProxy {
  final OcrPackagingResult _value;

  const _$OcrPackagingResultCWProxyImpl(this._value);

  @override
  OcrPackagingResult status(int? status) => this(status: status);

  @override
  OcrPackagingResult textFromImage(String? textFromImage) =>
      this(textFromImage: textFromImage);

  @override
  OcrPackagingResult textFromImageOrig(String? textFromImageOrig) =>
      this(textFromImageOrig: textFromImageOrig);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OcrPackagingResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OcrPackagingResult(...).copyWith(id: 12, name: "My name")
  /// ````
  OcrPackagingResult call({
    Object? status = const $CopyWithPlaceholder(),
    Object? textFromImage = const $CopyWithPlaceholder(),
    Object? textFromImageOrig = const $CopyWithPlaceholder(),
  }) {
    return OcrPackagingResult(
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as int?,
      textFromImage: textFromImage == const $CopyWithPlaceholder()
          ? _value.textFromImage
          // ignore: cast_nullable_to_non_nullable
          : textFromImage as String?,
      textFromImageOrig: textFromImageOrig == const $CopyWithPlaceholder()
          ? _value.textFromImageOrig
          // ignore: cast_nullable_to_non_nullable
          : textFromImageOrig as String?,
    );
  }
}

extension $OcrPackagingResultCopyWith on OcrPackagingResult {
  /// Returns a callable class that can be used as follows: `instanceOfOcrPackagingResult.copyWith(...)` or like so:`instanceOfOcrPackagingResult.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OcrPackagingResultCWProxy get copyWith =>
      _$OcrPackagingResultCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OcrPackagingResult _$OcrPackagingResultFromJson(Map<String, dynamic> json) =>
    OcrPackagingResult(
      status: json['status'] as int?,
      textFromImageOrig: json['packaging_text_from_image_orig'] as String?,
      textFromImage: json['packaging_text_from_image'] as String?,
    );

Map<String, dynamic> _$OcrPackagingResultToJson(OcrPackagingResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'packaging_text_from_image_orig': instance.textFromImageOrig,
      'packaging_text_from_image': instance.textFromImage,
    };
