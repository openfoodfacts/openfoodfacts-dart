import 'package:openfoodfacts/model/OcrIngredientsResult.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OcrField.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';
import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;

  Future<void> _test(
    final String barcode,
    final OpenFoodFactsLanguage language,
    final OcrField ocrField,
  ) async {
    final OcrIngredientsResult response =
        await OpenFoodAPIClient.extractIngredients(
      TestConstants.PROD_USER,
      barcode,
      language,
      ocrField: ocrField,
    );

    expect(response.status, 0);
    expect(response.ingredientsTextFromImage!.isNotEmpty, true);
  }

  const String _frenchBarcode = '5449000227959';
  const String _englishBarcode = '0041220576920';
  const String _germanBarcode = '5701184005007';

  group('$OpenFoodAPIClient Extract Ingredients from images', () {
    test('Extract Ingredients using Google Vision Cloud (French)', () async {
      _test(
        _frenchBarcode,
        OpenFoodFactsLanguage.FRENCH,
        OcrField.GOOGLE_CLOUD_VISION,
      );
    });

    test('Extract Ingredients using Google Vision Cloud (English)', () async {
      _test(
        _englishBarcode,
        OpenFoodFactsLanguage.ENGLISH,
        OcrField.GOOGLE_CLOUD_VISION,
      );
    });

    test('Extract Ingredients using Google Vision Cloud (German)', () async {
      _test(
        _germanBarcode,
        OpenFoodFactsLanguage.GERMAN,
        OcrField.GOOGLE_CLOUD_VISION,
      );
    });

    test('Extract Ingredients using Tesseract (French)', () async {
      _test(
        _frenchBarcode,
        OpenFoodFactsLanguage.FRENCH,
        OcrField.TESSERACT,
      );
    });

    test('Extract Ingredients using Tesseract (English)', () async {
      _test(
        _englishBarcode,
        OpenFoodFactsLanguage.ENGLISH,
        OcrField.TESSERACT,
      );
    });

    test('Extract Ingredients using Tesseract (German)', () async {
      _test(
        _germanBarcode,
        OpenFoodFactsLanguage.GERMAN,
        OcrField.TESSERACT,
      );
    });

    test('Add ingredients image to OFF server and then extract the text',
        () async {
      const String barcode = '3613042717385';
      SendImage image = SendImage(
        lang: OpenFoodFactsLanguage.FRENCH,
        barcode: barcode,
        imageField: ImageField.INGREDIENTS,
        imageUri: Uri.file('test/test_assets/ingredient_$barcode.jpg'),
      );
      await OpenFoodAPIClient.addProductImage(
        TestConstants.PROD_USER,
        image,
      );

      OcrIngredientsResult ocrResponse =
          await OpenFoodAPIClient.extractIngredients(
        TestConstants.PROD_USER,
        barcode,
        OpenFoodFactsLanguage.FRENCH,
      );

      expect(ocrResponse.status, 0);
      expect(ocrResponse.ingredientsTextFromImage!.isNotEmpty, true);

      // Save the extracted ingredients to the product on the OFF server
      Status saveStatus = await OpenFoodAPIClient.saveProduct(
        TestConstants.PROD_USER,
        Product(
            barcode: barcode,
            ingredientsText: ocrResponse.ingredientsTextFromImage),
      );
      expect(saveStatus.status, 1);
      expect(saveStatus.statusVerbose, 'fields saved');

      //Get The saved product's ingredients from the server
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
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
