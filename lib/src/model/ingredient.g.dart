// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      rank: JsonObject.parseInt(json['rank']),
      id: json['id'] as String?,
      text: json['text'] as String?,
      percent: JsonObject.parseDouble(json['percent']),
      percentEstimate: JsonObject.parseDouble(json['percent_estimate']),
      vegan: ingredientSpecialPropertyStatusFromJson(json['vegan']),
      vegetarian: ingredientSpecialPropertyStatusFromJson(json['vegetarian']),
      fromPalmOil:
          ingredientSpecialPropertyStatusFromJson(json['from_palm_oil']),
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      bold: json['bold'] as bool? ?? false,
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('rank', instance.rank);
  writeNotNull('id', instance.id);
  val['text'] = instance.text;
  writeNotNull('percent', instance.percent);
  writeNotNull('percent_estimate', instance.percentEstimate);
  writeNotNull('vegan', ingredientSpecialPropertyStatusToJson(instance.vegan));
  writeNotNull(
      'vegetarian', ingredientSpecialPropertyStatusToJson(instance.vegetarian));
  writeNotNull('from_palm_oil',
      ingredientSpecialPropertyStatusToJson(instance.fromPalmOil));
  writeNotNull(
      'ingredients', JsonHelper.ingredientsToJson(instance.ingredients));
  val['bold'] = instance.bold;
  return val;
}
