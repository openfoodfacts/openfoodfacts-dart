// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ImageSize.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageSize _$ImageSizeFromJson(Map<String, dynamic> json) {
  return ImageSize(
      small: json['small'] == null
          ? null
          : ImageUrl.fromJson(json['small'] as Map<String, dynamic>),
      thumb: json['thumb'] == null
          ? null
          : ImageUrl.fromJson(json['thumb'] as Map<String, dynamic>),
      display: json['display'] == null
          ? null
          : ImageUrl.fromJson(json['display'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ImageSizeToJson(ImageSize instance) {
  var val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('small', instance.small);
  writeNotNull('thumb', instance.thumb);
  writeNotNull('display', instance.display);
  return val;
}
