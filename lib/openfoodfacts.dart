library openfoodfacts;

import 'dart:convert';
import 'dart:async';

import 'model/SendImage.dart';
import 'model/Product.dart';
import 'model/ProductResult.dart';
import 'model/Status.dart';
import 'model/User.dart';

import 'utils/HttpHelper.dart';
import 'utils/IngredientHelper.dart';
import 'utils/ImageHelper.dart';

export 'model/ImageList.dart';
export 'model/ProductImage.dart';
export 'model/Ingredient.dart';
export 'model/Product.dart';
export 'model/ProductResult.dart';
export 'model/SendImage.dart';
export 'model/Status.dart';
export 'model/User.dart';

/// Client calls of the Open Food Facts API
class OpenFoodAPIClient {

  static const String URI_SCHEME = "https";
  static const String URI_HOST = "world.openfoodfacts.org";

  /// Add the given product to the database.
  /// Returns a Status object as result.
  static Future<Status> saveProduct(User user, Product product) async {

    var parameterMap = new Map<String, String>();
    parameterMap.addAll(user.toData());
    parameterMap.addAll(product.toData());

    var productUri = Uri(
        scheme: URI_SCHEME,
        host: URI_HOST,
        path: '/cgi/product_jqm2.pl');

    String response = await HttpHelper().doPostRequest(productUri, parameterMap);
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

    return await HttpHelper().doMultipartRequest(imageUri, dataMap, fileMap);
  }


  /// Returns the product for the given barcode.
  /// The ProductResult does not contain a product, if the product is not available.
  /// No parsing of ingredients.
  /// No adjustment by language.
  static Future<ProductResult> getProductRaw(String barcode) async {

    if (barcode == null || barcode.isEmpty) {
      return new ProductResult();
    }

    var productUri = Uri(
      scheme: URI_SCHEME,
      host: URI_HOST,
      path: 'api/v0/product/' + barcode + '.json');

    String response = await HttpHelper().doGetRequest(productUri);
    var result = ProductResult.fromJson(json.decode(response));
    return result;
  }

  /// Returns the product for the given barcode.
  /// The ProductResult does not contain a product, if the product is not available.
  /// ingredients, images and product name will be prepared for the given language.
  static Future<ProductResult> getProduct(String barcode, String lang) async {
    ProductResult result = await getProductRaw(barcode);

    IngredientHelper.parseIngredients(result.product, lang);
    ImageHelper.removeImages(result.product, lang);

    return result;
  }

  /// login on the main page - not used
  static Future<String> _login(User user) async {
    var loginUri = new Uri(
        scheme: URI_SCHEME,
        host: URI_HOST);
    String response = await HttpHelper().doPostRequest(loginUri, user.toData());
    return response;
  }

}


