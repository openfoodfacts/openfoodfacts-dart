import 'package:json_annotation/json_annotation.dart';
import '../utils/json_helper.dart';
import '../interface/json_object.dart';

part 'ingredient.g.dart';

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
      name: 'percent_estimate',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? percentEstimate;

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

  @JsonKey(
      name: 'ingredients',
      includeIfNull: false,
      toJson: JsonHelper.ingredientsToJson)
  List<Ingredient>? ingredients;

  bool? bold;

  Ingredient(
      {this.rank,
      this.id,
      this.text,
      this.percent,
      this.percentEstimate,
      this.vegan,
      this.vegetarian,
      this.fromPalmOil,
      this.ingredients,
      this.bold = false});

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$IngredientToJson(this);

  @override
  String toString() => 'Ingredient('
      '${id == null ? '' : 'id=$id'}'
      '${rank == null ? '' : ',rank=$rank'}'
      '${text == null ? '' : ',text=$text'}'
      '${percent == null ? '' : ',percent=$percent'}'
      '${percentEstimate == null ? '' : ',percentEstimate=$percentEstimate'}'
      '${vegan == null ? '' : ',vegan=$vegan'}'
      '${vegetarian == null ? '' : ',vegetarian=$vegetarian'}'
      '${fromPalmOil == null ? '' : ',fromPalmOil=$fromPalmOil'}'
      '${bold == null ? '' : ',bold=$bold'}'
      '${ingredients == null ? '' : ',ingredients=$ingredients'}'
      ')';

  Ingredient copyWith({
    int? rank,
    String? id,
    String? text,
    double? percent,
    double? percentEstimate,
    IngredientSpecialPropertyStatus? vegan,
    IngredientSpecialPropertyStatus? vegetarian,
    IngredientSpecialPropertyStatus? fromPalmOil,
    List<Ingredient>? ingredients,
    bool? bold,
  }) {
    return Ingredient(
      rank: rank ?? this.rank,
      id: id ?? this.id,
      text: text ?? this.text,
      percent: percent ?? this.percent,
      percentEstimate: percentEstimate ?? this.percentEstimate,
      vegan: vegan ?? this.vegan,
      vegetarian: vegetarian ?? this.vegetarian,
      fromPalmOil: fromPalmOil ?? this.fromPalmOil,
      ingredients: ingredients ?? this.ingredients,
      bold: bold ?? this.bold,
    );
  }
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
