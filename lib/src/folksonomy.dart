import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:openfoodfacts/src/model/value_count.dart';

import 'model/key_stats.dart';
import 'model/product_list.dart';
import 'model/product_stats.dart';
import 'model/product_tag.dart';
import 'prices/maybe_error.dart';
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

  /// Authentication: provide username/password and get a bearer token in return.
  ///
  /// [username]: Open Food Facts user_id (not email)
  /// [password]: user password (clear text, but HTTPS encrypted)
  /// token is returned, to be used in later requests with usual
  /// "Authorization: bearer token" headers
  static Future<MaybeError<String>> getAuthenticationToken({
    required final String username,
    required final String password,
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Uri uri = uriHelper.getUri(
      path: '/auth',
    );
    final Response response = await post(
      uri,
      body: <String, String>{
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      try {
        final dynamic decodedResponse = HttpHelper().jsonDecodeUtf8(response);
        return MaybeError<String>.value(decodedResponse['access_token']);
      } catch (e) {
        //
      }
    }
    return MaybeError<String>.responseError(response);
  }

  /// Returns all the [ProductStats], with an optional filter.
  ///
  /// The result can be filtered with that [key], or with [key] = [value].
  static Future<List<ProductStats>> getProductStats({
    final String? key,
    final String? value,
    final String? owner,
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Map<String, dynamic> parameters = _buildJson(
      owner: owner,
      key: key,
      value: value,
    );
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
    final String? owner,
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Map<String, dynamic> parameters = _buildJson(
      owner: owner,
      key: key,
      value: value,
    );
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
    final String? owner,
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Map<String, String> parameters = <String, String>{
      if (owner != null) 'owner': owner,
    };
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
    final String? owner,
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Map<String, String> parameters = <String, String>{
      if (owner != null) 'owner': owner,
    };
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
    if (response.body == 'null' || response.body == '[]') {
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
  // TODO: deprecated from 2024-09-05; remove when old enough
  @Deprecated('Not supported anymore; use getProductTags instead')
  static Future<Map<String, ProductTag>> getProductTagWithSubKeys({
    required final String barcode,
    required final String key,
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Map<String, String> parameters = <String, String>{};
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

  static Future<MaybeError<bool>> deleteProductTag({
    required final String barcode,
    required final String key,
    required final int version,
    final String? owner,
    required final String bearerToken,
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Response response = await HttpHelper().doDeleteRequest(
      uriHelper.getUri(
        path: 'product/$barcode/$key',
        queryParameters: {
          'version': '$version',
          if (owner != null) 'owner': owner,
        },
      ),
      uriHelper: uriHelper,
      bearerToken: bearerToken,
    );
    if (response.statusCode == 200) {
      return MaybeError<bool>.value(true);
    }
    return MaybeError<bool>.responseError(response);
  }

  /// Returns the versions of [ProductTag] for this [barcode] and [key].
  static Future<List<ProductTag>> getProductTagVersions({
    required final String barcode,
    required final String key,
    final String? owner,
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Map<String, String> parameters = <String, String>{
      if (owner != null) 'owner': owner,
    };
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

  static Map<String, dynamic> _buildJson({
    final String? barcode,
    final String? key,
    final String? value,
    final int? version,
    final String? owner,
  }) =>
      <String, dynamic>{
        if (barcode != null) 'product': barcode,
        if (owner != null) 'owner': owner,
        if (key != null) 'k': key,
        if (value != null) 'v': value,
        if (version != null) 'version': version,
      };

  /// productTag.version must be equal to previous version + 1
  static Future<MaybeError<bool>> updateProductTag({
    required final String barcode,
    required final String key,
    required final String value,
    required final int version,
    final String? ownerIfPrivate,
    required final String bearerToken,
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Map<String, dynamic> body = _buildJson(
      barcode: barcode,
      key: key,
      value: value,
      version: version,
    );
    final Response response = await HttpHelper().doPutRequest(
      uriHelper.getUri(
        path: 'product',
        queryParameters: {
          'version': '$version',
          if (ownerIfPrivate != null) 'owner': ownerIfPrivate,
        },
      ),
      jsonEncode(body),
      uriHelper: uriHelper,
      bearerToken: bearerToken,
    );
    if (response.statusCode == 200) {
      return MaybeError<bool>.value(true);
    }
    return MaybeError<bool>.responseError(response);
  }

  static Future<MaybeError<bool>> addProductTag({
    required final String barcode,
    required final String key,
    required final String value,
    final String? ownerIfPrivate,
    required final String bearerToken,
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Map<String, dynamic> body = _buildJson(
      barcode: barcode,
      key: key,
      value: value,
      version: null,
    );
    final Response response = await HttpHelper().doPostJsonRequest(
      uriHelper.getUri(path: '/product'),
      jsonEncode(body),
      uriHelper: uriHelper,
      bearerToken: bearerToken,
    );
    if (response.statusCode == 200) {
      return MaybeError<bool>.value(true);
    }
    return MaybeError<bool>.responseError(response);
  }

  /// Returns the list of tag keys with statistics.
  static Future<Map<String, KeyStats>> getKeys({
    final String? owner,
    final String? query,
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Map<String, String> parameters = <String, String>{
      if (owner != null) 'owner': owner,
      if (query != null) 'q': query,
    };
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

  /// Returns the list of values related to tag keys with statistics.
  static Future<Map<String, ValueCount>> getValues({
    required final String key,
    final String? owner,
    final String? query,
    final int? limit,
    final UriHelper uriHelper = uriHelperFolksonomyProd,
  }) async {
    final Map<String, String> parameters = <String, String>{
      if (owner != null) 'owner': owner,
      if (query != null) 'q': query,
      if (limit != null) 'limit': limit.toString(),
    };
    final Response response = await HttpHelper().doGetRequest(
      uriHelper.getUri(
        path: 'values/$key',
        queryParameters: parameters,
      ),
      uriHelper: uriHelper,
    );
    _checkResponse(response);
    final Map<String, ValueCount> result = <String, ValueCount>{};
    final List<dynamic> json =
        HttpHelper().jsonDecode(response.body) as List<dynamic>;
    for (var element in json) {
      final ValueCount item = ValueCount.fromJson(element);
      result[item.value] = item;
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
