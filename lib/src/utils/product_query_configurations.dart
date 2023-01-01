import 'package:http/http.dart';
import 'abstract_query_configuration.dart';
import 'country_helper.dart';
import 'http_helper.dart';
import 'language_helper.dart';
import 'product_fields.dart';
import 'query_type.dart';
import 'uri_helper.dart';
import '../model/user.dart';

/// Query version for single barcode
class ProductQueryVersion {
  const ProductQueryVersion(this.version);

  final int version;

  // TODO: deprecated from 2022-12-29; remove when old enough
  @Deprecated('Use v3 instead')
  static const ProductQueryVersion v0 = ProductQueryVersion(0);

  // TODO: deprecated from 2022-12-29; remove when old enough
  @Deprecated('Use v3 instead')
  static const ProductQueryVersion v2 = ProductQueryVersion(2);

  static const ProductQueryVersion v3 = ProductQueryVersion(3);

  String getPath(final String barcode) {
    if (version == 0) {
      return '/api/v0/product/$barcode.json';
    }
    return '/api/v$version/product/$barcode/';
  }

  bool matchesV3() => version >= 3;
}

/// Query Configuration for single barcode
class ProductQueryConfiguration extends AbstractQueryConfiguration {
  final String barcode;
  final ProductQueryVersion version;

  /// See [AbstractQueryConfiguration.languages] for
  /// parameter's description.
  ProductQueryConfiguration(
    this.barcode, {
    required this.version,
    final OpenFoodFactsLanguage? language,
    final List<OpenFoodFactsLanguage> languages = const [],
    final OpenFoodFactsCountry? country,
    final List<ProductField>? fields,
  }) : super(
          language: language,
          languages: languages,
          country: country,
          fields: fields,
        );

  bool matchesV3() => version.matchesV3();

  @override
  String getUriPath() => version.getPath(barcode);

  @override
  Future<Response> getResponse(
    final User? user,
    final QueryType? queryType,
  ) async {
    if (version == ProductQueryVersion.v3) {
      return await HttpHelper().doGetRequest(
        UriHelper.getUri(
          path: getUriPath(),
          queryType: queryType,
          queryParameters: getParametersMap(),
        ),
        user: user,
        queryType: queryType,
      );
    }
    return await HttpHelper().doPostRequest(
      UriHelper.getPostUri(
        path: getUriPath(),
        queryType: queryType,
      ),
      getParametersMap(),
      user,
      queryType: queryType,
      addCredentialsToBody: false,
    );
  }
}
