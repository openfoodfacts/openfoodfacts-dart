import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  test('get product image ids', () async {
    const String barcode = '3019081238643';
    final List<int> result = await OpenFoodAPIClient.getProductImageIds(
      barcode,
      user: TestConstants.PROD_USER,
      queryType: QueryType.PROD,
    );
    expect(result.length, greaterThanOrEqualTo(34)); // was 34 on 2023-01-25
  });
}
