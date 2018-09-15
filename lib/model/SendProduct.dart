import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'SendProduct.g.dart';

@JsonSerializable()
class SendProduct extends JsonObject {

  @JsonKey(name: 'code', nullable: false)
  final String barcode;
  @JsonKey(name: 'product_name', nullable: false)
  final String productName;

  final String lang;
  final String brands;
  final String quantity;

  @JsonKey(name: 'ingredients_text', includeIfNull: false)
  final String ingredientsText;

  @JsonKey(name: 'nutriment_energy', includeIfNull: false)
  final String nutrimentEnergy;
  @JsonKey(name: 'nutriment_energy_unit', includeIfNull: false)
  final String nutrimentEnergyUnit;
  @JsonKey(name: 'nutrition_data_per', includeIfNull: false)
  final String nutrimentDataPer;

  const SendProduct({
    @required this.barcode,
    @required this.productName,
    this.lang,
    this.brands,
    this.quantity,
    this.ingredientsText,
    this.nutrimentDataPer,
    this.nutrimentEnergy,
    this.nutrimentEnergyUnit,
  });


  factory SendProduct.fromJson(Map<String, dynamic> json) => _$SendProductFromJson(json);

  Map<String, dynamic> toJson() => _$SendProductToJson(this);
}