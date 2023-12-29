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
  // TODO: deprecated from 2023-11-25; remove when old enough
  @Deprecated('Use ProductImage.getUrl instead')
  static String getLocalizedProductImageUrl(
    final String barcode,
    final ProductImage image, {
    final ImageSize? imageSize,
    final UriProductHelper uriHelper = uriHelperFoodProd,
  }) =>
      image.getUrl(barcode, uriHelper: uriHelper, imageSize: imageSize);

  /// Returns the [image] full url for an uploaded ("raw") image.
  ///
  /// E.g. "https://images.openfoodfacts.org/images/products/359/671/046/2858/1.400.jpg"
  // TODO: deprecated from 2023-11-25; remove when old enough
  @Deprecated('Use ProductImage.getUrl instead')
  static String getUploadedImageUrl(
    final String barcode,
    final int imageId,
    final ImageSize imageSize, {
    final UriProductHelper uriHelper = uriHelperFoodProd,
  }) =>
      ProductImage.raw(imgid: imageId.toString(), size: imageSize).getUrl(
        barcode,
        uriHelper: uriHelper,
      );

  /// Returns the [image] filename - for a specific [imageSize] if needed.
  ///
  /// By default uses the own [image]'s size field.
  /// E.g. "front_fr.4.100.jpg"
  /// cf. https://github.com/openfoodfacts/smooth-app/issues/3065
  // TODO: deprecated from 2023-11-25; remove when old enough
  @Deprecated('Use ProductImage.getUrlFilename instead')
  static String getProductImageFilename(
    final ProductImage image, {
    final ImageSize? imageSize,
  }) =>
      image.getUrlFilename(imageSize: imageSize);

  /// Returns the filename of an uploaded image.
  ///
  /// cf. https://github.com/openfoodfacts/smooth-app/issues/3065
  // TODO: deprecated from 2023-11-25; remove when old enough
  @Deprecated('Use ProductImage.getUrlFilename instead')
  static String getUploadedImageFilename(
    final int imageId,
    final ImageSize imageSize,
  ) =>
      ProductImage.raw(
        imgid: imageId.toString(),
        size: imageSize,
      ).getUrlFilename();
}
