import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

void main() {
  const BARCODE_DANISH_BUTTER_COOKIES = '5701184005007';

  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;

  group('$OpenFoodAPIClient json to/from conversions', () {
    test('images', () async {
      final ProductResultV3 productResult =
          await OpenFoodAPIClient.getProductV3(
        ProductQueryConfiguration(
          BARCODE_DANISH_BUTTER_COOKIES,
          fields: [ProductField.IMAGES],
          version: ProductQueryVersion.v3,
        ),
      );
      expect(productResult.product, isNotNull);

      final List<ProductImage>? images = productResult.product!.images;
      expect(images, isNotNull);
      expect(images, isNotEmpty);

      final List<ProductImage>? imagesBackAndForth = JsonHelper.imagesFromJson(
        JsonHelper.imagesToJson(images),
      );
      expect(imagesBackAndForth, isNotNull);
      expect(imagesBackAndForth, isNotEmpty);

      expect(imagesBackAndForth!.length, images!.length);
      for (final ProductImage productImage1 in images) {
        int count = 0;
        for (final ProductImage productImage2 in imagesBackAndForth) {
          if (productImage1 == productImage2) {
            count++;
          }
        }
        expect(count, 1);
      }
    });
  });
}
