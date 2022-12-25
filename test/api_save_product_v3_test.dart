import 'package:openfoodfacts/model/localized_tag.dart';
import 'package:openfoodfacts/model/product_packaging.dart';
import 'package:openfoodfacts/model/product_result_field_answer.dart';
import 'package:openfoodfacts/model/product_result_v3.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/country_helper.dart';
import 'package:openfoodfacts/utils/open_food_api_configuration.dart';
import 'package:openfoodfacts/utils/query_type.dart';
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
      final List<ProductPackaging> inputPackagings = [
        ProductPackaging()
          ..shape = (LocalizedTag()..lcName = 'bouteille')
          ..material = (LocalizedTag()..lcName = 'verre')
          ..recycling = (LocalizedTag()..lcName = unknownRecycling)
          ..numberOfUnits = 12,
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
