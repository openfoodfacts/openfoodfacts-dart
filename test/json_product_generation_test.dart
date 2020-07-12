import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
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
    Product product = result.product;
    Map<String, dynamic> productMap = product.toJson();
    print(JsonHelper.selectedImagesToJson(product.selectedImages));
    String json = jsonEncode(productMap);
    assert(json is String);
  });
}