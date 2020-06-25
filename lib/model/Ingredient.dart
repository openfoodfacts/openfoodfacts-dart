import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'Ingredient.g.dart';

@JsonSerializable()
class Ingredient extends JsonObject {
  @JsonKey(includeIfNull: false, fromJson: JsonObject.parseInt)
  int rank;
  @JsonKey(includeIfNull: false)
  String id;
  @JsonKey(nullable: false)
  String text;
  @JsonKey(includeIfNull: false, fromJson: JsonObject.parseDouble)
  double percent;

  bool bold;

  Ingredient({this.rank, this.id, this.text, this.percent, this.bold = false});

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
