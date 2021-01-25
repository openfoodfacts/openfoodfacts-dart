import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:openfoodfacts/model/EcoscoreData.dart';
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
    String json = jsonEncode(productMap);
    assert(json is String);
  });

  test('EcoscoreData JSON generation', () {
    final product = Product(productName: 'TestProduct');
    final ecoscoreData = EcoscoreData(grade: 'x');
    product.ecoscoreData = ecoscoreData;
    var productJson = product.toJson();
    assert(!(productJson['ecoscore_data'] is EcoscoreData));
    product.ecoscoreData = null;
    productJson = product.toJson();
    assert(productJson['ecoscore_data'] == null);
  });
}
