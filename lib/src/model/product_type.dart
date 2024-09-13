import 'package:json_annotation/json_annotation.dart';
import 'off_tagged.dart';
import '../prices/flavor.dart';
import '../utils/server_type.dart';

/// Type used at the [Product] level (e.g. "this is a pet food product").
///
/// Somehow redundant with [ServerType] and [Flavor].
enum ProductType implements OffTagged {
  @JsonValue('food')
  food(offTag: 'food'),

  @JsonValue('beauty')
  beauty(offTag: 'beauty'),

  @JsonValue('petfood')
  petFood(offTag: 'petfood'),

  @JsonValue('product')
  product(offTag: 'product');

  const ProductType({
    required this.offTag,
  });

  @override
  final String offTag;

  /// Returns the first [ProductType] that matches the [offTag].
  static ProductType? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, ProductType.values) as ProductType?;
}
