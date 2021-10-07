// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductIngredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductIngredient _$ProductIngredientFromJson(Map<String, dynamic> json) =>
    ProductIngredient(
      rank: JsonObject.parseInt(json['rank']),
      id: json['id'] as String?,
      text: json['text'] as String?,
      percent: JsonObject.parseDouble(json['percent']),
      vegan: ingredientSpecialPropertyStatusFromJson(json['vegan']),
      vegetarian: ingredientSpecialPropertyStatusFromJson(json['vegetarian']),
      fromPalmOil:
          ingredientSpecialPropertyStatusFromJson(json['from_palm_oil']),
      bold: json['bold'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductIngredientToJson(ProductIngredient instance) {
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
  writeNotNull('vegan', ingredientSpecialPropertyStatusToJson(instance.vegan));
  writeNotNull(
      'vegetarian', ingredientSpecialPropertyStatusToJson(instance.vegetarian));
  writeNotNull('from_palm_oil',
      ingredientSpecialPropertyStatusToJson(instance.fromPalmOil));
  val['bold'] = instance.bold;
  return val;
}
