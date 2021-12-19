import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'model/KeyStats.dart';
import 'model/ProductList.dart';
import 'model/ProductStats.dart';
import 'model/ProductTag.dart';
import 'utils/HttpHelper.dart';
import 'utils/QueryType.dart';
import 'utils/UriHelper.dart';

/// Client calls of the Folksonomy API (Open Food Facts)
///
/// cf. https://api.folksonomy.openfoodfacts.org/docs
class FolksonomyAPIClient {
  FolksonomyAPIClient._();

  /// "hello world"
  static Future<void> hello({
    final QueryType? queryType,
  }) async {
    final Response response = await HttpHelper().doGetRequest(
      UriHelper.getFolksonomyUri(
        path: '/',
        queryType: queryType,
      ),
      queryType: queryType,
    );
    _checkResponse(response);
  }

  /// Returns all the [ProductStats] with that tag key, or with tag key == value
  static Future<List<ProductStats>> getProductStats({
    final String? key,
    final String? value,
    final QueryType? queryType,
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
      UriHelper.getFolksonomyUri(
        path: 'products/stats',
        queryParameters: parameters,
        queryType: queryType,
      ),
      queryType: queryType,
    );
    _checkResponse(response);
    final List<ProductStats> result = <ProductStats>[];
    final List<dynamic> json = jsonDecode(response.body) as List<dynamic>;
    for (var element in json) {
      result.add(ProductStats.fromJson(element));
    }
    return result;
  }

  /// Returns all the products with that tag key.
  ///
  /// The key of the returned map is the barcode, the value is the tag value.
  static Future<Map<String, String>> getProducts({
    required final String key,
    final String? value,
    final QueryType? queryType,
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
      UriHelper.getFolksonomyUri(
        path: 'products',
        queryParameters: parameters,
        queryType: queryType,
      ),
      queryType: queryType,
    );
    _checkResponse(response);
    final Map<String, String> result = <String, String>{};
    final List<dynamic> json = jsonDecode(response.body) as List<dynamic>;
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
  /// The key of the returned map is the key.
  static Future<Map<String, ProductTag>> getProductTags({
    required final String barcode,
    final QueryType? queryType,
  }) async {
    final Map<String, String> parameters = <String, String>{};
    /* TODO
    if (owner != null) {
      parameters['owner'] = owner;
    }
     */
    final Response response = await HttpHelper().doGetRequest(
      UriHelper.getFolksonomyUri(
        path: 'product/$barcode',
        queryParameters: parameters,
        queryType: queryType,
      ),
      queryType: queryType,
    );
    _checkResponse(response);
    final Map<String, ProductTag> result = <String, ProductTag>{};
    if (response.body == 'null') {
      // not found
      return result;
    }
    final List<dynamic> json = jsonDecode(response.body) as List<dynamic>;
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
    final QueryType? queryType,
  }) async {
    final Map<String, String> parameters = <String, String>{};
    /* TODO
    if (owner != null) {
      parameters['owner'] = owner;
    }
     */
    final Response response = await HttpHelper().doGetRequest(
      UriHelper.getFolksonomyUri(
        path: 'product/$barcode/$key',
        queryParameters: parameters,
        queryType: queryType,
      ),
      queryType: queryType,
    );
    _checkResponse(response);
    if (response.body == 'null') {
      // not found
      return null;
    }
    final Map<String, dynamic> json =
        jsonDecode(response.body) as Map<String, dynamic>;
    return ProductTag.fromJson(json);
  }

  /// Returns all the [ProductTag]s for this product, with their subkeys.
  ///
  /// The key of the returned map is the key.
  static Future<Map<String, ProductTag>> getProductTagWithSubKeys({
    required final String barcode,
    required final String key,
    final QueryType? queryType,
  }) async {
    final Map<String, String> parameters = <String, String>{};
    /* TODO
    if (owner != null) {
      parameters['owner'] = owner;
    }
     */
    final Response response = await HttpHelper().doGetRequest(
      UriHelper.getFolksonomyUri(
        path: 'product/$barcode/$key*', // look at the star!
        queryParameters: parameters,
        queryType: queryType,
      ),
      queryType: queryType,
    );
    _checkResponse(response);
    final Map<String, ProductTag> result = <String, ProductTag>{};
    if (response.body == 'null') {
      // not found
      return result;
    }
    final List<dynamic> json = jsonDecode(response.body) as List<dynamic>;
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

  /// Folksonomy: returns the versions of [ProductTag] for this product and key.
  static Future<List<ProductTag>> getProductTagVersions({
    required final String barcode,
    required final String key,
    final QueryType? queryType,
  }) async {
    final Map<String, String> parameters = <String, String>{};
    /* TODO
    if (owner != null) {
      parameters['owner'] = owner;
    }
     */
    final Response response = await HttpHelper().doGetRequest(
      UriHelper.getFolksonomyUri(
        path: 'product/$barcode/$key/versions',
        queryParameters: parameters,
        queryType: queryType,
      ),
      queryType: queryType,
    );
    _checkResponse(response);
    final List<ProductTag> result = <ProductTag>[];
    if (response.body == 'null') {
      // not found
      return result;
    }
    final List<dynamic> json = jsonDecode(response.body) as List<dynamic>;
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

  static Future<Map<String, KeyStats>> getKeys({
    final QueryType? queryType,
  }) async {
    final Map<String, String> parameters = <String, String>{};
    /* TODO
    if (owner != null) {
      parameters['owner'] = owner;
    }
     */
    final Response response = await HttpHelper().doGetRequest(
      UriHelper.getFolksonomyUri(
        path: 'keys',
        queryParameters: parameters,
        queryType: queryType,
      ),
      queryType: queryType,
    );
    _checkResponse(response);
    final Map<String, KeyStats> result = <String, KeyStats>{};
    final List<dynamic> json = jsonDecode(response.body) as List<dynamic>;
    for (var element in json) {
      final KeyStats item = KeyStats.fromJson(element);
      result[item.key] = item;
    }
    return result;
  }

  static Future<void> ping({
    final QueryType? queryType,
  }) async {
    final Response response = await HttpHelper().doGetRequest(
      UriHelper.getFolksonomyUri(
        path: 'ping',
        queryType: queryType,
      ),
      queryType: queryType,
    );
    _checkResponse(response);
  }

  static void _checkResponse(final Response response) {
    if (response.statusCode != 200) {
      print('ERROR: ${response.body}');
      throw Exception('Wrong status code: ${response.statusCode}');
    }
  }
}
