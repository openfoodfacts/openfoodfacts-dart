import 'dart:async';

import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';
import 'package:openfoodfacts/utils/ProductQueryConfigurations.dart';

/// request a product from the OpenFoodFacts database
Future<Product> getProduct() async {
  var barcode = "0048151623426";
  ProductQueryConfiguration configuration = ProductQueryConfiguration(barcode, language: OpenFoodFactsLanguage.GERMAN, fields: [ProductField.ALL]);
  ProductResult result =
      await OpenFoodAPIClient.getProduct(configuration);

  if (result.status == 1) {
    return result.product;
  } else {
    throw new Exception("product not found, please insert data for " + barcode);
  }
}

/// add a new product to the OpenFoodFacts database
void addNewProduct() async {
  // define the product to be added.
  // more attributes available ...
  Product myProduct = new Product(
    barcode: "0048151623426",
    productName: "Maryland Choc Chip",
  );

  // a registered user login for https://world.openfoodfacts.org/ is required
  User myUser = new User(userId: "max@off.com", password: "password");

  // query the OpenFoodFacts API
  Status result = await OpenFoodAPIClient.saveProduct(myUser, myProduct);

  if (result.status != 1) {
    throw new Exception("product could not be added: " + result.error);
  }
}

/// add a new image for an existing product of the OpenFoodFacts database
void addProductImage() async {
  // define the product image
  // set the uri to the local image file
  // choose the "imageField" as location / description of the image content.
  SendImage image = new SendImage(
    lang: "en",
    barcode: "0048151623426",
    imageField: ImageField.INGREDIENTS,
    imageUrl: Uri.parse("assets/ingredients_en.jpg"),
  );

  // a registered user login for https://world.openfoodfacts.org/ is required
  User myUser = new User(userId: "max@off.com", password: "password");

  // query the OpenFoodFacts API
  Status result = await OpenFoodAPIClient.addProductImage(myUser, image);

  if (result.status != "status ok") {
    throw new Exception("image could not be uploaded: " +
        result.error +
        " " +
        result.imageId.toString());
  }
}
