import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';
import "ImageUrl.dart";

part 'ImageSize.g.dart';

@JsonSerializable()
class ImageSize extends JsonObject {

  @JsonKey(includeIfNull: false)
  ImageUrl small;
  @JsonKey(includeIfNull: false)
  ImageUrl thumb;
  @JsonKey(includeIfNull: false)
  ImageUrl display;

  ImageSize({
    this.small,
    this.thumb,
    this.display
  });

  factory ImageSize.fromJson(Map<String, dynamic> json) => _$ImageSizeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ImageSizeToJson(this);
}