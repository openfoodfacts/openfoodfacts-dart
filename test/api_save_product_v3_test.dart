import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration tests around the "save packagings V3" feature.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  const UriProductHelper uriHelper = uriHelperFoodTest;

  group('$OpenFoodAPIClient save product V3', () {
    const String barcode = '12345678';
    const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH;
    const OpenFoodFactsCountry country = OpenFoodFactsCountry.FRANCE;

    test('save packagings with unknown recycling', () async {
      // Here we put an unknown recycling label, and we expect related warnings.
      const String unknownRecycling = 'recyKKlage';
      const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH;
      const int numberOfUnits = 12;
      const String quantityPerUnit = '50cl';
      const double weightMeasured = 250;
      final List<ProductPackaging> inputPackagings = [
        ProductPackaging()
          ..shape = (LocalizedTag()..lcName = 'bouteille')
          ..material = (LocalizedTag()..lcName = 'verre')
          ..recycling = (LocalizedTag()..lcName = unknownRecycling)
          ..numberOfUnits = numberOfUnits
          ..quantityPerUnit = quantityPerUnit
          ..weightMeasured = weightMeasured,
      ];
      final ProductResultV3 status =
          await OpenFoodAPIClient.temporarySaveProductV3(
        TestConstants.TEST_USER,
        barcode,
        uriHelper: uriHelper,
        country: country,
        language: language,
        packagings: inputPackagings,
      );

      expect(status.status, ProductResultV3.statusWarning);
      expect(status.errors, isEmpty);
      expect(status.result, isNull); // result is null for UPDATE queries
      expect(status.barcode, barcode);
      expect(status.product, isNotNull);

      expect(status.product!.packagings, isNotNull);
      final List<ProductPackaging> packagings = status.product!.packagings!;
      expect(packagings, hasLength(1));
      final ProductPackaging packaging = packagings.first;
      expect(packaging.shape, isNotNull);
      expect(packaging.material, isNotNull);
      expect(packaging.recycling, isNotNull);
      expect(packaging.numberOfUnits, numberOfUnits);
      expect(packaging.quantityPerUnit, quantityPerUnit);
      expect(packaging.weightMeasured, weightMeasured);

      expect(status.warnings, isNotEmpty);
      expect(status.warnings, hasLength(1));

      final ProductResultFieldAnswer answer = status.warnings!.first;
      expect(answer.impact, isNotNull);
      expect(answer.impact!.id, 'none');
      expect(answer.impact!.name, isNotNull);
      expect(answer.impact!.lcName, isNotNull);
      expect(answer.message, isNotNull);
      expect(answer.message!.id, 'unrecognized_value');
      expect(answer.message!.name, isNotNull);
      expect(answer.message!.lcName, isNotNull);
      expect(answer.field, isNotNull);
      expect(answer.field!.id, 'recycling');
      expect(answer.field!.value, '${language.offTag}:$unknownRecycling');
    });

    test('save packagings_complete', () async {
      final List<bool> values = [false, true, false];
      for (final bool value in values) {
        final ProductResultV3 writeStatus =
            await OpenFoodAPIClient.temporarySaveProductV3(
          TestConstants.TEST_USER,
          barcode,
          uriHelper: uriHelper,
          country: country,
          language: language,
          packagingsComplete: value,
        );

        expect(writeStatus.status, ProductResultV3.statusSuccess);
        expect(writeStatus.errors, isEmpty);
        expect(writeStatus.result, isNull); // result is null for UPDATE queries
        expect(writeStatus.barcode, barcode);
        expect(writeStatus.product, isNotNull);
        expect(writeStatus.product!.packagingsComplete, value);

        // checking again...
        final ProductResultV3 readStatus = await OpenFoodAPIClient.getProductV3(
          ProductQueryConfiguration(
            barcode,
            language: language,
            country: country,
            version: ProductQueryVersion.v3,
            fields: [
              ProductField.BARCODE,
              ProductField.PACKAGINGS_COMPLETE,
            ],
          ),
          user: TestConstants.TEST_USER,
          uriHelper: uriHelper,
        );

        expect(readStatus.status, ProductResultV3.statusSuccess);
        expect(readStatus.errors, isEmpty);
        expect(readStatus.result, isNotNull);
        expect(readStatus.result!.id, ProductResultV3.resultProductFound);
        expect(readStatus.barcode, barcode);
        expect(readStatus.product, isNotNull);
        expect(readStatus.product!.packagingsComplete, value);
      }
    });
  }, skip: 'Avoiding tests on TEST env');
}
