// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ImageLocation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageLocation _$ImageLocationFromJson(Map<String, dynamic> json) {
  return ImageLocation(
      front: json['front'] == null
          ? null
          : ImageSize.fromJson(json['front'] as Map<String, dynamic>),
      ingredients: json['ingredients'] == null
          ? null
          : ImageSize.fromJson(json['ingredients'] as Map<String, dynamic>),
      nutrition: json['nutrition'] == null
          ? null
          : ImageSize.fromJson(json['nutrition'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ImageLocationToJson(ImageLocation instance) {
  var val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('front', instance.front);
  writeNotNull('ingredients', instance.ingredients);
  writeNotNull('nutrition', instance.nutrition);
  return val;
}
