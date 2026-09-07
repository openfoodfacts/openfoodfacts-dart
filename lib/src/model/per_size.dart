import 'off_tagged.dart';

/// Used for nutrient values: for which size of the product?
enum PerSize implements OffTagged {
  /// Per serving of product
  serving(offTag: 'serving'),

  /// Per 1 kg of product (pet food only).
  oneKg(offTag: '1kg'),

  /// Per 100 ml of product
  oneHundredMilliliters(offTag: '100ml'),

  /// Per 1 l of product
  oneLiter(offTag: '1l'),

  /// Per 100 grams of product
  oneHundredGrams(offTag: '100g');

  const PerSize({required this.offTag});

  @override
  final String offTag;

  /// Returns the first [PerSize] that matches the [offTag].
  static PerSize? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, PerSize.values) as PerSize?;
}
