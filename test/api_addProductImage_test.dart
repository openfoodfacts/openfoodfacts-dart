import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:openfoodfacts/utils/UriReader.dart';
import 'package:test/test.dart';
import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;

  /// Common constants for several image operations
  const String barcode = '4250752200784';
  const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.GERMAN;
  const ImageField imageField = ImageField.FRONT;

  /// Returns the width and height (pixels) and size (bytes) of JPEG data
  ///
  /// Returns an empty List if an error occurred.
  /// * index 0: image width in pixels
  /// * index 1: image height in pixels
  /// * index 2: file size in bytes
  /// Inspiration found in https://github.com/CaiJingLong/dart_image_size_getter
  List<int> _getJpegSize(final List<int> data) {
    int start = 2;
    while (true) {
      if (data[start] != 0xFF) {
        // not supposed to happen
        break;
      }
      final int type = data[start + 1];
      if (type == 0xC0 || type == 0xC2) {
        final int width = 256 * data[start + 7] + data[start + 8];
        final int height = 256 * data[start + 5] + data[start + 6];
        return <int>[width, height, data.length];
      } else {
        final int blockLength = 2 + data[start + 2] * 256 + data[start + 3];
        start += blockLength;
      }
    }
    // not supposed to happen
    return <int>[];
  }

  /// Returns the width and height (pixels) and size (bytes) of a JPEG URL file
  Future<List<int>> _getJpegUrlSize(final String url) async => _getJpegSize(
        await UriReader.instance!.readAsBytes(Uri.parse(url)),
      );

  group('$OpenFoodAPIClient add product images', () {
    // TODO(monsieurtanuki): test with big pic may crash (e.g. 4000x3000, 2.5Mb)
    test('add front image test', () async {
      final SendImage image = SendImage(
        lang: language,
        barcode: barcode,
        imageField: imageField,
        imageUri: Uri.file('test/test_assets/front_de.jpg'),
      );
      final Status status = await OpenFoodAPIClient.addProductImage(
        TestConstants.TEST_USER,
        image,
      );

      expect(status.status, 'status not ok');
      expect(status.error, 'Dieses Foto wurde schon hochgeladen.');
    });

    test('add ingredients image test', () async {
      SendImage image = SendImage(
        lang: OpenFoodFactsLanguage.ENGLISH,
        barcode: '0048151623426',
        imageField: ImageField.INGREDIENTS,
        imageUri: Uri.file('test/test_assets/ingredients_en.jpg'),
      );
      Status status = await OpenFoodAPIClient.addProductImage(
        TestConstants.TEST_USER,
        image,
      );

      expect(status.status, 'status not ok');
      expect(status.error, 'This picture has already been sent.');
    });

    test('read image', () async {
      //Get product without setting ProductField
      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration('7622210449283');
      final ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );
      expect(result.status, isNotNull);
      expect(result.product!.images, isNotEmpty);
    });
  });

  group('$OpenFoodAPIClient modify product image', () {
    String _getNewUrl(
      final String originUrl,
      final String newFilename,
    ) =>
        originUrl.substring(0, originUrl.lastIndexOf('/')) + '/' + newFilename;

    test('image angle', () async {
      const Set<ImageAngle> tiltedAngles = <ImageAngle>{
        ImageAngle.NINE_O_CLOCK,
        ImageAngle.THREE_O_CLOCK,
      };
      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(barcode);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );
      expect(result.status, isNotNull);
      expect(result.product!.images, isNotEmpty);

      for (final ProductImage productImage in result.product!.images!) {
        // restrict to the only case we care about
        if (productImage.field != imageField ||
            productImage.language != language ||
            productImage.size != ImageSize.ORIGINAL) {
          continue;
        }
        final String originUrl = productImage.url!;
        final ImageAngle originAngle = productImage.angle ?? ImageAngle.NOON;
        final List<int> originSize = await _getJpegUrlSize(originUrl);
        final int originWidth = originSize[0];
        final int originHeight = originSize[1];
        for (final ImageAngle angle in ImageAngle.values) {
          final String? result = await OpenFoodAPIClient.setProductImageAngle(
            barcode: barcode,
            imageField: imageField,
            language: language,
            imgid: productImage.imgid!,
            angle: angle,
          );
          expect(result, isNotNull);
          final String newUrl = _getNewUrl(originUrl, result!);
          final List<int> newSize = await _getJpegUrlSize(newUrl);
          final int newWidth = newSize[0];
          final int newHeight = newSize[1];
          late bool differentTilt;
          if (tiltedAngles.contains(angle)) {
            differentTilt = !tiltedAngles.contains(originAngle);
          } else {
            differentTilt = tiltedAngles.contains(originAngle);
          }
          late int check1;
          late int check2;
          if (differentTilt) {
            check1 = newWidth * originWidth;
            check2 = newHeight * originHeight;
          } else {
            check1 = newWidth * originHeight;
            check2 = newHeight * originWidth;
          }
          expect(check1, check2);
        }
      }
    },
        timeout: Timeout(
          // this guy is rather slow
          Duration(seconds: 90),
        ));
  });
}
