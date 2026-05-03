// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordered_nutrient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderedNutrient _$OrderedNutrientFromJson(Map<String, dynamic> json) =>
    OrderedNutrient(
      important: json['important'] as bool,
      id: json['id'] as String,
      unit: json['unit'] as String?,
      displayInEditForm: json['display_in_edit_form'] as bool,
      name: json['name'] as String?,
      subNutrients: (json['nutrients'] as List<dynamic>?)
          ?.map((e) => OrderedNutrient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderedNutrientToJson(OrderedNutrient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': ?instance.name,
      'important': instance.important,
      'unit': ?instance.unit,
      'display_in_edit_form': instance.displayInEditForm,
      'nutrients': ?instance.subNutrients,
    };
