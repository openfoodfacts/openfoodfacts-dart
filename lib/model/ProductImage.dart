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
  static const String _UNKNOWN_TAG = 'unknown';

  static const Map<ImageSize, String> _VALUES = {
    ImageSize.THUMB: 'thumb',
    ImageSize.SMALL: 'small',
    ImageSize.DISPLAY: 'display',
    ImageSize.ORIGINAL: 'original',
    ImageSize.UNKNOWN: _UNKNOWN_TAG,
  };

  static const Map<ImageSize, String> _NUMBERS = {
    ImageSize.THUMB: '100',
    ImageSize.SMALL: '200',
    ImageSize.DISPLAY: '400',
    ImageSize.ORIGINAL: 'full',
    ImageSize.UNKNOWN: _UNKNOWN_TAG,
  };

  String get value => _VALUES[this] ?? _UNKNOWN_TAG;

  String toNumber() => _NUMBERS[this] ?? _UNKNOWN_TAG;

  static ImageSize getType(String s) => ImageSize.values.firstWhere(
        (final ImageSize key) => _VALUES[key] == s.toLowerCase(),
        orElse: () => ImageSize.UNKNOWN,
      );

  static ImageSize fromNumber(String s) => ImageSize.values.firstWhere(
        (final ImageSize key) => _NUMBERS[key] == s,
        orElse: () => ImageSize.UNKNOWN,
      );
}

/// The url to a specific product image.
/// Categorized by content type, size and language
class ProductImage {
  ProductImage(
      {required this.field, this.size, this.language, this.url, this.rev});

  final ImageField field;
  final ImageSize? size;
  final OpenFoodFactsLanguage? language;
  String? url;
  int? rev;
}
