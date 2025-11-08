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

  factory OrderedNutrients.fromJson(
    Map<String, dynamic> json, {
    final bool excludeReadOnly = true,
  }) {
    final OrderedNutrients result = _$OrderedNutrientsFromJson(json);
    if (excludeReadOnly == false) {
      return result;
    }
    _excludeReadOnly(result.nutrients);
    return result;
  }

  // cf. https://github.com/openfoodfacts/openfoodfacts-dart/issues/1160
  static void _excludeReadOnly(final List<OrderedNutrient>? orderedNutrients) {
    if (orderedNutrients == null) {
      return;
    }
    final List<int> remove = <int>[];
    for (int i = 0; i < orderedNutrients.length; i++) {
      final OrderedNutrient orderedNutrient = orderedNutrients[i];
      if (orderedNutrient.id.startsWith('nutrition')) {
        remove.add(i);
      } else {
        _excludeReadOnly(orderedNutrient.subNutrients);
      }
    }
    for (int i = remove.length - 1; i >= 0; i--) {
      orderedNutrients.removeAt(remove[i]);
    }
  }

  @override
  Map<String, dynamic> toJson() => _$OrderedNutrientsToJson(this);
}
