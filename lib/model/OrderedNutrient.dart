import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'OrderedNutrient.g.dart';

/// Nutrient, as a hierarchically ordered and localized entity.
///
/// cf. https://github.com/openfoodfacts/openfoodfacts-dart/issues/210
/// Example in https://fr.openfoodfacts.org/cgi/nutrients.pl
/// To be compared to [OrderedNutrients], which is the root of the structure.
@JsonSerializable()
class OrderedNutrient extends JsonObject {
  /// Nutrient ID (e.g. 'energy-kcal')
  @JsonKey(name: 'id', includeIfNull: false)
  final String id;

  /// Localized nutrient name (e.g. 'Energía (kcal)' in Spanish)
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;

  @JsonKey(name: 'important', includeIfNull: false)
  final bool important;

  @JsonKey(name: 'display_in_edit_form', includeIfNull: false)
  final bool displayInEditForm;

  /// Hierarchically related nutrients
  @JsonKey(
      name: 'nutrients',
      fromJson: fromJsonOrderedNutrients,
      toJson: toJsonOrderedNutrients,
      includeIfNull: false)
  final List<OrderedNutrient>? subNutrients;

  OrderedNutrient({
    required this.important,
    required this.id,
    required this.displayInEditForm,
    this.name,
    this.subNutrients,
  });

  factory OrderedNutrient.fromJson(Map<String, dynamic> json) =>
      _$OrderedNutrientFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OrderedNutrientToJson(this);

  @override
  String toString() => toJson().toString();

  static List<OrderedNutrient>? fromJsonOrderedNutrients(dynamic list) {
    if (list == null) {
      return null;
    }
    if (!(list is List<dynamic>)) {
      throw Exception('Expected type: List<dynamic>');
    }
    final List<OrderedNutrient> result = [];
    for (final item in list) {
      result.add(OrderedNutrient.fromJson(item));
    }
    return result;
  }

  static List<dynamic>? toJsonOrderedNutrients(List<OrderedNutrient>? list) {
    if (list == null) {
      return null;
    }
    final List<dynamic> result = [];
    for (final item in list) {
      result.add(item.toJson());
    }
    return result;
  }
}
