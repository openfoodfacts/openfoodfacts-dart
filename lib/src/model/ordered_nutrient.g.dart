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
      if (instance.name case final value?) 'name': value,
      'important': instance.important,
      if (instance.unit case final value?) 'unit': value,
      'display_in_edit_form': instance.displayInEditForm,
      if (instance.subNutrients case final value?) 'nutrients': value,
    };
