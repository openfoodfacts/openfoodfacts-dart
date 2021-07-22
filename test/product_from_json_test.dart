import 'dart:convert';

import 'package:openfoodfacts/model/Product.dart';
import 'package:openfoodfacts/model/ProductResult.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';
import 'package:openfoodfacts/utils/ProductQueryConfigurations.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  // Verify that we can save the product as a JSON string and then load it back
  test('Load product from JSON', () async {
    String barcode = '0030000010204';
    ProductQueryConfiguration configurations =
        ProductQueryConfiguration(barcode, languages: [
      OpenFoodFactsLanguage.ENGLISH,
      OpenFoodFactsLanguage.FRENCH
    ], fields: [
      ProductField.ALL,
    ]);
    ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
        user: TestConstants.TEST_USER);
    expect(result.status, 1);
    Product product = result.product!;
    Map<String, dynamic> productMap = product.toJson();
    String encodedJson = jsonEncode(productMap);
    assert(encodedJson is String);
    print("encodedJson: " + encodedJson);
    final Map<String, dynamic> decodedJson =
        json.decode(encodedJson) as Map<String, dynamic>;
    Product product2 = Product.fromJson(decodedJson);
  });
}
