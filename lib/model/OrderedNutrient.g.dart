// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderedNutrient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderedNutrient _$OrderedNutrientFromJson(Map<String, dynamic> json) =>
    OrderedNutrient(
      important: json['important'] as bool,
      id: json['id'] as String,
      displayInEditForm: json['display_in_edit_form'] as bool,
      name: json['name'] as String?,
      subNutrients: OrderedNutrient.fromJsonOrderedNutrients(json['nutrients']),
    );

Map<String, dynamic> _$OrderedNutrientToJson(OrderedNutrient instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['important'] = instance.important;
  val['display_in_edit_form'] = instance.displayInEditForm;
  writeNotNull('nutrients',
      OrderedNutrient.toJsonOrderedNutrients(instance.subNutrients));
  return val;
}
