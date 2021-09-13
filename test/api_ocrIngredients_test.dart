import 'package:openfoodfacts/model/OcrIngredientsResult.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OcrField.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';
import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;

  group('$OpenFoodAPIClient Extract Ingredients from images', () {
    test('Extract Ingredients using Default OCR', () async {
      OcrIngredientsResult response =
          await OpenFoodAPIClient.extractIngredients(
        TestConstants.PROD_USER,
        '5449000227959',
        OpenFoodFactsLanguage.FRENCH,
      );

      expect(response.ingredientsTextFromImage!.isNotEmpty, true);

      response = await OpenFoodAPIClient.extractIngredients(
        TestConstants.PROD_USER,
        '0041220576920',
        OpenFoodFactsLanguage.ENGLISH,
      );

      expect(response.ingredientsTextFromImage!.isNotEmpty, true);

      response = await OpenFoodAPIClient.extractIngredients(
        TestConstants.PROD_USER,
        '5701184005007',
        OpenFoodFactsLanguage.GERMAN,
      );

      expect(response.ingredientsTextFromImage!.isNotEmpty, true);
    });
    test('Extract Ingredients using Google Vision Cloud', () async {
      OcrIngredientsResult response =
          await OpenFoodAPIClient.extractIngredients(
        TestConstants.PROD_USER,
        '5449000227959',
        OpenFoodFactsLanguage.FRENCH,
        ocrField: OcrField.GOOGLE_CLOUD_VISION,
      );

      expect(response.status, 0);
      expect(response.ingredientsTextFromImage!.isNotEmpty, true);

      response = await OpenFoodAPIClient.extractIngredients(
        TestConstants.PROD_USER,
        '0041220576920',
        OpenFoodFactsLanguage.ENGLISH,
        ocrField: OcrField.GOOGLE_CLOUD_VISION,
      );

      expect(response.status, 0);
      expect(response.ingredientsTextFromImage!.isNotEmpty, true);

      response = await OpenFoodAPIClient.extractIngredients(
        TestConstants.PROD_USER,
        '5701184005007',
        OpenFoodFactsLanguage.GERMAN,
        ocrField: OcrField.GOOGLE_CLOUD_VISION,
      );

      expect(response.status, 0);
      expect(response.ingredientsTextFromImage!.isNotEmpty, true);
    });
    test('Extract Ingredients using Tesseract', () async {
      OcrIngredientsResult response =
          await OpenFoodAPIClient.extractIngredients(
        TestConstants.PROD_USER,
        '5449000227959',
        OpenFoodFactsLanguage.FRENCH,
        ocrField: OcrField.TESSERACT,
      );

      expect(response.status, 0);
      expect(response.ingredientsTextFromImage!.isNotEmpty, true);

      response = await OpenFoodAPIClient.extractIngredients(
        TestConstants.PROD_USER,
        '0041220576920',
        OpenFoodFactsLanguage.ENGLISH,
        ocrField: OcrField.TESSERACT,
      );

      expect(response.status, 0);
      expect(response.ingredientsTextFromImage!.isNotEmpty, true);

      response = await OpenFoodAPIClient.extractIngredients(
        TestConstants.PROD_USER,
        '5701184005007',
        OpenFoodFactsLanguage.GERMAN,
        ocrField: OcrField.TESSERACT,
      );

      expect(response.status, 0);
      expect(response.ingredientsTextFromImage!.isNotEmpty, true);
    });

    test('Add ingredients image to OFF server and then extract the text',
        () async {
      SendImage image = SendImage(
        lang: OpenFoodFactsLanguage.FRENCH,
        barcode: '3613042717385',
        imageField: ImageField.INGREDIENTS,
        imageUri: Uri.file('test/test_assets/ingredient_3613042717385.jpg'),
      );
      await OpenFoodAPIClient.addProductImage(
        TestConstants.PROD_USER,
        image,
      );

      OcrIngredientsResult ocrResponse =
          await OpenFoodAPIClient.extractIngredients(
        TestConstants.PROD_USER,
        '3613042717385',
        OpenFoodFactsLanguage.FRENCH,
      );

      expect(ocrResponse.status, 0);
      expect(ocrResponse.ingredientsTextFromImage!.isNotEmpty, true);

      // Save the extracted ingredients to the product on the OFF server
      Status saveStatus = await OpenFoodAPIClient.saveProduct(
        TestConstants.PROD_USER,
        Product(
            barcode: '3613042717385',
            ingredientsText: ocrResponse.ingredientsTextFromImage),
      );
      expect(saveStatus.status, 1);
      expect(saveStatus.statusVerbose, 'fields saved');

      //Get The saved product's ingredients from the server
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          '3613042717385',
          language: OpenFoodFactsLanguage.FRENCH,
          fields: [
            ProductField.INGREDIENTS_TEXT,
          ]);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.PROD_USER,
      );

      expect(ocrResponse.ingredientsTextFromImage,
          result.product!.ingredientsText);
    });
  });
}
