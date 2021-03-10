import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'Ingredient.g.dart';

enum IngredientSpecialPropertyStatus { POSITIVE, NEGATIVE, MAYBE, IGNORE }

@JsonSerializable()
class Ingredient extends JsonObject {
  @JsonKey(includeIfNull: false, fromJson: JsonObject.parseInt)
  int? rank;
  @JsonKey(includeIfNull: false)
  String? id;
  @JsonKey()
  String? text;
  @JsonKey(includeIfNull: false, fromJson: JsonObject.parseDouble)
  double? percent;

  @JsonKey(
      includeIfNull: false,
      fromJson: ingredientSpecialPropertyStatusFromJson,
      toJson: ingredientSpecialPropertyStatusToJson)
  IngredientSpecialPropertyStatus? vegan;

  @JsonKey(
      includeIfNull: false,
      fromJson: ingredientSpecialPropertyStatusFromJson,
      toJson: ingredientSpecialPropertyStatusToJson)
  IngredientSpecialPropertyStatus? vegetarian;

  @JsonKey(
      name: 'from_palm_oil',
      includeIfNull: false,
      fromJson: ingredientSpecialPropertyStatusFromJson,
      toJson: ingredientSpecialPropertyStatusToJson)
  IngredientSpecialPropertyStatus? fromPalmOil;

  bool? bold;

  Ingredient(
      {this.rank,
      this.id,
      this.text,
      this.percent,
      this.vegan,
      this.vegetarian,
      this.fromPalmOil,
      this.bold = false});

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}

IngredientSpecialPropertyStatus? ingredientSpecialPropertyStatusFromJson(
    dynamic json) {
  if (json == null || json is! String) {
    return null;
  }
  switch (json) {
    case 'yes':
      return IngredientSpecialPropertyStatus.POSITIVE;
    case 'no':
      return IngredientSpecialPropertyStatus.NEGATIVE;
    case 'maybe':
      return IngredientSpecialPropertyStatus.MAYBE;
    case 'ignore':
      return IngredientSpecialPropertyStatus.IGNORE;
    default:
      return null;
  }
}

String? ingredientSpecialPropertyStatusToJson(
    IngredientSpecialPropertyStatus? status) {
  if (status == null) {
    return null;
  }
  switch (status) {
    case IngredientSpecialPropertyStatus.POSITIVE:
      return 'yes';
    case IngredientSpecialPropertyStatus.NEGATIVE:
      return 'no';
    case IngredientSpecialPropertyStatus.MAYBE:
      return 'maybe';
    case IngredientSpecialPropertyStatus.IGNORE:
      return 'ignore';
    default:
      throw Exception('New enum type is not handled: $status');
  }
}
