// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_packaging.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductPackaging _$ProductPackagingFromJson(Map<String, dynamic> json) =>
    ProductPackaging()
      ..shape = json['shape'] == null
          ? null
          : LocalizedTag.fromJson(json['shape'] as Map<String, dynamic>)
      ..material = json['material'] == null
          ? null
          : LocalizedTag.fromJson(json['material'] as Map<String, dynamic>)
      ..recycling = json['recycling'] == null
          ? null
          : LocalizedTag.fromJson(json['recycling'] as Map<String, dynamic>)
      ..numberOfUnits = JsonObject.parseInt(json['number_of_units'])
      ..quantityPerUnit = json['quantity_per_unit'] as String?
      ..weightMeasured = JsonObject.parseDouble(json['weight_measured']);

Map<String, dynamic> _$ProductPackagingToJson(ProductPackaging instance) =>
    <String, dynamic>{
      'shape': LocalizedTag.objToJson(instance.shape),
      'material': LocalizedTag.objToJson(instance.material),
      'recycling': LocalizedTag.objToJson(instance.recycling),
      if (instance.numberOfUnits case final value?) 'number_of_units': value,
      if (instance.quantityPerUnit case final value?)
        'quantity_per_unit': value,
      if (instance.weightMeasured case final value?) 'weight_measured': value,
    };
