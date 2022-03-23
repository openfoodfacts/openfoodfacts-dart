import 'dart:math' as math;

import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:openfoodfacts/utils/UriReader.dart';
import 'package:test/test.dart';
import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;
  const User user = TestConstants.TEST_USER;

  /// Common constants for several image operations
  const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.GERMAN;
  const ImageField imageField = ImageField.FRONT;

  /// Use a random barcode so that we can create a new product
  /// and really upload images
  String barcode =
      (50000000000000 + math.Random().nextInt(100000000)).toString();

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

  /// Returns the imgid, i.e. the unique id for (uploaded image x product)
  ///
  /// That imgid has only sense for this [barcode], and references the image
  /// currently used as a base for this [imageField] and this [language].
  Future<String?> _getImgid(
    final String barcode,
    final ImageField imageField,
    final OpenFoodFactsLanguage language,
  ) async {
    final ProductQueryConfiguration configurations = ProductQueryConfiguration(
      barcode,
      fields: <ProductField>[ProductField.IMAGES],
    );
    final ProductResult result =
        await OpenFoodAPIClient.getProduct(configurations);
    expect(result.status, isNotNull);
    expect(result.product!.images, isNotEmpty);

    for (final ProductImage productImage in result.product!.images!) {
      if (productImage.field == imageField ||
          productImage.language == language) {
        return productImage.imgid;
      }
    }
    return null;
  }

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
        user,
        image,
      );

      expect(status.status, 'status ok');
    });

    test('add ingredients image test', () async {
      SendImage image = SendImage(
        lang: OpenFoodFactsLanguage.ENGLISH,
        barcode: barcode,
        imageField: ImageField.INGREDIENTS,
        imageUri: Uri.file('test/test_assets/ingredients_en.jpg'),
      );
      Status status = await OpenFoodAPIClient.addProductImage(
        user,
        image,
      );

      expect(status.status, 'status ok');
    });

    test('add ingredients image test: resend same image', () async {
      SendImage image = SendImage(
        lang: OpenFoodFactsLanguage.ENGLISH,
        barcode: barcode,
        imageField: ImageField.INGREDIENTS,
        imageUri: Uri.file('test/test_assets/ingredients_en.jpg'),
      );
      Status status = await OpenFoodAPIClient.addProductImage(
        user,
        image,
      );

      expect(status.status, 'status not ok');
      expect(status.error, 'This picture has already been sent.');
    });

    test('read image', () async {
      //Get product without setting ProductField
      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(barcode);
      final ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: user,
      );
      expect(result.status, isNotNull);
      expect(result.product!.images, isNotEmpty);

      // Note: product!.images contains only selected images with a ImageField
      // the openfoodfacts-dart SDK currently does not support accessing
      // the list of uploaded images with the uploader user id and uploaded_t
      // timestamp.
    });
  });

  group('$OpenFoodAPIClient modify product image', () {
    test('image angle', () async {
      const Set<ImageAngle> tiltedAngles = <ImageAngle>{
        ImageAngle.NINE_O_CLOCK,
        ImageAngle.THREE_O_CLOCK,
      };

      final String? imgid = await _getImgid(barcode, imageField, language);
      expect(imgid, isNotNull);

      final String productImageRootUrl =
          ImageHelper.getProductImageRootUrl(barcode);
      final String uploadedImageUrl = '$productImageRootUrl/$imgid.jpg';
      final List<int> uploadedSize = await _getJpegUrlSize(uploadedImageUrl);
      final int uploadedWidth = uploadedSize[0];
      final int uploadedHeight = uploadedSize[1];

      for (final ImageAngle angle in ImageAngle.values) {
        final String? newUrl = await OpenFoodAPIClient.setProductImageAngle(
          barcode: barcode,
          user: user,
          imageField: imageField,
          language: language,
          imgid: imgid!,
          angle: angle,
        );
        expect(newUrl, isNotNull);

        final List<int> newSize = await _getJpegUrlSize(newUrl!);
        final int newWidth = newSize[0];
        final int newHeight = newSize[1];

        final bool tilted = tiltedAngles.contains(angle);
        final int fullExpectedWidth = tilted ? uploadedHeight : uploadedWidth;
        final int fullExpectedHeight = tilted ? uploadedWidth : uploadedHeight;

        // checking the aspect ratio, using multiplication instead of division
        final int check1 = newWidth * fullExpectedHeight;
        final int check2 = newHeight * fullExpectedWidth;
        expect(check1, check2);
      }
    },
        timeout: Timeout(
          // this guy is rather slow
          Duration(seconds: 90),
        ));

    test('image crop', () async {
      const int width = 50;
      const int height = 300;
      const int x1 = 10;
      const int y1 = 20;

      final String? imgid = await _getImgid(barcode, imageField, language);
      expect(imgid, isNotNull);

      for (final ImageAngle angle in ImageAngle.values) {
        final String? newUrl = await OpenFoodAPIClient.setProductImageCrop(
          barcode: barcode,
          user: user,
          imageField: imageField,
          language: language,
          imgid: imgid!,
          angle: angle,
          x1: x1,
          y1: y1,
          x2: x1 + width,
          y2: y1 + height,
        );
        expect(newUrl, isNotNull);

        final List<int> newSize = await _getJpegUrlSize(newUrl!);
        final int newWidth = newSize[0];
        final int newHeight = newSize[1];
        expect(newWidth, width);
        expect(newHeight, height);
      }
    },
        timeout: Timeout(
          // this guy is rather slow
          Duration(seconds: 90),
        ));

    test('image unselect', () async {
      const ImageField unselectedImageField = ImageField.INGREDIENTS;
      await OpenFoodAPIClient.unselectProductImage(
        barcode: barcode,
        user: user,
        imageField: unselectedImageField,
        language: language,
      );

      final ProductResult productResult = await OpenFoodAPIClient.getProduct(
        ProductQueryConfiguration(
          barcode,
          fields: <ProductField>[ProductField.SELECTED_IMAGE],
        ),
      );
      expect(productResult.product, isNotNull);
      expect(productResult.product!.selectedImages, isNotNull);
      for (final ProductImage productImage
          in productResult.product!.selectedImages!) {
        if (productImage.language == language) {
          expect(productImage.field, isNot(unselectedImageField));
        }
      }
    },
        timeout: Timeout(
          // this guy is rather slow
          Duration(seconds: 90),
        ));
  });
}
