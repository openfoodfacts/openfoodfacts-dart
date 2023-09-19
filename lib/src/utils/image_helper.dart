import 'language_helper.dart';
import 'open_food_api_configuration.dart';
import 'uri_helper.dart';
import '../model/product_image.dart';

/// Helper class related to product pictures
class ImageHelper {
  /// Minimum accepted width for an uploaded image.
  static const int minimumWidth = 640;

  /// Minimum accepted height for an uploaded image.
  static const int minimumHeight = 160;

  /// Returns the [image] full url - for a specific [imageSize] if needed.
  ///
  /// Returns null is [barcode] is null.
  /// E.g. "https://static.openfoodfacts.org/images/products/359/671/046/2858/front_fr.4.100.jpg"
  static String? buildUrl(
    final String? barcode,
    final ProductImage image, {
    final ImageSize? imageSize,
    final UriProductHelper uriHelper = uriHelperFoodProd,
    final String? root,
  }) =>
      barcode == null
          ? null
          : '${getProductImageRootUrl(
              barcode,
              uriHelper: uriHelper,
              root: root,
            )}'
              '/'
              '${getProductImageFilename(
              image,
              imageSize: imageSize,
            )}';

  /// Returns the [image] full url for an uploaded image.
  ///
  /// E.g. "https://static.openfoodfacts.org/images/products/359/671/046/2858/1.400.jpg"
  static String getUploadedImageUrl(
    final String barcode,
    final int imageId,
    final ImageSize imageSize, {
    final UriProductHelper uriHelper = uriHelperFoodProd,
  }) =>
      '${getProductImageRootUrl(barcode, uriHelper: uriHelper)}'
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

  /// Returns the barcode sub-folder (without trailing '/').
  ///
  /// For instance:
  /// * `12345678` for barcode `12345678`
  /// * `123/456/789` for barcode `123456789`
  /// * `123/456/789/0` for barcode `1234567890`
  /// * `123/456/789/0123` for barcode `1234567890123`
  static String getBarcodeSubPath(final String barcode) {
    if (barcode.length < 9) {
      return barcode;
    }
    final String p1 = barcode.substring(0, 3);
    final String p2 = barcode.substring(3, 6);
    final String p3 = barcode.substring(6, 9);
    if (barcode.length == 9) {
      return '$p1/$p2/$p3';
    }
    final String p4 = barcode.substring(9);
    return '$p1/$p2/$p3/$p4';
  }

  /// Returns the web folder of the product images (without trailing '/')
  ///
  /// E.g. "https://static.openfoodfacts.org/images/products/359/671/046/2858"
  static String getProductImageRootUrl(
    final String barcode, {
    final UriProductHelper uriHelper = uriHelperFoodProd,
    String? root,
  }) {
    root ??= uriHelper.imageUrlBase;
    final String separator = root.endsWith('/') ? '' : '/';
    return '$root$separator${getBarcodeSubPath(barcode)}';
  }
}
