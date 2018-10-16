/// The url to a specific product image.
/// Categorized by content type, size and language
class ProductImage {

  static const String FIELD_FRONT = "front";
  static const String FIELD_INGREDIENTS = "ingredients";
  static const String FIELD_NUTRITION = "nutrition";
  static const String FIELD_OTHER = "other";

  static const String SIZE_SMALL = "small";
  static const String SIZE_THUMB = "thumb";
  static const String SIZE_DISPLAY = "display";

  static const List<String> FIELDS = <String>[
    FIELD_FRONT,
    FIELD_INGREDIENTS,
    FIELD_NUTRITION,
    FIELD_OTHER
  ];

  static const List<String> SIZES  = <String>[
    SIZE_SMALL,
    SIZE_THUMB,
    SIZE_DISPLAY
  ];

  ProductImage({
    this.field,
    this.size,
    this.language,
    this.url
  });

  final String field;
  final String size;
  final String language;
  String url;
}