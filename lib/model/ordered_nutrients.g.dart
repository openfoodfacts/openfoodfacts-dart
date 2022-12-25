// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordered_nutrients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderedNutrients _$OrderedNutrientsFromJson(Map<String, dynamic> json) =>
    OrderedNutrients(
      nutrients: (json['nutrients'] as List<dynamic>)
          .map((e) => OrderedNutrient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderedNutrientsToJson(OrderedNutrients instance) =>
    <String, dynamic>{
      'nutrients': instance.nutrients,
    };
