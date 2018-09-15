library openfoodfacts;

import 'dart:async';
import 'dart:convert';

import 'model/SendImage.dart';
import 'model/SendProduct.dart';
import 'model/ProductResult.dart';
import 'model/Status.dart';
import 'model/User.dart';

import 'utils/HttpHelper.dart';

/// Client calls of the Open Food Facts API
class OpenFoodAPIClient {

  /// Add the given product to the database.
  /// Returns a Status object as result.
  static Future<Status> saveProduct(User user, SendProduct product) async {

    var parameterMap = new Map<String, dynamic>();
    //parameterMap.addAll(user.toJson());
    parameterMap.addAll(product.toJson());

    var productUri = Uri(
        scheme: 'https',
        host: 'world.openfoodfacts.net',
        path: '/cgi/product_jqm2.pl',
        queryParameters: parameterMap);

    String response = await HttpHelper.doGetRequest(productUri);
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
        scheme: 'https',
        host: 'world.openfoodfacts.net',
        path: '/cgi/product_image_upload.pl');

    return await HttpHelper.doMultipartRequest(imageUri, dataMap, fileMap);
  }

  static Future<Status> editProduct(User user, SendProduct product) async {

  }

  /// Returns the product for the given barcode.
  /// The ProductResult does not contain a product, if the product is not available.
  static Future<ProductResult> getProduct(String barcode) async {

    var productUri = Uri(
      scheme: 'https',
      host: 'world.openfoodfacts.org',
      path: 'api/v0/product/' + barcode + '.json');

    String response = await HttpHelper.doGetRequest(productUri);
    var result = ProductResult.fromJson(json.decode(response));
    return result;
  }

}


