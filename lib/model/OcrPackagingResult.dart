import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../interface/JsonObject.dart';

part 'OcrPackagingResult.g.dart';

/// Result from OCR applied to packaging.
@CopyWith()
@JsonSerializable()
class OcrPackagingResult extends JsonObject {
  const OcrPackagingResult({
    this.status,
    this.textFromImageOrig,
    this.textFromImage,
  });

  factory OcrPackagingResult.fromJson(Map<String, dynamic> json) =>
      _$OcrPackagingResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OcrPackagingResultToJson(this);

  final int? status;

  @JsonKey(name: 'packaging_text_from_image_orig')
  final String? textFromImageOrig;

  @JsonKey(name: 'packaging_text_from_image')
  final String? textFromImage;
}
