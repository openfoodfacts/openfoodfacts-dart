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
  static const String SIZE_ORIGINAL = "original";

  static const String NUMBER_100 = "100";
  static const String NUMBER_200 = "200";
  static const String NUMBER_400 = "400";
  static const String NUMBER_FULL = "full";


  static const List<String> FIELDS = <String>[
    FIELD_FRONT,
    FIELD_INGREDIENTS,
    FIELD_NUTRITION,
    FIELD_OTHER
  ];

  static const List<String> SIZES = <String>[
    SIZE_SMALL,
    SIZE_THUMB,
    SIZE_DISPLAY,
    SIZE_ORIGINAL
  ];

  static const List<String> NUMBERS = <String>[
    NUMBER_100,
    NUMBER_200,
    NUMBER_400,
    NUMBER_FULL
  ];
  
  static const Map<String, String> SIZE_TO_NUMBER = <String, String>{
    SIZE_THUMB : NUMBER_100,
    SIZE_SMALL : NUMBER_200,
    SIZE_DISPLAY : NUMBER_400,
    SIZE_ORIGINAL : NUMBER_FULL
  };

  static const Map<String, String> NUMBER_TO_SIZE = <String, String>{
    NUMBER_100 : SIZE_THUMB,
    NUMBER_200 : SIZE_SMALL,
    NUMBER_400 : SIZE_DISPLAY,
    NUMBER_FULL : SIZE_ORIGINAL
  };

  ProductImage({this.field, this.size, this.language, this.url, this.rev});

  final String field;
  final String size;
  final String language;
  String url;
  int rev;
}
