import 'dart:async';

import 'package:openfoodfacts/model/OcrIngredientsResult.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

/// request a product from the OpenFoodFacts database
Future<Product> getProduct() async {
  var barcode = "0048151623426";

  ProductQueryConfiguration configuration = ProductQueryConfiguration(barcode,
      language: OpenFoodFactsLanguage.GERMAN, fields: [ProductField.ALL]);
  ProductResult result = await OpenFoodAPIClient.getProduct(configuration);

  if (result.status == 1) {
    return result.product;
  } else {
    throw Exception("product not found, please insert data for " + barcode);
  }
}

/// add a new product to the OpenFoodFacts database
void addNewProduct() async {
  // define the product to be added.
  // more attributes available ...
  Product myProduct = Product(
    barcode: "0048151623426",
    productName: "Maryland Choc Chip",
  );

  // a registered user login for https://world.openfoodfacts.org/ is required
  User myUser = User(userId: "max@off.com", password: "password");

  // query the OpenFoodFacts API
  Status result = await OpenFoodAPIClient.saveProduct(myUser, myProduct);

  if (result.status != 1) {
    throw Exception("product could not be added: " + result.error);
  }
}

/// add a new image for an existing product of the OpenFoodFacts database
void addProductImage() async {
  // define the product image
  // set the uri to the local image file
  // choose the "imageField" as location / description of the image content.
  SendImage image = SendImage(
    lang: OpenFoodFactsLanguage.ENGLISH,
    barcode: "0048151623426",
    imageField: ImageField.INGREDIENTS,
    imageUrl: Uri.parse("assets/ingredients_en.jpg"),
  );

  // a registered user login for https://world.openfoodfacts.org/ is required
  User myUser = User(userId: "max@off.com", password: "password");

  // query the OpenFoodFacts API
  Status result = await OpenFoodAPIClient.addProductImage(myUser, image);

  if (result.status != "status ok") {
    throw Exception("image could not be uploaded: " +
        result.error +
        " " +
        result.imageId.toString());
  }
}

/// Extract the ingredients of an existing product of the OpenFoodFacts database
/// That has already ingredient image
/// Otherwise it should be added first to the server and then this can be called
Future<String> extractIngredient() async {
  // a registered user login for https://world.openfoodfacts.org/ is required
  User myUser = User(userId: "max@off.com", password: "password");

  // query the OpenFoodFacts API
  OcrIngredientsResult response = await OpenFoodAPIClient.extractIngredients(
      myUser, "0041220576920", OpenFoodFactsLanguage.ENGLISH);

  if (response.status != 0) {
    throw Exception("Text can't be extracted.");
  }
  return response.ingredientsTextFromImage;
}

/// Extract the ingredients of an existing product of the OpenFoodFacts database
/// That does not have ingredient image
/// And then save it back to the OFF server
void saveAndExtractIngredient() async {
  // a registered user login for https://world.openfoodfacts.org/ is required
  User myUser = User(userId: "max@off.com", password: "password");

  SendImage image = SendImage(
    lang: OpenFoodFactsLanguage.FRENCH,
    barcode: "3613042717385",
    imageField: ImageField.INGREDIENTS,
    imageUrl: Uri.parse("assets/ingredient_3613042717385.jpg"),
  );

  //Add the ingredients image to the server
  Status results = await OpenFoodAPIClient.addProductImage(myUser, image);

  if (results.status == null) {
    throw Exception("Adding image failed");
  }

  OcrIngredientsResult ocrResponse = await OpenFoodAPIClient.extractIngredients(
      myUser, "3613042717385", OpenFoodFactsLanguage.FRENCH);

  if (ocrResponse.status != 0) {
    throw Exception("Text can't be extracted.");
  }

  // Save the extracted ingredients to the product on the OFF server
  results = await OpenFoodAPIClient.saveProduct(
      myUser,
      Product(
          barcode: "3613042717385",
          ingredientsText: ocrResponse.ingredientsTextFromImage));

  if (results.status != 1) {
    throw Exception("product could not be added");
  }

  //Get The saved product's ingredients from the server
  ProductQueryConfiguration configurations = ProductQueryConfiguration(
      "3613042717385",
      language: OpenFoodFactsLanguage.FRENCH,
      fields: [
        ProductField.INGREDIENTS_TEXT,
      ]);
  ProductResult productResult =
      await OpenFoodAPIClient.getProduct(configurations, user: myUser);

  if (productResult.status != 1) {
    throw Exception("product not found, please insert data for 3613042717385");
  }
}
