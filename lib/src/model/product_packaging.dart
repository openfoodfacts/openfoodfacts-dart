import 'package:json_annotation/json_annotation.dart';
import 'localized_tag.dart';
import '../interface/json_object.dart';

part 'product_packaging.g.dart';

/// Packaging component for a product, e.g. recyclable bottle made of glass.
@JsonSerializable()
class ProductPackaging extends JsonObject {
  /// Shape, canonicalized using [TaxonomyPackagingShape].
  @JsonKey(
    includeIfNull: false,
    toJson: LocalizedTag.objToJson,
  )
  LocalizedTag? shape;

  /// Material, canonicalized using [TaxonomyPackagingMaterial].
  @JsonKey(
    includeIfNull: false,
    toJson: LocalizedTag.objToJson,
  )
  LocalizedTag? material;

  /// Recycling status, canonicalized using [TaxonomyPackagingRecycling].
  @JsonKey(
    includeIfNull: false,
    toJson: LocalizedTag.objToJson,
  )
  LocalizedTag? recycling;

  /// Number of units of this component contained in the product.
  ///
  /// E.g. 6 for a pack of 6 bottles.
  @JsonKey(
    name: 'number_of_units',
    includeIfNull: false,
    fromJson: JsonObject.parseInt,
  )
  int? numberOfUnits;

  /// Quantity (weight or volume) of food product contained.
  ///
  /// Ee.g. 75cl for a wine bottle.
  @JsonKey(name: 'quantity_per_unit', includeIfNull: false)
  String? quantityPerUnit;

  /// Weight in grams as measured by a user of one unit of the empty component.
  ///
  /// E.g. for a 6 pack of 1.5l water bottles, it might be 30, the weight in
  /// grams of 1 empty water bottle without its cap which is a different
  /// component.
  @JsonKey(
    name: 'weight_measured',
    includeIfNull: false,
    fromJson: JsonObject.parseDouble,
  )
  double? weightMeasured;

  ProductPackaging();

  factory ProductPackaging.fromJson(dynamic json) =>
      _$ProductPackagingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductPackagingToJson(this);

  Map<String, String> toServerData() => JsonObject.toDataStatic(toJson());

  @override
  String toString() => toServerData().toString();
}
