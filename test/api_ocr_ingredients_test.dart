import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  const user = TestConstants.TEST_USER;
  const uriHelper = uriHelperFoodTest;

  Future<void> doTest(
    final String barcode,
    final OpenFoodFactsLanguage language,
    final OcrField ocrField,
  ) async {
    final OcrIngredientsResult response =
        await OpenFoodAPIClient.extractIngredients(
          user,
          barcode,
          language,
          ocrField: ocrField,
          uriHelper: uriHelper,
        );

    expect(response.status, 0);
    expect(response.ingredientsTextFromImage!.isNotEmpty, true);
  }

  const String frenchBarcode = '3155251205319';
  const String englishBarcode = '0041220576920';
  const String germanBarcode = '4260107223344';

  group(
    '$OpenFoodAPIClient Extract Ingredients from images',
    () {
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
    },
    timeout: Timeout(
      // some tests can be slow here
      Duration(seconds: 90),
    ),
  );
}
