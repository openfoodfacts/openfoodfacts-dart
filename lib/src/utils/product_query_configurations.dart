import 'package:http/http.dart';

import '../model/parameter/ingredients_unwanted_parameter.dart';
import '../model/product_type_filter.dart';
import '../model/user.dart';
import 'abstract_query_configuration.dart';
import 'http_helper.dart';
import 'uri_helper.dart';

/// Query Configuration for single barcode
class ProductQueryConfiguration extends AbstractQueryConfiguration {
  /// The barcode from the desired product
  final String barcode;

  /// Filter on a specific server.
  final ProductTypeFilter? productTypeFilter;

  /// Impacts the score if unwanted ingredients are present.
  final IngredientsUnwantedParameter? unwantedIngredients;

  /// See [AbstractQueryConfiguration.languages] for
  /// parameter's description.
  ProductQueryConfiguration(
    this.barcode, {
    required super.version,
    super.language,
    super.languages,
    super.country,
    super.fields,
    super.activateKnowledgePanelsSimplified,
    this.productTypeFilter,
    this.unwantedIngredients,
  });

  @override
  Map<String, String> getParametersMap() {
    final Map<String, String> result = super.getParametersMap();
    if (productTypeFilter != null) {
      result['product_type'] = productTypeFilter!.offTag;
    }
    if (unwantedIngredients != null) {
      result[unwantedIngredients!.getName()] = unwantedIngredients!.getValue();
    }
    return result;
  }

  /// If the provided [ProductQueryVersion] matches the API V3 requirements
  // TODO: deprecated from 2026-07-09; remove when old enough
  @Deprecated('Minimum version is now 3')
  bool matchesV3() => true;

  @override
  String getUriPath() => version.getPath(barcode);

  @override
  Future<Response> getResponse(
    final User? user,
    final UriProductHelper uriHelper,
  ) async {
    return HttpHelper().doGetRequest(
      uriHelper.getUri(path: getUriPath(), queryParameters: getParametersMap()),
      user: user,
      uriHelper: uriHelper,
      addCookiesToHeader: true,
    );
  }
}
