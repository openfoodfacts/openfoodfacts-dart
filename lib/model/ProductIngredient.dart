import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'ProductIngredient.g.dart';

enum ProductIngredientSpecialPropertyStatus {
  POSITIVE,
  NEGATIVE,
  MAYBE,
  IGNORE
}

@JsonSerializable()
class ProductIngredient extends JsonObject {
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
  ProductIngredientSpecialPropertyStatus? vegan;

  @JsonKey(
      includeIfNull: false,
      fromJson: ingredientSpecialPropertyStatusFromJson,
      toJson: ingredientSpecialPropertyStatusToJson)
  ProductIngredientSpecialPropertyStatus? vegetarian;

  @JsonKey(
      name: 'from_palm_oil',
      includeIfNull: false,
      fromJson: ingredientSpecialPropertyStatusFromJson,
      toJson: ingredientSpecialPropertyStatusToJson)
  ProductIngredientSpecialPropertyStatus? fromPalmOil;

  bool? bold;

  ProductIngredient(
      {this.rank,
      this.id,
      this.text,
      this.percent,
      this.vegan,
      this.vegetarian,
      this.fromPalmOil,
      this.bold = false});

  factory ProductIngredient.fromJson(Map<String, dynamic> json) =>
      _$ProductIngredientFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductIngredientToJson(this);
}

const Map<ProductIngredientSpecialPropertyStatus, String> _MAP = {
  ProductIngredientSpecialPropertyStatus.POSITIVE: 'yes',
  ProductIngredientSpecialPropertyStatus.NEGATIVE: 'no',
  ProductIngredientSpecialPropertyStatus.MAYBE: 'maybe',
  ProductIngredientSpecialPropertyStatus.IGNORE: 'ignore',
};

ProductIngredientSpecialPropertyStatus? ingredientSpecialPropertyStatusFromJson(
    dynamic json) {
  if (json == null || json is! String) {
    return null;
  }
  try {
    return ProductIngredientSpecialPropertyStatus.values.firstWhere(
      (final ProductIngredientSpecialPropertyStatus key) => _MAP[key] == json,
    );
  } on StateError {
    return null;
  }
}

String? ingredientSpecialPropertyStatusToJson(
    ProductIngredientSpecialPropertyStatus? status) {
  if (status == null) {
    return null;
  }
  final String? result = _MAP[status];
  if (result != null) {
    return result;
  }
  throw Exception('New enum type is not handled: $status');
}
