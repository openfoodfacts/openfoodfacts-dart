import '../model/ProductImage.dart';

class ImageList {

  ImageList(this.list);

  List<ProductImage> list;

  /// return one product image with the given properties, null otherwise
  /// @param field - see ProductImage.FIELDS
  /// @param size - see ProductImage.SIZES
  /// @param language - see User.LANGUAGES
  ProductImage getBy(String field, String size, String language) {
    try {
      return list
          .where((e) =>
              e.field == field && e.size == size && e.language == language)
          .single;
    } catch (e) {
      return null;
    }
  }
}
