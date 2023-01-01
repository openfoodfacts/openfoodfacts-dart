// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agribalyse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Agribalyse _$AgribalyseFromJson(Map<String, dynamic> json) => Agribalyse(
      score: JsonObject.parseDouble(json['score']),
    );

Map<String, dynamic> _$AgribalyseToJson(Agribalyse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('score', instance.score);
  return val;
}
