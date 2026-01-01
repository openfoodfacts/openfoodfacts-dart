import 'package:http/http.dart';

import '../model/product_type_filter.dart';
import '../model/user.dart';
import 'abstract_query_configuration.dart';
import 'http_helper.dart';
import 'uri_helper.dart';

/// Api version for product queries (minimum forced version number: 2).
class ProductQueryVersion {
  const ProductQueryVersion(final num version)
    : version = version < 2 ? 2 : version;

  final num version;

  static const ProductQueryVersion v3 = ProductQueryVersion(3);

  String getPath(final String barcode) =>
      '/api/v$version/product/${Uri.encodeComponent(barcode)}/';

  bool matchesV3() => version >= 3;
}

/// Query Configuration for single barcode
class ProductQueryConfiguration extends AbstractQueryConfiguration {
  /// The barcode from the desired product
  final String barcode;

  /// The API version
  final ProductQueryVersion version;

  /// Filter on a specific server.
  final ProductTypeFilter? productTypeFilter;

  /// See [AbstractQueryConfiguration.languages] for
  /// parameter's description.
  ProductQueryConfiguration(
    this.barcode, {
    required this.version,
    super.language,
    super.languages,
    super.country,
    super.fields,
    super.activateKnowledgePanelsSimplified,
    this.productTypeFilter,
  });

  @override
  Map<String, String> getParametersMap() {
    final Map<String, String> result = super.getParametersMap();
    if (productTypeFilter != null) {
      result['product_type'] = productTypeFilter!.offTag;
    }

    return result;
  }

  /// If the provided [ProductQueryVersion] matches the API V3 requirements
  bool matchesV3() => version.matchesV3();

  @override
  String getUriPath() => version.getPath(barcode);

  @override
  Future<Response> getResponse(
    final User? user,
    final UriProductHelper uriHelper,
  ) async {
    if (matchesV3()) {
      return HttpHelper().doGetRequest(
        uriHelper.getUri(
          path: getUriPath(),
          queryParameters: getParametersMap(),
        ),
        user: user,
        uriHelper: uriHelper,
        addCookiesToHeader: true,
      );
    }
    return await HttpHelper().doPostRequest(
      uriHelper.getPostUri(path: getUriPath()),
      getParametersMap(),
      user,
      uriHelper: uriHelper,
      addCredentialsToBody: false,
    );
  }
}
