import 'dart:convert';

import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;

  const ProductQueryVersion version = ProductQueryVersion.testVersion;

  test('Generate JSON - database example', () async {
    String barcode = '0030000010204';
    ProductQueryConfiguration configurations = ProductQueryConfiguration(
      barcode,
      language: OpenFoodFactsLanguage.ENGLISH,
      fields: [ProductField.ALL],
      version: version,
    );
    ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
      configurations,
      user: TestConstants.TEST_USER,
    );
    expect(result.status, ProductResultV3.statusSuccess);
    Product product = result.product!;
    Map<String, dynamic> productMap = product.toJson();
    jsonEncode(productMap);
  });

  test('EcoscoreData JSON generation', () {
    final product = _createProductWithEcoscoreData();
    var productJson = product.toJson();
    final ecoscoreDataJson = productJson['ecoscore_data'];
    assert(ecoscoreDataJson is Map);
    final adjustmentsJson = ecoscoreDataJson['adjustments'];
    assert(adjustmentsJson is Map);
    final packagingJson = adjustmentsJson['packaging'];
    assert(packagingJson is Map);
    final originJson = adjustmentsJson['origins_of_ingredients'];
    assert(originJson is Map);
    product.ecoscoreData = null;
    productJson = product.toJson();
    assert(productJson['ecoscore_data'] == null);
  });

  test('IngredientsAnalysisTags', () {
    List<String> data = [
      'en:vegetarian',
      'en:non-vegan',
      'en:palm-oil-content-unknown',
    ];
    IngredientsAnalysisTags ingredientsAnalysisTags = IngredientsAnalysisTags(
      data,
    );
    expect(
      ingredientsAnalysisTags.vegetarianStatus,
      VegetarianStatus.VEGETARIAN,
    );
    expect(ingredientsAnalysisTags.veganStatus, VeganStatus.NON_VEGAN);
    expect(
      ingredientsAnalysisTags.palmOilFreeStatus,
      PalmOilFreeStatus.PALM_OIL_CONTENT_UNKNOWN,
    );

    List<String> jsonStrings = IngredientsAnalysisTags.toJson(
      ingredientsAnalysisTags,
    );
    expect(jsonStrings[0], 'en:non-vegan');
    expect(jsonStrings[1], 'en:vegetarian');
    expect(jsonStrings[2], 'en:palm-oil-content-unknown');
  });
}

Product _createProductWithEcoscoreData() {
  final packaging = Packaging(score: 1.2, value: 4.1);
  final originOfIngredients = OriginsOfIngredients(
    epiScore: 1.2,
    epiValue: 3.1,
    transportationScore: 1.1,
    transportationValue: 6.7,
  );
  final adjustments = EcoscoreAdjustments(
    packaging: packaging,
    originsOfIngredients: originOfIngredients,
  );
  final ecoscoreData = EcoscoreData(
    grade: 'x',
    score: 1.2,
    status: EcoscoreStatus.KNOWN,
    adjustments: adjustments,
  );
  final product = Product(productName: 'TestProduct');
  product.ecoscoreData = ecoscoreData;
  return product;
}
