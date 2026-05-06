import 'package:json_annotation/json_annotation.dart';
import '../model/off_tagged.dart';

/// Type of a Price.
enum PriceType implements OffTagged {
  @JsonValue('PRODUCT')
  product(offTag: 'PRODUCT'),

  @JsonValue('CATEGORY')
  category(offTag: 'CATEGORY');

  const PriceType({required this.offTag});

  @override
  final String offTag;

  /// Returns the first [PriceType] that matches the [offTag].
  static PriceType? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, PriceType.values) as PriceType?;
}
