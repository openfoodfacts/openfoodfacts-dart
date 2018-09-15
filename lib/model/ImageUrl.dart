import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'ImageUrl.g.dart';

@JsonSerializable()
class ImageUrl extends JsonObject {

  @JsonKey(name: 'de', includeIfNull: false)
  String urlDE;
  @JsonKey(name: 'en', includeIfNull: false)
  String urlEN;
  @JsonKey(name: 'fr', includeIfNull: false)
  String urlFR;

  ImageUrl({
    this.urlDE,
    this.urlEN,
    this.urlFR
  });

  factory ImageUrl.fromJson(Map<String, dynamic> json) => _$ImageUrlFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ImageUrlToJson(this);
}