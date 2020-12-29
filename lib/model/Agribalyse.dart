import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'Agribalyse.g.dart';

@JsonSerializable()
class Agribalyse extends JsonObject {
  @JsonKey(includeIfNull: false, fromJson: JsonObject.parseDouble)
  double score;

  Agribalyse({this.score});

  factory Agribalyse.fromJson(Map<String, dynamic> json) =>
      _$AgribalyseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AgribalyseToJson(this);
}
