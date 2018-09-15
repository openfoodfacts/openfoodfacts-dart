// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ImageUrl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageUrl _$ImageUrlFromJson(Map<String, dynamic> json) {
  return ImageUrl(
      urlDE: json['de'] as String,
      urlEN: json['en'] as String,
      urlFR: json['fr'] as String);
}

Map<String, dynamic> _$ImageUrlToJson(ImageUrl instance) {
  var val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('de', instance.urlDE);
  writeNotNull('en', instance.urlEN);
  writeNotNull('fr', instance.urlFR);
  return val;
}
