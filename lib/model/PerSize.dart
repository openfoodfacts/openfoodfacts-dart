/// Used for nutrient values: for which size of the product?
enum PerSize {
  /// Per serving of product
  serving,

  /// Per 100 grams of product
  oneHundredGrams,
}

/// Helper class around [PerSize].
extension PerSizeExtension on PerSize {
  /// Returns the tag used in [Nutriments]'s map.
  String get tag {
    switch (this) {
      case PerSize.serving:
        return 'serving';
      case PerSize.oneHundredGrams:
        return '100g';
    }
  }
}
