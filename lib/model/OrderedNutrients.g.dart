// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderedNutrients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderedNutrients _$OrderedNutrientsFromJson(Map<String, dynamic> json) =>
    OrderedNutrients(
      subNutrients: OrderedNutrient.fromJsonOrderedNutrients(json['nutrients']),
    );

Map<String, dynamic> _$OrderedNutrientsToJson(OrderedNutrients instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nutrients',
      OrderedNutrient.toJsonOrderedNutrients(instance.subNutrients));
  return val;
}
