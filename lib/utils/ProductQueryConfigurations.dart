import 'package:openfoodfacts/utils/AbstractQueryConfiguration.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:openfoodfacts/utils/UriHelper.dart';

/// Query version for single barcode
class ProductQueryVersion {
  const ProductQueryVersion(this.version);

  const ProductQueryVersion.v0() : this(0);
  const ProductQueryVersion.v2() : this(2);

  final int version;

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
    this.version = const ProductQueryVersion.v0(),
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

  Uri getUri({final QueryType? queryType}) => UriHelper.getUri(
        path: version.getPath(barcode),
        queryParameters: getParametersMap(),
        queryType: queryType,
      );
}
