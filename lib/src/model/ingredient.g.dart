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
  if (instance.rank case final value?) 'rank': value,
  if (instance.id case final value?) 'id': value,
  'text': instance.text,
  if (instance.isInTaxonomy case final value?) 'is_in_taxonomy': value,
  if (instance.percent case final value?) 'percent': value,
  if (instance.percentEstimate case final value?) 'percent_estimate': value,
  if (ingredientSpecialPropertyStatusToJson(instance.vegan) case final value?)
    'vegan': value,
  if (ingredientSpecialPropertyStatusToJson(instance.vegetarian)
      case final value?)
    'vegetarian': value,
  if (ingredientSpecialPropertyStatusToJson(instance.fromPalmOil)
      case final value?)
    'from_palm_oil': value,
  if (JsonHelper.ingredientsToJson(instance.ingredients) case final value?)
    'ingredients': value,
  'bold': instance.bold,
};
