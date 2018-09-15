import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';
import "ImageSize.dart";

part 'ImageLocation.g.dart';

@JsonSerializable()
class ImageLocation extends JsonObject {

  @JsonKey(includeIfNull: false)
  ImageSize front;
  @JsonKey(includeIfNull: false)
  ImageSize ingredients;
  @JsonKey(includeIfNull: false)
  ImageSize nutrition;

  ImageLocation({
    this.front,
    this.ingredients,
    this.nutrition
  });

  factory ImageLocation.fromJson(Map<String, dynamic> json) => _$ImageLocationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ImageLocationToJson(this);
}