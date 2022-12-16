// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductPackaging.dart';

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
      ..numberOfUnits = JsonObject.parseInt(json['number_of_units']);

Map<String, dynamic> _$ProductPackagingToJson(ProductPackaging instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shape', instance.shape);
  writeNotNull('material', instance.material);
  writeNotNull('recycling', instance.recycling);
  writeNotNull('number_of_units', instance.numberOfUnits);
  return val;
}
