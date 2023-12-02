import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';

part 'validation_error.g.dart';

/// Single API request validation error.
@JsonSerializable()
class ValidationError extends JsonObject {
  @JsonKey()
  String? msg;

  @JsonKey()
  String? type;

  ValidationError();

  factory ValidationError.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ValidationErrorToJson(this);
}
