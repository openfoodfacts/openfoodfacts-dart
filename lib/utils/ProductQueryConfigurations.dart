import 'package:openfoodfacts/utils/AbstractQueryConfiguration.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';

/// Query version for single barcode
class ProductQueryVersion {
  const ProductQueryVersion(this.version);

  final int version;

  static const ProductQueryVersion v0 = ProductQueryVersion(0);
  static const ProductQueryVersion v2 = ProductQueryVersion(2);

  String getPath(final String barcode) {
    if (version == 0) {
      return '/api/v0/product/$barcode.json';
    }
    return '/api/v$version/product/$barcode/';
  }
}

/// Query Configuration for single barcode
class ProductQueryConfiguration extends AbstractQueryConfiguration {
  final String barcode;
  final ProductQueryVersion version;

  /// See [AbstractQueryConfiguration.languages] for
  /// parameter's description.
  ProductQueryConfiguration(
    this.barcode, {
    this.version = ProductQueryVersion.v0,
    final OpenFoodFactsLanguage? language,
    final List<OpenFoodFactsLanguage> languages = const [],
    @Deprecated('Use parameters language or languages instead')
        final String? lc,
    @Deprecated('Use parameter country instead') final String? cc,
    final OpenFoodFactsCountry? country,
    final List<ProductField>? fields,
  }) : super(
          language: language,
          languages: languages,
          lc: lc,
          cc: cc,
          country: country,
          fields: fields,
        );

  @override
  String getUriPath() => version.getPath(barcode);
}
