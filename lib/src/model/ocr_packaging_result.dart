import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';

part 'ocr_packaging_result.g.dart';

/// Result from OCR applied to packaging.
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

  OcrPackagingResult copyWith({
    int? status,
    String? textFromImageOrig,
    String? textFromImage,
  }) {
    return OcrPackagingResult(
      status: status ?? this.status,
      textFromImageOrig: textFromImageOrig ?? this.textFromImageOrig,
      textFromImage: textFromImage ?? this.textFromImage,
    );
  }
}
