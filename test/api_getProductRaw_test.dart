import 'package:openfoodfacts/model/NutrientLevels.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;

  group('$OpenFoodAPIClient get raw products', () {
    test('get product test 1', () async {
      String barcode = '8008698011065';
      ProductResult result = await OpenFoodAPIClient.getProductRaw(
        barcode,
        OpenFoodFactsLanguage.GERMAN,
        user: TestConstants.TEST_USER,
      );

      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product!.barcode, barcode);
      expect(result.product!.quantity, '350g');
      assert(result.product!.ingredients == null);
      expect(result.product!.selectedImages != null, true);
      expect(result.product!.selectedImages!.length, 24);
      assert(result.product!.selectedImages!.isNotEmpty);
      expect(result.product!.images != null, true);
      assert(result.product!.images!.isNotEmpty);
      expect(result.product!.labelsTags!.contains('en:gluten-free'), false);
      expect(result.product!.tracesTags != null, true);
      expect(result.product!.tracesTags!.contains('en:lupin'), true);

      expect(result.product!.nutriments != null, true);

      expect(result.product!.nutriments!.energy, 1099.0);
      expect(result.product!.nutriments!.sugars, 0.9);
      expect(result.product!.nutriments!.salt, 1.0);
      expect(result.product!.nutriments!.fiber, 8.8);
      expect(result.product!.nutriments!.fat, 9.2);
      expect(result.product!.nutriments!.saturatedFat, 1.1);
      expect(result.product!.nutriments!.proteins, 4.5);
      expect(result.product!.nutriments!.novaGroup, null);

      expect(result.product!.additives!.ids.isEmpty, true);

      expect(
          result
              .product!.nutrientLevels!.levels[NutrientLevels.NUTRIENT_SUGARS],
          Level.LOW);
      expect(
          result.product!.nutrientLevels!.levels[NutrientLevels.NUTRIENT_FAT],
          Level.MODERATE);
      expect(
          result.product!.nutrientLevels!
              .levels[NutrientLevels.NUTRIENT_SATURATED_FAT],
          Level.LOW);
      expect(
          result.product!.nutrientLevels!.levels[NutrientLevels.NUTRIENT_SALT],
          Level.MODERATE);
      expect(result.product!.countries,
          'Bélgica,Francia,Alemania,Países Bajos,España,Suiza');
    });

    test('get product tiny twists - Rold Gold Pretzels - 16 OZ. (1 LB) 453.6g',
        () async {
      String barcode = '0028400047685';
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.ENGLISH,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product!.barcode, barcode);

      expect(result.product!.nutriments!.carbohydratesServing != null, true);
      expect(result.product!.nutriments!.proteinsServing != null, true);
      expect(result.product!.nutriments!.saltServing != null, true);
      expect(result.product!.nutriments!.proteinsServing != null, true);
      expect(result.product!.nutriments!.fatServing != null, true);
    });

    test('get product test 2', () async {
      String barcode = '4388810057787';

      ProductResult result = await OpenFoodAPIClient.getProductRaw(
        barcode,
        OpenFoodFactsLanguage.GERMAN,
        user: TestConstants.TEST_USER,
      );

      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product!.barcode, barcode);

      expect(result.product!.productName, 'Elitess Still, Neutral');

      expect(result.product!.nutriments != null, true);

      expect(result.product!.nutriments!.energy, 0.0);
      expect(result.product!.nutriments!.sugars, 0.0);
      expect(result.product!.nutriments!.salt, 0.0);
      expect(result.product!.nutriments!.fiber, null);
      expect(result.product!.nutriments!.fat, 0.0);
      expect(result.product!.nutriments!.saturatedFat, 0.0);
      expect(result.product!.nutriments!.proteins, 0.0);
      expect(result.product!.nutriments!.novaGroup, 1);
      expect(result.product!.nutriments!.fatServing == null, true);
    });
  });
}
