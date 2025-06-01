import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';
import '../utils/json_helper.dart';

part 'product_result_field.g.dart';

/// Field part of an API V3 answer.
@JsonSerializable()
class ProductResultField extends JsonObject {
  ProductResultField();

  @JsonKey(includeIfNull: false)
  String? id;

  /// Value sent by the user, here converted to String.
  @JsonKey(
    includeIfNull: false,
    fromJson: JsonHelper.stringFromJSON,
  )
  String? value;

  @JsonKey(
    name: 'default_value',
    includeIfNull: false,
    fromJson: JsonHelper.stringFromJSON,
  )
  String? defaultValue;

  /// Value actually used by the server, here converted to String.
  @JsonKey(
    name: 'valued_converted',
    includeIfNull: false,
    fromJson: JsonHelper.stringFromJSON,
  )
  String? valuedConverted;

  factory ProductResultField.fromJson(Map<String, dynamic> json) =>
      _$ProductResultFieldFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductResultFieldToJson(this);

  @override
  String toString() => toJson().toString();
}
