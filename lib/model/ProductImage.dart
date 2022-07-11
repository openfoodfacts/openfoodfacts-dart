import 'package:openfoodfacts/utils/LanguageHelper.dart';

enum ImageField { FRONT, INGREDIENTS, NUTRITION, PACKAGING, OTHER }

extension ImageFieldExtension on ImageField {
  static const Map<ImageField, String> _VALUES = {
    ImageField.FRONT: 'front',
    ImageField.INGREDIENTS: 'ingredients',
    ImageField.NUTRITION: 'nutrition',
    ImageField.PACKAGING: 'packaging',
    ImageField.OTHER: 'other',
  };

  String get value => getValue(this);

  static String getValue(ImageField field) => _VALUES[field] ?? 'other';

  static ImageField getType(String s) => ImageField.values.firstWhere(
        (final ImageField key) => _VALUES[key] == s.toLowerCase(),
        orElse: () => ImageField.OTHER,
      );
}

enum ImageSize {
  THUMB, // width and height <= 100 px
  SMALL, // width and height <= 200 px
  DISPLAY, // width and height <= 400 px
  ORIGINAL, // width and height: as uploaded
  UNKNOWN, // size not available
}

extension ImageSizeExtension on ImageSize? {
  static const Map<ImageSize, String> _VALUES = {
    ImageSize.THUMB: 'thumb',
    ImageSize.SMALL: 'small',
    ImageSize.DISPLAY: 'display',
    ImageSize.ORIGINAL: 'original',
    ImageSize.UNKNOWN: 'unknown',
  };

  static const Map<ImageSize, String> _NUMBERS = {
    ImageSize.THUMB: '100',
    ImageSize.SMALL: '200',
    ImageSize.DISPLAY: '400',
    ImageSize.ORIGINAL: 'full',
    ImageSize.UNKNOWN: 'unknown',
  };

  String get value => _VALUES[this] ?? 'unknown';

  String toNumber() => _NUMBERS[this] ?? 'unknown';

  static ImageSize getType(String s) => ImageSize.values.firstWhere(
        (final ImageSize key) => _VALUES[key] == s.toLowerCase(),
        orElse: () => ImageSize.UNKNOWN,
      );

  static ImageSize fromNumber(String s) => ImageSize.values.firstWhere(
        (final ImageSize key) => _NUMBERS[key] == s,
        orElse: () => ImageSize.UNKNOWN,
      );
}

/// Angle for image rotation.
enum ImageAngle {
  /// Noon = no rotation
  NOON,

  /// 3 o'clock
  THREE_O_CLOCK,

  /// 6 o'clock
  SIX_O_CLOCK,

  /// 9 o'clock
  NINE_O_CLOCK,
}

extension ImageAngleExtension on ImageAngle {
  static const Map<ImageAngle, int> _DEGREES_CLOCKWISE = {
    ImageAngle.NOON: 0,
    ImageAngle.THREE_O_CLOCK: 90,
    ImageAngle.SIX_O_CLOCK: 180,
    ImageAngle.NINE_O_CLOCK: 270,
  };

  String get degreesClockwise => _DEGREES_CLOCKWISE[this]?.toString() ?? '0';

  /// Returns the corresponding [ImageAngle], or null if not found.
  static ImageAngle? fromInt(final int? clockwiseDegree) {
    for (final MapEntry<ImageAngle, int> entry in _DEGREES_CLOCKWISE.entries) {
      if (entry.value == clockwiseDegree) {
        return entry.key;
      }
    }
    return null;
  }
}

/// The url to a specific product image.
/// Categorized by content type, size and language
class ProductImage {
  ProductImage({
    required this.field,
    this.size,
    this.language,
    this.url,
    this.rev,
    this.imgid,
    this.angle,
    this.coordinatesImageSize,
    this.x1,
    this.y1,
    this.x2,
    this.y2,
  });

  final ImageField field;
  final ImageSize? size;
  final OpenFoodFactsLanguage? language;
  String? url;

  /// Revision number
  int? rev;

  /// Uploaded image id (probably an `int`)
  String? imgid;

  /// Image angle, compared to the uploaded image
  ImageAngle? angle;

  /// On what size are the coordinates ([x1], ...)computed? 'full' or '400'
  String? coordinatesImageSize;

  /// Crop coordinate x1, compared to the uploaded image
  int? x1;

  /// Crop coordinate y1, compared to the uploaded image
  int? y1;

  /// Crop coordinate x2, compared to the uploaded image
  int? x2;

  /// Crop coordinate y2, compared to the uploaded image
  int? y2;

  @override
  String toString() =>
      'ProductImage(${field.value}${size == null ? '' : ',size=${size.value}'}${language == null ? '' : ',language=${language.code}'}${angle == null ? '' : ',angle=${angle!.degreesClockwise}'}${url == null ? '' : ',url=$url'}${imgid == null ? '' : ',imgid=$imgid'}${rev == null ? '' : ',rev=$rev'}${coordinatesImageSize == null ? '' : ',coordinatesImageSize=$coordinatesImageSize'}${x1 == null ? '' : ',x1=$x1'}${y1 == null ? '' : ',y1=$y1'}${x2 == null ? '' : ',x2=$x2'}${y2 == null ? '' : ',y2=$y2'})';
}
