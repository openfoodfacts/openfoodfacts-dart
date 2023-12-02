import 'package:http/http.dart';

import 'prices/get_prices_result.dart';
import 'prices/get_prices_results.dart';
import 'prices/validation_errors.dart';
import 'utils/http_helper.dart';
import 'utils/open_food_api_configuration.dart';
import 'utils/uri_helper.dart';

/// Client calls of the Open Prices API.
class OpenPricesAPIClient {
  OpenPricesAPIClient._();

  /// Subdomain of the Elastic Search API.
  static const String _subdomain = 'prices';

  /// Host of the Elastic Search API.
  static String _getHost(final UriProductHelper uriHelper) =>
      uriHelper.getHost(_subdomain);

  /// cf. https://prices.openfoodfacts.net/docs#/default/get_price_api_v1_prices_get
  static Future<GetPricesResults> getPrices({
    // TODO(monsieurtanuki): add all parameters
    final int? pageSize,
    final int? pageNumber,
    final UriProductHelper uriHelper = uriHelperFoodProd,
  }) async {
    final Uri uri = uriHelper.getUri(
      path: '/api/v1/prices',
      queryParameters: <String, String>{
        if (pageNumber != null) 'page': pageNumber.toString(),
        if (pageSize != null) 'size': pageSize.toString(),
      },
      forcedHost: _getHost(uriHelper),
    );
    final Response response = await HttpHelper().doGetRequest(
      uri,
      uriHelper: uriHelper,
    );
    dynamic decodedResponse = HttpHelper().jsonDecodeUtf8(response);
    if (response.statusCode == 200) {
      return GetPricesResults.result(GetPricesResult.fromJson(decodedResponse));
    }
    return GetPricesResults.error(ValidationErrors.fromJson(decodedResponse));
  }
}
