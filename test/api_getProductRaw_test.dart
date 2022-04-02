import 'package:openfoodfacts/model/NutrientLevels.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;

  group('$OpenFoodAPIClient get raw products', () {
    test('get product test 1', () async {
      const String barcode = '8008698011065';
      final ProductResult result = await OpenFoodAPIClient.getProductRaw(
        barcode,
        OpenFoodFactsLanguage.GERMAN,
      );

      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product, isNotNull);
      expect(result.product!.barcode, barcode);
      expect(result.product!.quantity, '350g');
      expect(result.product!.ingredients, isNotNull);
      expect(result.product!.selectedImages, isNotNull);
      expect(result.product!.selectedImages!.length,
          greaterThan(20)); // 2022-04-01 value was 21
      expect(result.product!.images, isNotNull);
      expect(result.product!.images!, isNotEmpty);
      expect(result.product!.labelsTags!.contains('en:gluten-free'), false);
      expect(result.product!.tracesTags, isNotNull);
      expect(result.product!.tracesTags!, contains('en:lupin'));

      expect(result.product!.nutriments, isNotNull);

      expect(result.product!.nutriments!.energy, 1099.0);
      expect(result.product!.nutriments!.sugars, 0.9);
      expect(result.product!.nutriments!.salt, 1.0);
      expect(result.product!.nutriments!.fiber, 8.8);
      expect(result.product!.nutriments!.fat, 9.2);
      expect(result.product!.nutriments!.saturatedFat, 1.1);
      expect(result.product!.nutriments!.proteins, 4.5);
      expect(result.product!.nutriments!.novaGroup, isNull);

      expect(result.product!.additives!.ids, isEmpty);

      expect(
        result.product!.nutrientLevels!.levels[NutrientLevels.NUTRIENT_SUGARS],
        Level.LOW,
      );
      expect(
        result.product!.nutrientLevels!.levels[NutrientLevels.NUTRIENT_FAT],
        Level.MODERATE,
      );
      expect(
        result.product!.nutrientLevels!
            .levels[NutrientLevels.NUTRIENT_SATURATED_FAT],
        Level.LOW,
      );
      expect(
        result.product!.nutrientLevels!.levels[NutrientLevels.NUTRIENT_SALT],
        Level.MODERATE,
      );
      expect(
        result.product!.countries,
        'Bélgica,Francia,Alemania,Países Bajos,España,Suiza',
      );
    });

    test('get product tiny twists - Rold Gold Pretzels - 16 OZ. (1 LB) 453.6g',
        () async {
      const String barcode = '0028400047685';
      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(barcode,
              language: OpenFoodFactsLanguage.ENGLISH,
              fields: [ProductField.ALL]);
      final ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
      );
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product, isNotNull);
      expect(result.product!.barcode, barcode);

      expect(result.product!.nutriments!.carbohydratesServing, isNotNull);
      expect(result.product!.nutriments!.proteinsServing, isNotNull);
      expect(result.product!.nutriments!.saltServing, isNotNull);
      expect(result.product!.nutriments!.proteinsServing, isNotNull);
      expect(result.product!.nutriments!.fatServing, isNotNull);
    });

    test('get product test 2', () async {
      const String barcode = '4388810057787';

      final ProductResult result = await OpenFoodAPIClient.getProductRaw(
        barcode,
        OpenFoodFactsLanguage.GERMAN,
      );

      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product, isNotNull);
      expect(result.product!.barcode, barcode);

      expect(result.product!.productName, 'Wasser Elitess Still, Neutral');

      expect(result.product!.nutriments, isNotNull);

      expect(result.product!.nutriments!.energy, 0.0);
      expect(result.product!.nutriments!.sugars, 0.0);
      expect(result.product!.nutriments!.salt, 0.0);
      expect(result.product!.nutriments!.fiber, isNull);
      expect(result.product!.nutriments!.fat, 0.0);
      expect(result.product!.nutriments!.saturatedFat, 0.0);
      expect(result.product!.nutriments!.proteins, 0.0);
      expect(result.product!.nutriments!.novaGroup, 1);
      expect(result.product!.nutriments!.fatServing, isNull);
    });
  });
}
