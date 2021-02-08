import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'OcrIngredientsResult.g.dart';

@JsonSerializable()
class OcrIngredientsResult extends JsonObject {
  final int status;

  @JsonKey(name: "ingredients_text_from_image_orig")
  final String ingredientsTextFromImageOrig;

  @JsonKey(name: "ingredients_text_from_image")
  final String ingredientsTextFromImage;

  const OcrIngredientsResult(
      {this.status,
      this.ingredientsTextFromImageOrig,
      this.ingredientsTextFromImage});

  factory OcrIngredientsResult.fromJson(Map<String, dynamic> json) =>
      _$OcrIngredientsResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OcrIngredientsResultToJson(this);
}
