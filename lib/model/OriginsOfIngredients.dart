import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../interface/JsonObject.dart';

part 'OriginsOfIngredients.g.dart';

@CopyWith()
@JsonSerializable()
class OriginsOfIngredients extends JsonObject {
  @JsonKey(
      name: 'epi_score', includeIfNull: false, fromJson: JsonObject.parseDouble)
  double? epiScore;
  @JsonKey(
      name: 'epi_value', includeIfNull: false, fromJson: JsonObject.parseDouble)
  double? epiValue;
  @JsonKey(
      name: 'transportation_score',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? transportationScore;
  @JsonKey(
      name: 'transportation_value',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? transportationValue;

  OriginsOfIngredients(
      {this.epiScore,
      this.epiValue,
      this.transportationScore,
      this.transportationValue});

  factory OriginsOfIngredients.fromJson(Map<String, dynamic> json) =>
      _$OriginsOfIngredientsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OriginsOfIngredientsToJson(this);
}
