import 'open_food_api_configuration.dart';
import 'query_type.dart';
import 'language_helper.dart';
import '../model/product_image.dart';

/// Helper class related to product pictures
class ImageHelper {
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

  /// Returns the [image] full url for an uploaded image.
  ///
  /// E.g. "https://static.openfoodfacts.org/images/products/359/671/046/2858/1.400.jpg"
  static String getUploadedImageUrl(
    final String barcode,
    final int imageId,
    final ImageSize imageSize, {
    final QueryType? queryType,
  }) =>
      '${getProductImageRootUrl(barcode, queryType: queryType)}'
      '/'
      '${_getUploadedImageFilename(imageId, imageSize)}';

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

  /// Returns the filename of an uploaded image.
  static String _getUploadedImageFilename(
    final int imageId,
    final ImageSize imageSize,
  ) {
    switch (imageSize) {
      case ImageSize.THUMB:
      case ImageSize.DISPLAY:
        // adapted size
        return '$imageId.${imageSize.number}.jpg';
      case ImageSize.SMALL:
        // not available, we take the best other choice instead
        return '$imageId.${ImageSize.DISPLAY.number}.jpg';
      case ImageSize.ORIGINAL:
      case ImageSize.UNKNOWN:
        // full size
        return '$imageId.jpg';
    }
  }

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
