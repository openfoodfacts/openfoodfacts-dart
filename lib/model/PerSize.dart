import 'package:openfoodfacts/model/OffTagged.dart';

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
}
