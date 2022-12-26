// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecoscore_adjustments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcoscoreAdjustments _$EcoscoreAdjustmentsFromJson(Map<String, dynamic> json) =>
    EcoscoreAdjustments(
      packaging: json['packaging'] == null
          ? null
          : Packaging.fromJson(json['packaging'] as Map<String, dynamic>),
      originsOfIngredients: json['origins_of_ingredients'] == null
          ? null
          : OriginsOfIngredients.fromJson(
              json['origins_of_ingredients'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EcoscoreAdjustmentsToJson(EcoscoreAdjustments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('packaging', instance.packaging?.toJson());
  writeNotNull(
      'origins_of_ingredients', instance.originsOfIngredients?.toJson());
  return val;
}
