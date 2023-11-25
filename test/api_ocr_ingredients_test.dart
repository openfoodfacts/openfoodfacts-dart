import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;

  Future<void> doTest(
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

  const String frenchBarcode = '7300400481588';
  const String englishBarcode = '0041220576920';
  const String germanBarcode = '4260107223344';

  group('$OpenFoodAPIClient Extract Ingredients from images', () {
    test(
      'Extract Ingredients using Google Vision Cloud (French)',
      () async => doTest(
        frenchBarcode,
        OpenFoodFactsLanguage.FRENCH,
        OcrField.GOOGLE_CLOUD_VISION,
      ),
    );

    test(
      'Extract Ingredients using Google Vision Cloud (English)',
      () async => doTest(
        englishBarcode,
        OpenFoodFactsLanguage.ENGLISH,
        OcrField.GOOGLE_CLOUD_VISION,
      ),
    );

    test(
      'Extract Ingredients using Google Vision Cloud (German)',
      () async => doTest(
        germanBarcode,
        OpenFoodFactsLanguage.GERMAN,
        OcrField.GOOGLE_CLOUD_VISION,
      ),
    );

    test(
      'Extract Ingredients using Tesseract (French)',
      () async => doTest(
        frenchBarcode,
        OpenFoodFactsLanguage.FRENCH,
        OcrField.TESSERACT,
      ),
      skip: 'Server error',
    );

    test(
      'Extract Ingredients using Tesseract (English)',
      () async => doTest(
        englishBarcode,
        OpenFoodFactsLanguage.ENGLISH,
        OcrField.TESSERACT,
      ),
    );

    test(
      'Extract Ingredients using Tesseract (German)',
      () async => doTest(
        germanBarcode,
        OpenFoodFactsLanguage.GERMAN,
        OcrField.TESSERACT,
      ),
      skip: 'Server error',
    );

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
        fields: [ProductField.INGREDIENTS_TEXT],
        version: ProductQueryVersion.v3,
      );
      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
        user: TestConstants.PROD_USER,
      );

      expect(ocrResponse.ingredientsTextFromImage,
          result.product!.ingredientsText);
    });
  },
      timeout: Timeout(
        // some tests can be slow here
        Duration(seconds: 90),
      ));
}
