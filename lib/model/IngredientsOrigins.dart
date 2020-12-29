import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'IngredientsOrigins.g.dart';

@JsonSerializable()
class IngredientsOrigins extends JsonObject {
  @JsonKey(name: "epi_score", includeIfNull: false, fromJson: JsonObject.parseDouble)
  double epiScore;
  @JsonKey(name: "epi_value", includeIfNull: false, fromJson: JsonObject.parseDouble)
  double epiValue;
  @JsonKey(name: "transportation_score", includeIfNull: false, fromJson: JsonObject.parseDouble)
  double transportationScore;
  @JsonKey(name: "transportation_value", includeIfNull: false, fromJson: JsonObject.parseDouble)
  double transportationValue;

  IngredientsOrigins({this.epiScore, this.epiValue, this.transportationScore, this.transportationValue});

  factory IngredientsOrigins.fromJson(Map<String, dynamic> json) =>
      _$IngredientsOriginsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$IngredientsOriginsToJson(this);
}
