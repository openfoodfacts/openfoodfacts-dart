import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:openfoodfacts/model/EcoscoreAdjustments.dart';
import 'package:openfoodfacts/model/EcoscoreData.dart';
import 'package:openfoodfacts/model/IngredientsAnalysisTags.dart';
import 'package:openfoodfacts/model/OriginsOfIngredients.dart';
import 'package:openfoodfacts/model/Packaging.dart';
import 'package:openfoodfacts/model/Product.dart';
import 'package:openfoodfacts/model/ProductResult.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';
import 'package:openfoodfacts/utils/ProductQueryConfigurations.dart';

import 'test_constants.dart';

void main() {
  test('Generate JSON - database example', () async {
    String barcode = '0030000010204';
    ProductQueryConfiguration configurations = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.ENGLISH,
        fields: [ProductField.ALL]);
    ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
        user: TestConstants.TEST_USER);
    expect(result.status, 1);
    Product product = result.product!;
    Map<String, dynamic> productMap = product.toJson();
    String json = jsonEncode(productMap);
    assert(json is String);
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
    IngredientsAnalysisTags ingredients_analysis_tags =
        IngredientsAnalysisTags(data);
    assert(ingredients_analysis_tags.vegetarianStatus ==
        VegetarianStatus.VEGETARIAN);
    assert(ingredients_analysis_tags.veganStatus == VeganStatus.NON_VEGAN);
    assert(ingredients_analysis_tags.palmOilFreeStatus ==
        PalmOilFreeStatus.PALM_OIL_CONTENT_UNKNOWN);

    List<String> json_strings =
        IngredientsAnalysisTags.toJson(ingredients_analysis_tags);
    assert(json_strings[0] == 'en:non-vegan');
    assert(json_strings[1] == 'en:vegetarian');
    assert(json_strings[2] == 'en:palm-oil-content-unknown');
  });
}

Product _createProductWithEcoscoreData() {
  final packaging = Packaging(score: 1.2, value: 4.1);
  final originOfIngredients = OriginsOfIngredients(
      epiScore: 1.2,
      epiValue: 3.1,
      transportationScore: 1.1,
      transportationValue: 6.7);
  final adjustments = EcoscoreAdjustments(
      packaging: packaging, originsOfIngredients: originOfIngredients);
  final ecoscoreData = EcoscoreData(
      grade: 'x',
      score: 1.2,
      status: EcoscoreStatus.KNOWN,
      adjustments: adjustments);
  final product = Product(productName: 'TestProduct');
  product.ecoscoreData = ecoscoreData;
  return product;
}
