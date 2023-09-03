import 'off_tagged.dart';
import '../utils/language_helper.dart';

enum ImageField implements OffTagged {
  FRONT(offTag: 'front'),
  INGREDIENTS(offTag: 'ingredients'),
  NUTRITION(offTag: 'nutrition'),
  PACKAGING(offTag: 'packaging'),
  OTHER(offTag: 'other');

  const ImageField({
    required this.offTag,
  });

  @override
  final String offTag;

  /// Returns the first [ImageField] that matches the [offTag].
  static ImageField? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, ImageField.values) as ImageField?;
}

enum ImageSize implements OffTagged {
  /// Width and height <= 100 px
  THUMB(offTag: 'thumb', number: '100'),

  /// Width and height <= 200 px
  SMALL(offTag: 'small', number: '200'),

  /// Width and height <= 400 px
  DISPLAY(offTag: 'display', number: '400'),

  /// Width and height: as uploaded
  ORIGINAL(offTag: 'original', number: 'full'),

  /// Size not available
  UNKNOWN(offTag: 'unknown', number: 'unknown');

  const ImageSize({
    required this.offTag,
    required this.number,
  });

  @override
  final String offTag;

  final String number;
}

extension ImageSizeExtension on ImageSize? {
  static ImageSize getType(String s) => ImageSize.values.firstWhere(
        (final ImageSize key) => key.offTag == s.toLowerCase(),
        orElse: () => ImageSize.UNKNOWN,
      );

  static ImageSize fromNumber(String s) => ImageSize.values.firstWhere(
        (final ImageSize key) => key.number == s,
        orElse: () => ImageSize.UNKNOWN,
      );
}

/// Angle for image rotation.
enum ImageAngle {
  /// Noon = no rotation
  NOON(degree: 0),

  /// 3 o'clock
  THREE_O_CLOCK(degree: 90),

  /// 6 o'clock
  SIX_O_CLOCK(degree: 180),

  /// 9 o'clock
  NINE_O_CLOCK(degree: 270);

  const ImageAngle({
    required this.degree,
  });

  /// Degree clockwise.
  final int degree;

  String get degreesClockwise => degree.toString();
}

extension ImageAngleExtension on ImageAngle {
  /// Returns the corresponding [ImageAngle], or null if not found.
  static ImageAngle? fromInt(final int? clockwiseDegree) {
    for (final ImageAngle imageAngle in ImageAngle.values) {
      if (imageAngle.degree == clockwiseDegree) {
        return imageAngle;
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
    this.width,
    this.height,
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

  /// Image width.
  int? width;

  /// Image height.
  int? height;

  @override
  String toString() => 'ProductImage('
      '${field.offTag}'
      '${size == null ? '' : ',size=${size!.offTag}'}'
      '${language == null ? '' : ',language=${language.code}'}'
      '${angle == null ? '' : ',angle=${angle!.degreesClockwise}'}'
      '${url == null ? '' : ',url=$url'}'
      '${imgid == null ? '' : ',imgid=$imgid'}'
      '${rev == null ? '' : ',rev=$rev'}'
      '${coordinatesImageSize == null ? '' : ',coordinatesImageSize=$coordinatesImageSize'}'
      '${x1 == null ? '' : ',x1=$x1'}'
      '${y1 == null ? '' : ',y1=$y1'}'
      '${x2 == null ? '' : ',x2=$x2'}'
      '${y2 == null ? '' : ',y2=$y2'}'
      '${width == null ? '' : ',width=$width'}'
      '${height == null ? '' : ',height=$height'}'
      ')';

  @override
  int get hashCode =>
      '${field.offTag}_${language?.code}_${size?.offTag}'.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is ProductImage &&
        other.field == field &&
        other.size == size &&
        other.language == language &&
        other.url == url &&
        other.rev == rev &&
        other.imgid == imgid &&
        other.angle == angle &&
        other.coordinatesImageSize == coordinatesImageSize &&
        other.x1 == x1 &&
        other.y1 == y1 &&
        other.x2 == x2 &&
        other.y2 == y2 &&
        other.width == width &&
        other.height == height;
  }
}
