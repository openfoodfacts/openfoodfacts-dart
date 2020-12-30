import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';
import 'OriginsOfIngredients.dart';
import 'Packaging.dart';

part 'EcoscoreAdjustments.g.dart';

@JsonSerializable()
class EcoscoreAdjustments extends JsonObject {
  @JsonKey(includeIfNull: false)
  Packaging packaging;
  @JsonKey(name: "origins_of_ingredients", includeIfNull: false)
  OriginsOfIngredients originsOfIngredients;

  EcoscoreAdjustments({this.packaging, this.originsOfIngredients});

  factory EcoscoreAdjustments.fromJson(Map<String, dynamic> json) =>
      _$EcoscoreAdjustmentsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EcoscoreAdjustmentsToJson(this);
}
