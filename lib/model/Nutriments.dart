import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/utils/UnitHelper.dart';
import '../interface/JsonObject.dart';

part 'Nutriments.g.dart';

@JsonSerializable()
class Nutriments extends JsonObject {
  @JsonKey(
      name: "salt_100g", includeIfNull: false, fromJson: JsonObject.parseDouble)
  double salt;
  @JsonKey(
      name: "fiber_100g",
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double fiber;
  @JsonKey(
      name: "sugars_100g",
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double sugars;
  @JsonKey(
      name: "fat_100g", includeIfNull: false, fromJson: JsonObject.parseDouble)
  double fat;
  @JsonKey(
      name: "saturated-fat_100g",
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double saturatedFat;
  @JsonKey(
      name: "proteins_100g",
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double proteins;
  @JsonKey(
      name: "nova-group_100g",
      includeIfNull: false,
      fromJson: JsonObject.parseInt)
  int novaGroup;
  @JsonKey(
      name: "energy_100g",
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double energy;
  @JsonKey(
      name: "carbohydrates_100g",
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double carbohydrates;

  @JsonKey(
      name: "salt_serving",
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double saltServing;
  @JsonKey(
      name: "fiber_serving",
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double fiberServing;
  @JsonKey(
      name: "sugars_serving",
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double sugarsServing;
  @JsonKey(
      name: "fat_serving",
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double fatServing;
  @JsonKey(
      name: "saturated-fat_serving",
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double saturatedFatServing;
  @JsonKey(
      name: "proteins_serving",
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double proteinsServing;
  @JsonKey(
      name: "nova-group_serving",
      includeIfNull: false,
      fromJson: JsonObject.parseInt)
  int novaGroupServing;
  @JsonKey(
      name: "energy_serving",
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double energyServing;
  @JsonKey(
      name: "carbohydrates_serving",
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double carbohydratesServing;

  @JsonKey(
      name: "energy_unit",
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit energyUnit;

  Nutriments(
      {this.salt,
      this.fiber,
      this.sugars,
      this.fat,
      this.saturatedFat,
      this.proteins,
      this.novaGroup,
      this.energy,
      this.carbohydrates,
      this.saltServing,
      this.fiberServing,
      this.sugarsServing,
      this.fatServing,
      this.saturatedFatServing,
      this.proteinsServing,
      this.novaGroupServing,
      this.energyServing,
      this.carbohydratesServing,
      this.energyUnit});

  factory Nutriments.fromJson(Map<String, dynamic> json) =>
      _$NutrimentsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NutrimentsToJson(this);

  static Map<String, dynamic> toJsonHelper(Nutriments n) =>
      _$NutrimentsToJson(n);
}
