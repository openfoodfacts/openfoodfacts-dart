import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';
import 'origins_of_ingredients.dart';
import 'packaging.dart';

part 'ecoscore_adjustments.g.dart';

@JsonSerializable(explicitToJson: true)
class EcoscoreAdjustments extends JsonObject {
  @JsonKey(includeIfNull: false)
  Packaging? packaging;
  @JsonKey(name: 'origins_of_ingredients', includeIfNull: false)
  OriginsOfIngredients? originsOfIngredients;

  EcoscoreAdjustments({this.packaging, this.originsOfIngredients});

  factory EcoscoreAdjustments.fromJson(Map<String, dynamic> json) =>
      _$EcoscoreAdjustmentsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EcoscoreAdjustmentsToJson(this);
}
