import 'off_tagged.dart';

/// Used for nutrient values: for which size of the product?
enum PerSize implements OffTagged {
  /// Per serving of product
  serving(offTag: 'serving'),

  /// Per 100 grams of product
  oneHundredGrams(offTag: '100g');

  const PerSize({
    required this.offTag,
  });

  @override
  final String offTag;

  /// Returns the first [PerSize] that matches the [offTag].
  static PerSize? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, PerSize.values) as PerSize?;
}
