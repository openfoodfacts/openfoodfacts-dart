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

const Map<IngredientSpecialPropertyStatus, String> _MAP = {
  IngredientSpecialPropertyStatus.POSITIVE: 'yes',
  IngredientSpecialPropertyStatus.NEGATIVE: 'no',
  IngredientSpecialPropertyStatus.MAYBE: 'maybe',
  IngredientSpecialPropertyStatus.IGNORE: 'ignore',
};

IngredientSpecialPropertyStatus? ingredientSpecialPropertyStatusFromJson(
    dynamic json) {
  if (json == null || json is! String) {
    return null;
  }
  try {
    return IngredientSpecialPropertyStatus.values.firstWhere(
      (final IngredientSpecialPropertyStatus key) => _MAP[key] == json,
    );
  } on StateError {
    return null;
  }
}

String? ingredientSpecialPropertyStatusToJson(
    IngredientSpecialPropertyStatus? status) {
  if (status == null) {
    return null;
  }
  final String? result = _MAP[status];
  if (result != null) {
    return result;
  }
  throw Exception('New enum type is not handled: $status');
}
