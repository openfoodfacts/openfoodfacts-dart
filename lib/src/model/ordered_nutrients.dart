import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';
import 'ordered_nutrient.dart';

part 'ordered_nutrients.g.dart';

/// Nutrients, as hierarchically ordered and localized entities.
///
/// cf. https://github.com/openfoodfacts/openfoodfacts-dart/issues/210
/// Example in https://fr.openfoodfacts.org/cgi/nutrients.pl
/// Compared to [OrderedNutrient], this is the root of the structure.
@JsonSerializable()
class OrderedNutrients extends JsonObject {
  /// Most important nutrients (level 0 in the hierarchy)
  @JsonKey()
  final List<OrderedNutrient> nutrients;

  OrderedNutrients({required this.nutrients});

  factory OrderedNutrients.fromJson(Map<String, dynamic> json) =>
      _$OrderedNutrientsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OrderedNutrientsToJson(this);
}
