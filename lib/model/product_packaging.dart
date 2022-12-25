import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/model/localized_tag.dart';
import '../interface/json_object.dart';

part 'product_packaging.g.dart';

/// Packaging component for a product, e.g. recyclable bottle made of glass.
@JsonSerializable()
class ProductPackaging extends JsonObject {
  @JsonKey(includeIfNull: false)
  LocalizedTag? shape;

  @JsonKey(includeIfNull: false)
  LocalizedTag? material;

  @JsonKey(includeIfNull: false)
  LocalizedTag? recycling;

  @JsonKey(
    name: 'number_of_units',
    includeIfNull: false,
    fromJson: JsonObject.parseInt,
  )
  int? numberOfUnits;

  ProductPackaging();

  factory ProductPackaging.fromJson(dynamic json) =>
      _$ProductPackagingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductPackagingToJson(this);

  Map<String, String> toServerData() => JsonObject.toDataStatic(toJson());

  @override
  String toString() => toServerData().toString();
}
