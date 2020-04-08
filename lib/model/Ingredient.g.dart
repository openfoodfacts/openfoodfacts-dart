// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return Ingredient(
    rank: JsonObject.parseInt(json['rank']),
    id: json['id'] as String,
    text: json['text'] as String,
    percent: JsonObject.parseInt(json['percent']),
    bold: json['bold'] as bool,
  );
}

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
  val['bold'] = instance.bold;
  return val;
}
