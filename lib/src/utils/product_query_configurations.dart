import 'package:http/http.dart';
import 'abstract_query_configuration.dart';
import 'http_helper.dart';
import 'uri_helper.dart';
import '../model/user.dart';

/// Api version for product queries
class ProductQueryVersion {
  const ProductQueryVersion(this.version);

  final int version;

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
  /// The barcode from the desired product
  final String barcode;

  /// The API version
  final ProductQueryVersion version;

  /// See [AbstractQueryConfiguration.languages] for
  /// parameter's description.
  ProductQueryConfiguration(
    this.barcode, {
    required this.version,
    super.language,
    super.languages,
    super.country,
    super.fields,
  });

  /// If the provided [ProductQueryVersion] matches the API V3 requirements
  bool matchesV3() => version.matchesV3();

  @override
  String getUriPath() => version.getPath(barcode);

  @override
  Future<Response> getResponse(
    final User? user,
    final UriProductHelper uriHelper,
  ) async {
    if (version == ProductQueryVersion.v3) {
      return await HttpHelper().doGetRequest(
        uriHelper.getUri(
          path: getUriPath(),
          queryParameters: getParametersMap(),
        ),
        user: user,
        uriHelper: uriHelper,
      );
    }
    return await HttpHelper().doPostRequest(
      uriHelper.getPostUri(
        path: getUriPath(),
      ),
      getParametersMap(),
      user,
      uriHelper: uriHelper,
      addCredentialsToBody: false,
    );
  }
}
