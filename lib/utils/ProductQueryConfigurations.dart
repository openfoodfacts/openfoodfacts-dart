import 'package:openfoodfacts/utils/AbstractQueryConfiguration.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:openfoodfacts/utils/UriHelper.dart';

enum ProductQueryVersion {
  V0,
  V2,
}

/// Query Configuration for single barcode
class ProductQueryConfiguration extends AbstractQueryConfiguration {
  final String barcode;
  final ProductQueryVersion version;

  /// See [AbstractQueryConfiguration.languages] for
  /// parameter's description.
  ProductQueryConfiguration(
    this.barcode, {
    this.version = ProductQueryVersion.V0,
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
        path: _getPath(),
        queryParameters: getParametersMap(),
        queryType: queryType,
      );

  String _getPath() {
    switch (version) {
      case ProductQueryVersion.V0:
        return '/api/v0/product/$barcode.json';
      case ProductQueryVersion.V2:
        return '/api/v2/product/$barcode/';
    }
  }
}
