import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'Nutriments.g.dart';

@JsonSerializable()
class Nutriments extends JsonObject {
  @JsonKey(name: "salt_100g", includeIfNull: false)
  double salt;
  @JsonKey(name: "fiber_100g", includeIfNull: false)
  double fiber;
  @JsonKey(name: "sugars_100g", includeIfNull: false)
  double sugars;
  @JsonKey(name: "fat_100g", includeIfNull: false)
  double fat;
  @JsonKey(name: "saturated-fat_100g", includeIfNull: false)
  double saturatedFat;
  @JsonKey(name: "proteins_100g", includeIfNull: false)
  double proteins;
  @JsonKey(
      name: "nova-group_100g",
      includeIfNull: false,
      fromJson: JsonObject.parseInt)
  int novaGroup;
  @JsonKey(name: "energy_100g", includeIfNull: false)
  double energy;
  @JsonKey(name: "carbohydrates_100g", includeIfNull: false)
  double carbohydrates;

  Nutriments(
      {this.salt,
      this.fiber,
      this.sugars,
      this.fat,
      this.saturatedFat,
      this.proteins,
      this.novaGroup,
      this.energy,
      this.carbohydrates});

  factory Nutriments.fromJson(Map<String, dynamic> json) =>
      _$NutrimentsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NutrimentsToJson(this);
}
