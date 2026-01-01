// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
  rank: JsonObject.parseInt(json['rank']),
  id: json['id'] as String?,
  text: json['text'] as String?,
  isInTaxonomy: JsonObject.parseBool(json['is_in_taxonomy']),
  percent: JsonObject.parseDouble(json['percent']),
  percentEstimate: JsonObject.parseDouble(json['percent_estimate']),
  vegan: ingredientSpecialPropertyStatusFromJson(json['vegan']),
  vegetarian: ingredientSpecialPropertyStatusFromJson(json['vegetarian']),
  fromPalmOil: ingredientSpecialPropertyStatusFromJson(json['from_palm_oil']),
  ingredients: (json['ingredients'] as List<dynamic>?)
      ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
      .toList(),
  bold: json['bold'] as bool? ?? false,
);

Map<String, dynamic> _$IngredientToJson(
  Ingredient instance,
) => <String, dynamic>{
  'rank': ?instance.rank,
  'id': ?instance.id,
  'text': instance.text,
  'is_in_taxonomy': ?instance.isInTaxonomy,
  'percent': ?instance.percent,
  'percent_estimate': ?instance.percentEstimate,
  'vegan': ?ingredientSpecialPropertyStatusToJson(instance.vegan),
  'vegetarian': ?ingredientSpecialPropertyStatusToJson(instance.vegetarian),
  'from_palm_oil': ?ingredientSpecialPropertyStatusToJson(instance.fromPalmOil),
  'ingredients': ?JsonHelper.ingredientsToJson(instance.ingredients),
  'bold': instance.bold,
};
