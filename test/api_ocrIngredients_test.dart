import 'package:flutter_test/flutter_test.dart';
import 'package:openfoodfacts/model/OcrIngredientsResult.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OcrField.dart';
import 'package:openfoodfacts/utils/OcrIngredientsField.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'test_constants.dart';

void main() {
  group('$OpenFoodAPIClient Extract Ingredients from images', () {

    test('Extract Ingredients using Default OCR', () async {
      OcrIngredientsResult response =
          await OpenFoodAPIClient.extractIngredients(
              TestConstants.PROD_USER,
              "5449000227959",
              OcrIngredientsField.INGREDIENTS_FR,
              queryType: QueryType.PROD);

      expect(response.ingredientsTextFromImage.isNotEmpty, true);

      response =
      await OpenFoodAPIClient.extractIngredients(
          TestConstants.PROD_USER,
          "0041220576920",
          OcrIngredientsField.INGREDIENTS_EN,
          queryType: QueryType.PROD);

      expect(response.ingredientsTextFromImage.isNotEmpty, true);

      response =
      await OpenFoodAPIClient.extractIngredients(
          TestConstants.PROD_USER,
          "5701184005007",
          OcrIngredientsField.INGREDIENTS_DE,
          queryType: QueryType.PROD);

      expect(response.ingredientsTextFromImage.isNotEmpty, true);
      
    });
    test('Extract Ingredients using Google Vision Cloud', () async {
      OcrIngredientsResult response =
      await OpenFoodAPIClient.extractIngredients(
          TestConstants.PROD_USER,
          "5449000227959",
          OcrIngredientsField.INGREDIENTS_FR,
          ocrField: OcrField.GOOGLE_CLOUD_VISION,
          queryType: QueryType.PROD);

      expect(response.status,0);
      expect(response.ingredientsTextFromImage.isNotEmpty, true);

      response =
      await OpenFoodAPIClient.extractIngredients(
          TestConstants.PROD_USER,
          "0041220576920",
          OcrIngredientsField.INGREDIENTS_EN,
          ocrField: OcrField.GOOGLE_CLOUD_VISION,
          queryType: QueryType.PROD);

      expect(response.status,0);
      expect(response.ingredientsTextFromImage.isNotEmpty, true);

      response =
      await OpenFoodAPIClient.extractIngredients(
          TestConstants.PROD_USER,
          "5701184005007",
          OcrIngredientsField.INGREDIENTS_DE,
          ocrField: OcrField.GOOGLE_CLOUD_VISION,
          queryType: QueryType.PROD);

      expect(response.status,0);
      expect(response.ingredientsTextFromImage.isNotEmpty, true);

    });
    test('Extract Ingredients using Tesseract', () async {
      OcrIngredientsResult response =
      await OpenFoodAPIClient.extractIngredients(
          TestConstants.PROD_USER,
          "5449000227959",
          OcrIngredientsField.INGREDIENTS_FR,
          ocrField: OcrField.TESSERACT,
          queryType: QueryType.PROD);

      expect(response.status,0);
      expect(response.ingredientsTextFromImage.isNotEmpty, true);

      response =
      await OpenFoodAPIClient.extractIngredients(
          TestConstants.PROD_USER,
          "0041220576920",
          OcrIngredientsField.INGREDIENTS_EN,
          ocrField: OcrField.TESSERACT,
          queryType: QueryType.PROD);

      expect(response.status,0);
      expect(response.ingredientsTextFromImage.isNotEmpty, true);

      response =
      await OpenFoodAPIClient.extractIngredients(
          TestConstants.PROD_USER,
          "5701184005007",
          OcrIngredientsField.INGREDIENTS_DE,
          ocrField: OcrField.TESSERACT,
          queryType: QueryType.PROD);

      expect(response.status,0);
      expect(response.ingredientsTextFromImage.isNotEmpty, true);

    });
  });
}
