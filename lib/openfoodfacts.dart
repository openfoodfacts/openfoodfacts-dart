library openfoodfacts;

import 'dart:convert';
import 'dart:async';

import 'package:openfoodfacts/model/parameter/TagFilter.dart';

import 'interface/Parameter.dart';
import 'model/SendImage.dart';
import 'model/Product.dart';
import 'model/ProductResult.dart';
import 'model/SearchResult.dart';
import 'model/Status.dart';
import 'model/User.dart';

import 'utils/HttpHelper.dart';
import 'utils/ProductHelper.dart';

export 'interface/Parameter.dart';
export 'model/ImageList.dart';
export 'model/ProductImage.dart';
export 'model/Ingredient.dart';
export 'model/Product.dart';
export 'model/ProductResult.dart';
export 'model/SearchResult.dart';
export 'model/SendImage.dart';
export 'model/Status.dart';
export 'model/User.dart';
export 'model/parameter/OutputFormat.dart';
export 'model/parameter/Page.dart';
export 'model/parameter/PageSize.dart';
export 'model/parameter/SearchSimple.dart';
export 'model/parameter/SortBy.dart';
export 'utils/HttpHelper.dart';

/// Client calls of the Open Food Facts API
class OpenFoodAPIClient {
  static const String URI_SCHEME = "https";
  static const String URI_HOST = "world.openfoodfacts.org";
  static const String URI_HOST_DE = "de.openfoodfacts.org";
  static const String URI_HOST_EN = "world.openfoodfacts.org";
  static const String URI_HOST_FR = "fr.openfoodfacts.org";
  static const String URI_HOST_ES = "es.openfoodfacts.org";

  /// Add the given product to the database.
  /// Returns a Status object as result.
  static Future<Status> saveProduct(User user, Product product) async {
    var parameterMap = new Map<String, String>();
    parameterMap.addAll(user.toData());
    parameterMap.addAll(product.toData());

    var productUri =
        Uri(scheme: URI_SCHEME, host: URI_HOST, path: '/cgi/product_jqm2.pl');

    String response =
        await HttpHelper().doPostRequest(productUri, parameterMap, user);
    print(response);
    var status = Status.fromJson(json.decode(response));
    return status;
  }

  /// Send one image to the server.
  /// The image will be added to the product specified in the SendImage
  /// Returns a Status object as result.
  static Future<Status> addProductImage(User user, SendImage image) async {
    var dataMap = new Map<String, String>();
    var fileMap = new Map<String, Uri>();

    dataMap.addAll(user.toData());
    dataMap.addAll(image.toData());
    fileMap.putIfAbsent(image.getImageDataKey(), () => image.imageUrl);

    var imageUri = Uri(
        scheme: URI_SCHEME,
        host: URI_HOST,
        path: '/cgi/product_image_upload.pl');

    return await HttpHelper().doMultipartRequest(imageUri, dataMap, fileMap, user);
  }

  /// Returns the product for the given barcode.
  /// The ProductResult does not contain a product, if the product is not available.
  /// No parsing of ingredients.
  /// No adjustment by language.
  static Future<ProductResult> getProductRaw(
      String barcode, String lang, {User user}) async {
    if (barcode == null || barcode.isEmpty) {
      return new ProductResult();
    }

    var productUri = Uri(
        scheme: URI_SCHEME,
        host: _getHostByLanguage(lang),
        path: 'api/v0/product/' + barcode + '.json');

    String response = await HttpHelper().doGetRequest(productUri, user: user);
    var result = ProductResult.fromJson(json.decode(response));
    return result;
  }

  /// Returns the product for the given barcode.
  /// The ProductResult does not contain a product, if the product is not available.
  /// ingredients, images and product name will be prepared for the given language.
  static Future<ProductResult> getProduct(
      String barcode, String lang, {User user}) async {
    ProductResult result = await getProductRaw(barcode, lang, user: user);

    if (result.product != null) {
      ProductHelper.prepareProductName(result.product, lang);
      ProductHelper.parseIngredients(result.product, lang);
      ProductHelper.removeImages(result.product, lang);
    }

    return result;
  }

  /// Search the OpenFoodFacts product database with the given parameters.
  /// Returns the list of products as SearchResult.
  /// Query the language specific host from OpenFoodFacts.
  static Future<SearchResult> searchProducts(
      User user,
      List<Parameter> parameterList,
      {String lang = User.LANGUAGE_UNDEFINED}) async {

    var parameterMap = new Map<String, String>();
    /*parameterList.forEach(
        (p) => parameterMap.putIfAbsent(p.getName(), () => p.getValue()));*/
    int filterTagCount = 0;
    for (Parameter p in parameterList) {
      if (p is TagFilter) {
        TagFilter tf = p;
        parameterMap.putIfAbsent(
            "tagtype_$filterTagCount", () => tf.getTagType());
        parameterMap.putIfAbsent(
            "tag_contains_$filterTagCount", () => tf.getContains());
        parameterMap.putIfAbsent("tag_$filterTagCount", () => tf.getTagName());
        filterTagCount++;
      } else {
        parameterMap.putIfAbsent(p.getName(), () => p.getValue());
      }
    }
    parameterMap.putIfAbsent('search_terms', () => "");

    var searchUri = Uri(
        scheme: URI_SCHEME,
        host: _getHostByLanguage(lang),
        path: '/cgi/search.pl',
        queryParameters: parameterMap);

    print("URI: " + searchUri.toString());

    String response = await HttpHelper().doGetRequest(searchUri, user:user);
    var result = SearchResult.fromJson(json.decode(response));

    for (Product product in result.products) {
      ProductHelper.prepareProductName(product, lang);
      ProductHelper.parseIngredients(product, lang);
      ProductHelper.removeImages(product, lang);
    }

    return result;
  }

  /// login on the main page - not used
  static Future<String> _login(User user) async {
    var loginUri = new Uri(scheme: URI_SCHEME, host: URI_HOST);
    String response = await HttpHelper().doPostRequest(
        loginUri, user.toData(), user);
    return response;
  }

  static String _getHostByLanguage(String lang) {
    switch (lang) {
      case User.LANGUAGE_DE:
        return URI_HOST_DE;
      case User.LANGUAGE_EN:
        return URI_HOST_EN;
      case User.LANGUAGE_FR:
        return URI_HOST_FR;
      case User.LANGUAGE_ES:
        return URI_HOST_ES;
      default:
        return URI_HOST;
    }
  }
}
