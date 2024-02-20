import 'dart:async';

import 'package:http/http.dart';

import 'model/key_stats.dart';
import 'model/product_list.dart';
import 'model/product_stats.dart';
import 'model/product_tag.dart';
import 'utils/http_helper.dart';
import 'utils/open_food_api_configuration.dart';
import 'utils/uri_helper.dart';

/// Client calls of the Folksonomy API (Open Food Facts)
///
/// cf. https://api.folksonomy.openfoodfacts.org/docs
class FolksonomyAPIClient {
  FolksonomyAPIClient._();

  /// "hello world"
  static Future<void> hello({
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Response response = await HttpHelper().doGetRequest(
      uriHelper.getUri(
        path: '/',
      ),
      uriHelper: uriHelper,
    );
    _checkResponse(response);
  }

  /// Returns all the [ProductStats], with an optional filter.
  ///
  /// The result can be filtered with that [key], or with [key] = [value].
  static Future<List<ProductStats>> getProductStats({
    final String? key,
    final String? value,
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Map<String, String> parameters = <String, String>{};
    /* TODO
    if (owner != null) {
      parameters['owner'] = owner;
    }
     */
    if (key == null && value != null) {
      throw Exception(
          'Does a value have a meaning without its key? I don\'t think so.');
    }
    if (key != null) {
      parameters['k'] = key;
    }
    if (value != null) {
      parameters['v'] = value;
    }
    final Response response = await HttpHelper().doGetRequest(
      uriHelper.getUri(
        path: 'products/stats',
        queryParameters: parameters,
      ),
      uriHelper: uriHelper,
    );
    _checkResponse(response);
    final List<ProductStats> result = <ProductStats>[];
    if (response.body == 'null') {
      // not found
      return result;
    }
    final List<dynamic> json =
        HttpHelper().jsonDecode(response.body) as List<dynamic>;
    for (var element in json) {
      result.add(ProductStats.fromJson(element));
    }
    return result;
  }

  /// Returns all the products with that [key].
  ///
  /// The key of the returned map is the barcode, the value is the tag value.
  static Future<Map<String, String>> getProducts({
    required final String key,
    final String? value,
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Map<String, String> parameters = <String, String>{};
    /* TODO
    if (owner != null) {
      parameters['owner'] = owner;
    }
     */
    parameters['k'] = key;
    if (value != null) {
      parameters['v'] = value;
    }
    final Response response = await HttpHelper().doGetRequest(
      uriHelper.getUri(
        path: 'products',
        queryParameters: parameters,
      ),
      uriHelper: uriHelper,
    );
    _checkResponse(response);
    final Map<String, String> result = <String, String>{};
    final List<dynamic> json =
        HttpHelper().jsonDecode(response.body) as List<dynamic>;
    for (var element in json) {
      final ProductList productList = ProductList.fromJson(element);
      if (productList.key != key) {
        throw Exception('Unexpected key: ${productList.key}');
      }
      result[productList.barcode] = productList.value;
    }
    return result;
  }

  /// Returns all the [ProductTag]s for this product
  ///
  /// The key of the returned map is the tag key.
  static Future<Map<String, ProductTag>> getProductTags({
    required final String barcode,
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Map<String, String> parameters = <String, String>{};
    /* TODO
    if (owner != null) {
      parameters['owner'] = owner;
    }
     */
    final Response response = await HttpHelper().doGetRequest(
      uriHelper.getUri(
        path: 'product/$barcode',
        queryParameters: parameters,
      ),
      uriHelper: uriHelper,
    );
    _checkResponse(response);
    final Map<String, ProductTag> result = <String, ProductTag>{};
    if (response.body == 'null') {
      // not found
      return result;
    }
    final List<dynamic> json =
        HttpHelper().jsonDecode(response.body) as List<dynamic>;
    for (var element in json) {
      final ProductTag productTag = ProductTag.fromJson(element);
      result[productTag.key] = productTag;
    }
    return result;
  }

  /// Returns the [ProductTag] for this product and this tag key
  ///
  /// Returns null if not found.
  static Future<ProductTag?> getProductTag({
    required final String barcode,
    required final String key,
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Map<String, String> parameters = <String, String>{};
    /* TODO
    if (owner != null) {
      parameters['owner'] = owner;
    }
     */
    final Response response = await HttpHelper().doGetRequest(
      uriHelper.getUri(
        path: 'product/$barcode/$key',
        queryParameters: parameters,
      ),
      uriHelper: uriHelper,
    );
    // may return 404 (and "null") when not found.
    _checkResponse(
      response,
      authorizedStatus: <int>[200, 404],
    );
    if (response.body == 'null') {
      // not found
      return null;
    }
    final Map<String, dynamic> json =
        HttpHelper().jsonDecode(response.body) as Map<String, dynamic>;
    return ProductTag.fromJson(json);
  }

  /// Returns all the [ProductTag]s for this product, with their subkeys.
  ///
  /// The key of the returned map is the key.
  static Future<Map<String, ProductTag>> getProductTagWithSubKeys({
    required final String barcode,
    required final String key,
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Map<String, String> parameters = <String, String>{};
    /* TODO
    if (owner != null) {
      parameters['owner'] = owner;
    }
     */
    final Response response = await HttpHelper().doGetRequest(
      uriHelper.getUri(
        path: 'product/$barcode/$key*', // look at the star!
        queryParameters: parameters,
      ),
      uriHelper: uriHelper,
    );
    _checkResponse(response);
    final Map<String, ProductTag> result = <String, ProductTag>{};
    if (response.body == 'null') {
      // not found
      return result;
    }
    final List<dynamic> json =
        HttpHelper().jsonDecode(response.body) as List<dynamic>;
    for (var element in json) {
      final ProductTag productTag = ProductTag.fromJson(element);
      result[productTag.key] = productTag;
    }
    return result;
  }

/* TODO
Future<void> deleteProductTag({
  required final String barcode,
  required final String key,
  required final int version,
  final QueryType? queryType,
}) async {
  final Map<String, String> parameters = <String, String>{};
  /* TODO
    if (owner != null) {
      parameters['owner'] = owner;
    }
     */
  final Response response = await HttpHelper().doDeleteRequest(
    UriHelper.getFolksonomyUri(
      path: 'product/$barcode/$key',
      queryParameters: parameters,
      queryType: queryType,
    ),
    queryType: queryType,
  );
  _checkResponse(response);
}
 */

  /// Returns the versions of [ProductTag] for this [barcode] and [key].
  static Future<List<ProductTag>> getProductTagVersions({
    required final String barcode,
    required final String key,
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Map<String, String> parameters = <String, String>{};
    /* TODO
    if (owner != null) {
      parameters['owner'] = owner;
    }
     */
    final Response response = await HttpHelper().doGetRequest(
      uriHelper.getUri(
        path: 'product/$barcode/$key/versions',
        queryParameters: parameters,
      ),
      uriHelper: uriHelper,
    );
    _checkResponse(response);
    final List<ProductTag> result = <ProductTag>[];
    if (response.body == 'null') {
      // not found
      return result;
    }
    final List<dynamic> json =
        HttpHelper().jsonDecode(response.body) as List<dynamic>;
    for (var element in json) {
      result.add(ProductTag.fromJson(element));
    }
    return result;
  }

  /* TODO
  /// productTag.version must be equal to previous version + 1
  static Future<void> updateProductTag({
    required final ProductTag productTag,
    final QueryType? queryType,
  }) async {
    final Map<String, String> parameters = <String, String>{};
    /* TODO
    if (owner != null) {
      parameters['owner'] = owner;
    }
     */
    final Response response = await HttpHelper().doPutRequest(
      UriHelper.getFolksonomyUri(
        path: 'product',
        queryParameters: parameters,
        queryType: queryType,
      ),
      productTag.toJson().toString(),
      userAgent: OpenFoodAPIConfiguration.userAgent,
      queryType: queryType,
    );
    _checkResponse(response);
  }
   */

  /* TODO
  /// productTag.version must be equal to 1
  static Future<void> addProductTag({
    required final ProductTag productTag,
    final User? user,
    final QueryType? queryType,
  }) async {
    final Map<String, String> parameters = <String, String>{};
    /* TODO
    if (owner != null) {
      parameters['owner'] = owner;
    }
     */
    final Response response = await HttpHelper().doPostRequest(
      UriHelper.getFolksonomyUri(
        path: 'product',
        queryParameters: parameters,
        queryType: queryType,
      ),
      {}, // TODO later productTag.toJson(),
      user,
      queryType: queryType,
    );
    _checkResponse(response);
  }
   */

  /// Returns the list of tag keys with statistics.
  static Future<Map<String, KeyStats>> getKeys({
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Map<String, String> parameters = <String, String>{};
    /* TODO "The keys list can be restricted to private tags from some owner"
    if (owner != null) {
      parameters['owner'] = owner;
    }
     */
    final Response response = await HttpHelper().doGetRequest(
      uriHelper.getUri(
        path: 'keys',
        queryParameters: parameters,
      ),
      uriHelper: uriHelper,
    );
    _checkResponse(response);
    final Map<String, KeyStats> result = <String, KeyStats>{};
    final List<dynamic> json =
        HttpHelper().jsonDecode(response.body) as List<dynamic>;
    for (var element in json) {
      final KeyStats item = KeyStats.fromJson(element);
      result[item.key] = item;
    }
    return result;
  }

  static Future<void> ping({
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Response response = await HttpHelper().doGetRequest(
      uriHelper.getUri(
        path: 'ping',
      ),
      uriHelper: uriHelper,
    );
    _checkResponse(response);
  }

  /// Throws a detailed exception if relevant. Does nothing if [response] is OK.
  static void _checkResponse(
    final Response response, {
    final List<int> authorizedStatus = const <int>[200],
  }) {
    if (!authorizedStatus.contains(response.statusCode)) {
      // TODO have a look at ValidationError in https://api.folksonomy.openfoodfacts.org/docs
      throw Exception('Wrong status code: ${response.statusCode}');
    }
  }
}
