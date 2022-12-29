import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration tests around the "save packagings V3" feature.
void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;

  group('$OpenFoodAPIClient save product V3', () {
    const String barcode = '12345678';

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
        queryType: QueryType.TEST,
        country: OpenFoodFactsCountry.FRANCE,
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
  },
      timeout: Timeout(
        // some tests can be slow here
        Duration(seconds: 90),
      ));
}
