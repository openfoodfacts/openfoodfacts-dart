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
  /// E.g. "https://images.openfoodfacts.org/images/products/359/671/046/2858/front_fr.4.100.jpg"
  static String getLocalizedProductImageUrl(
    final String barcode,
    final ProductImage image, {
    final ImageSize? imageSize,
    final UriProductHelper uriHelper = uriHelperFoodProd,
  }) =>
      '${uriHelper.getProductImageRootUrl(barcode)}'
      '/'
      '${getProductImageFilename(
        image,
        imageSize: imageSize,
      )}';

  /// Returns the [image] full url for an uploaded ("raw") image.
  ///
  /// E.g. "https://images.openfoodfacts.org/images/products/359/671/046/2858/1.400.jpg"
  static String getUploadedImageUrl(
    final String barcode,
    final int imageId,
    final ImageSize imageSize, {
    final UriProductHelper uriHelper = uriHelperFoodProd,
  }) =>
      '${uriHelper.getProductImageRootUrl(barcode)}'
      '/'
      '${getUploadedImageFilename(imageId, imageSize)}';

  /// Returns the [image] filename - for a specific [imageSize] if needed.
  ///
  /// By default uses the own [image]'s size field.
  /// E.g. "front_fr.4.100.jpg"
  /// cf. https://github.com/openfoodfacts/smooth-app/issues/3065
  static String getProductImageFilename(
    final ProductImage image, {
    final ImageSize? imageSize,
  }) =>
      '${image.field.offTag}_${image.language.code}'
      '.${image.rev}'
      '.${((imageSize ?? image.size) ?? ImageSize.UNKNOWN).number}'
      '.jpg';

  /// Returns the filename of an uploaded image.
  ///
  /// cf. https://github.com/openfoodfacts/smooth-app/issues/3065
  static String getUploadedImageFilename(
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
}
