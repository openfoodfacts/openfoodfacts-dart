import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../interface/JsonObject.dart';

part 'Agribalyse.g.dart';

@CopyWith()
@JsonSerializable()
class Agribalyse extends JsonObject {
  @JsonKey(includeIfNull: false, fromJson: JsonObject.parseDouble)
  double? score;

  Agribalyse({this.score});

  factory Agribalyse.fromJson(Map<String, dynamic> json) =>
      _$AgribalyseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AgribalyseToJson(this);
}
