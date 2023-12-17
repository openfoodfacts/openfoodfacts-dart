import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/src/prices/validation_error.dart';

import '../interface/json_object.dart';

part 'validation_errors.g.dart';

/// List of single API request validation errors.
@JsonSerializable()
class ValidationErrors extends JsonObject {
  @JsonKey()
  List<ValidationError>? detail;

  ValidationErrors();

  factory ValidationErrors.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ValidationErrorsToJson(this);
}
