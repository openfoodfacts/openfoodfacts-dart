import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'ProductResultField.g.dart';

/// Field part of an API V3 answer.
@JsonSerializable()
class ProductResultField extends JsonObject {
  ProductResultField();

  @JsonKey(includeIfNull: false)
  String? id;

  @JsonKey(includeIfNull: false)
  String? value;

  @JsonKey(name: 'default_value', includeIfNull: false)
  String? defaultValue;

  factory ProductResultField.fromJson(Map<String, dynamic> json) =>
      _$ProductResultFieldFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductResultFieldToJson(this);

  @override
  String toString() => toJson().toString();
}
