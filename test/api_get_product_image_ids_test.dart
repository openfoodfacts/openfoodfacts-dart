import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;

  test('get product images (all, main and raw)', () async {
    const String barcode = '3019081238643';
    final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
      ProductQueryConfiguration(
        barcode,
        version: ProductQueryVersion.v3,
        fields: [ProductField.IMAGES],
      ),
      user: TestConstants.PROD_USER,
    );
    expect(result.product, isNotNull);
    expect(result.product!.images, isNotNull);
    final int countAll = result.product!.images!.length;
    final int countRaw = result.product!.getRawImages()!.length;
    final int countMain = result.product!.getMainImages()!.length;
    expect(countRaw, greaterThanOrEqualTo(102)); // was 102 on 2023-11-25
    expect(countMain, greaterThanOrEqualTo(16)); // was 16 on 2023-11-25
    expect(countAll, greaterThanOrEqualTo(118)); // was 118 on 2023-11-25
    expect(countAll, countRaw + countMain);
  });
}
