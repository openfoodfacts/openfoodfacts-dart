import 'package:meta/meta.dart';

/// Api version for product queries (minimum forced version number: 3).
///
/// cf. https://openfoodfacts.github.io/openfoodfacts-server/api/ref-api-and-product-schema-change-log/
class ProductQueryVersion {
  const ProductQueryVersion(final num version)
    : version = version < 3 ? 3 : version;

  final num version;

  // TODO: deprecated from 2026-06-25; remove when old enough
  @Deprecated('Use ProductQueryVersion.latestVersion instead')
  static const ProductQueryVersion v3 = ProductQueryVersion(3);

  static const ProductQueryVersion v3_1 = ProductQueryVersion(3.1);

  static const ProductQueryVersion latestVersion = v3_1;

  String getPath(final String barcode) =>
      '/api/v$version/product/${Uri.encodeComponent(barcode)}/';

  // TODO: deprecated from 2026-07-09; remove when old enough
  @Deprecated('Minimum version is now 3')
  bool matchesV3() => true;

  /// Useful for testing new API versions.
  @visibleForTesting
  static const ProductQueryVersion testVersion = latestVersion;

  int? get schemaVersion => switch (version) {
    3.1 => 1000,
    _ => null,
  };
}
