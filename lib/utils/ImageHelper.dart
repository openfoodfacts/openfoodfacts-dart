import 'package:image/image.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import '../model/ProductImage.dart';
import 'LanguageHelper.dart';

/// Helper class related to product pictures
class ImageHelper {
  // TODO: deprecated from 2022-08-18; remove when old enough
  @Deprecated('Use 2048 instead')
  static const int MAX_IMAGE_SIZE = 2048;

  /// Returns a copy of the [image] with its bigger size GTE [maxsize]
  // TODO: deprecated from 2022-08-18; remove when old enough, and pubspec.yaml's dependency on "image" too
  @Deprecated('Use copyResize from package image instead')
  static Image resize(Image image, {int maxSize = MAX_IMAGE_SIZE}) {
    // check if the image is already small enough
    if (image.width <= maxSize || image.height <= maxSize) {
      return image;
    }

    // resize the image
    if (image.width > image.height) {
      return copyResize(image, width: maxSize);
    } else {
      return copyResize(image, height: maxSize);
    }
  }

  /// Returns the [image] full url - for a specific [imageSize] if needed.
  ///
  /// Returns null is [barcode] is null.
  /// E.g. "https://static.openfoodfacts.org/images/products/359/671/046/2858/front_fr.4.100.jpg"
  static String? buildUrl(
    final String? barcode,
    final ProductImage image, {
    final ImageSize? imageSize,
    final QueryType? queryType,
  }) =>
      barcode == null
          ? null
          : '${getProductImageRootUrl(barcode, queryType: queryType)}'
              '/'
              '${getProductImageFilename(image, imageSize: imageSize)}';

  /// Returns the [image] filename - for a specific [imageSize] if needed.
  ///
  /// By default uses the own [image]'s size field.
  /// E.g. "front_fr.4.100.jpg"
  static String getProductImageFilename(
    final ProductImage image, {
    final ImageSize? imageSize,
  }) =>
      '${image.field.offTag}_${image.language.code}'
      '.${image.rev}'
      '.${((imageSize ?? image.size) ?? ImageSize.UNKNOWN).number}'
      '.jpg';

  /// Returns the web folder of the product images (without trailing '/')
  ///
  /// E.g. "https://static.openfoodfacts.org/images/products/359/671/046/2858"
  static String getProductImageRootUrl(
    final String barcode, {
    final QueryType? queryType,
  }) {
    final String barcodePath;
    if (barcode.length >= 9) {
      var p1 = barcode.substring(0, 3);
      var p2 = barcode.substring(3, 6);
      var p3 = barcode.substring(6, 9);
      if (barcode.length == 9) {
        barcodePath = '$p1/$p2/$p3';
      } else {
        var p4 = barcode.substring(9);
        barcodePath = '$p1/$p2/$p3/$p4';
      }
    } else {
      barcodePath = barcode;
    }

    final String root =
        OpenFoodAPIConfiguration.getQueryType(queryType) == QueryType.PROD
            ? OpenFoodAPIConfiguration.imageProdUrlBase
            : OpenFoodAPIConfiguration.imageTestUrlBase;
    final String separator = root.endsWith('/') ? '' : '/';
    return '$root$separator$barcodePath';
  }
}
