/// Fields of a [Product] that can be simply added.
enum AddableProductField {
  BRANDS,
  STORES,
  COUNTRIES,
}

extension AddableProductFieldExtension on AddableProductField {
  static const Map<AddableProductField, String> _KEYS = {
    AddableProductField.BRANDS: 'add_brands',
    AddableProductField.STORES: 'add_stores',
    AddableProductField.COUNTRIES: 'add_countries',
  };

  /// Returns the key of the product field
  String get addableKey => _KEYS[this] ?? '';
}
