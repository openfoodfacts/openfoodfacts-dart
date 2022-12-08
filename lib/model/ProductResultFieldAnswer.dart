import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/interface/JsonObject.dart';
import 'package:openfoodfacts/model/LocalizedTag.dart';
import 'package:openfoodfacts/model/ProductResultField.dart';

part 'ProductResultFieldAnswer.g.dart';

/// API V3 answer for one field.
@JsonSerializable()
class ProductResultFieldAnswer extends JsonObject {
  ProductResultFieldAnswer();

  /// Field on which there is a specific answer.
  @JsonKey(includeIfNull: false)
  ProductResultField? field;

  /// Impact, e.g. "Field ignored".
  @JsonKey(includeIfNull: false)
  LocalizedTag? impact;

  /// Message, e.g. "Missing field".
  @JsonKey(includeIfNull: false)
  LocalizedTag? message;

  factory ProductResultFieldAnswer.fromJson(Map<String, dynamic> json) =>
      _$ProductResultFieldAnswerFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductResultFieldAnswerToJson(this);

  @override
  String toString() => toJson().toString();
}
