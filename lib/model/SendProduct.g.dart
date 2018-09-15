// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SendProduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendProduct _$SendProductFromJson(Map<String, dynamic> json) {
  return SendProduct(
      barcode: json['code'] as String,
      productName: json['product_name'] as String,
      lang: json['lang'] as String,
      brands: json['brands'] as String,
      quantity: json['quantity'] as String,
      ingredientsText: json['ingredients_text'] as String,
      nutrimentDataPer: json['nutrition_data_per'] as String,
      nutrimentEnergy: json['nutriment_energy'] as String,
      nutrimentEnergyUnit: json['nutriment_energy_unit'] as String);
}

Map<String, dynamic> _$SendProductToJson(SendProduct instance) {
  var val = <String, dynamic>{
    'code': instance.barcode,
    'product_name': instance.productName,
    'lang': instance.lang,
    'brands': instance.brands,
    'quantity': instance.quantity,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ingredients_text', instance.ingredientsText);
  writeNotNull('nutriment_energy', instance.nutrimentEnergy);
  writeNotNull('nutriment_energy_unit', instance.nutrimentEnergyUnit);
  writeNotNull('nutrition_data_per', instance.nutrimentDataPer);
  return val;
}
