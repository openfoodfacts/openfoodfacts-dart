import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';
import 'IngredientsOrigins.dart';
import 'Packaging.dart';

part 'EcoscoreAdjustments.g.dart';

@JsonSerializable()
class EcoscoreAdjustments extends JsonObject {
  @JsonKey(includeIfNull: false)
  Packaging packaging;
  @JsonKey(name: "origins_of_ingredients", includeIfNull: false)
  IngredientsOrigins ingredientsOrigins;

  EcoscoreAdjustments({this.packaging, this.ingredientsOrigins});

  factory EcoscoreAdjustments.fromJson(Map<String, dynamic> json) =>
      _$EcoscoreAdjustmentsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EcoscoreAdjustmentsToJson(this);
}
