import 'package:meta/meta.dart';

import 'api_version.dart';

/// Api version for product queries (minimum forced version number: 3).
///
/// cf. https://openfoodfacts.github.io/openfoodfacts-server/api/ref-api-and-product-schema-change-log/
class ProductQueryVersion extends ApiVersion {
  const ProductQueryVersion(final num version)
    : super(version < 3 ? 3 : version);

  // TODO: deprecated from 2026-06-25; remove when old enough
  @Deprecated('Use ProductQueryVersion.latestVersion instead')
  static const ProductQueryVersion v3 = ProductQueryVersion(3);

  // TODO: deprecated from 2026-07-20; remove when old enough
  @Deprecated('Use ProductQueryVersion.latestVersion instead')
  static const ProductQueryVersion v3_1 = ProductQueryVersion(3.1);

  // TODO: deprecated from 2026-07-26; remove when old enough
  @Deprecated('Use ProductQueryVersion.latestVersion instead')
  static const ProductQueryVersion v3_2 = ProductQueryVersion(3.2);

  // TODO: deprecated from 2026-07-27; remove when old enough
  @Deprecated('Use ProductQueryVersion.latestVersion instead')
  static const ProductQueryVersion v3_3 = ProductQueryVersion(3.3);

  static const ProductQueryVersion v3_4 = ProductQueryVersion(3.4);

  static const ProductQueryVersion latestVersion = v3_4;

  // TODO: deprecated from 2026-07-27; remove when old enough
  @Deprecated('Source of confusion. Use getApiPath instead.')
  String getPath(final String barcode) =>
      getApiPath('product/${Uri.encodeComponent(barcode)}/');

  // TODO: deprecated from 2026-07-09; remove when old enough
  @Deprecated('Minimum version is now 3')
  bool matchesV3() => true;

  /// Useful for testing new API versions.
  @visibleForTesting
  static const ProductQueryVersion testVersion = latestVersion;

  int? get schemaVersion => switch (version) {
    3.1 => 1000,
    3.2 => 1001,
    3.3 => 1002,
    3.4 => 1002,
    _ => null,
  };
}
