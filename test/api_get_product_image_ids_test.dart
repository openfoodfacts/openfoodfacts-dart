import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;

  test('get product image ids', () async {
    const String barcode = '3019081238643';
    final List<int> result = await OpenFoodAPIClient.getProductImageIds(
      barcode,
      user: TestConstants.PROD_USER,
    );
    expect(result.length, greaterThanOrEqualTo(34)); // was 34 on 2023-01-25
  });

  test('get product image ids without any image', () async {
    const String barcode = '98765432186';
    final List<int> result = await OpenFoodAPIClient.getProductImageIds(
      barcode,
      user: TestConstants.PROD_USER,
    );
    expect(result.length, greaterThanOrEqualTo(0));
  });
}
