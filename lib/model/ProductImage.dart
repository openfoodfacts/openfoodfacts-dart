import 'package:openfoodfacts/utils/LanguageHelper.dart';

enum ImageField { FRONT, INGREDIENTS, NUTRITION, PACKAGING, OTHER }

extension ImageFieldExtension on ImageField? {
  String get value {
    return getValue(this);
  }

  static String getValue(ImageField? field) {
    switch (field) {
      case ImageField.FRONT:
        return "front";
      case ImageField.INGREDIENTS:
        return "ingredients";
      case ImageField.NUTRITION:
        return "nutrition";
      case ImageField.PACKAGING:
        return "packaging";
      case ImageField.OTHER:
      default:
        return "other";
    }
  }

  static ImageField getType(String s) {
    switch (s.toLowerCase()) {
      case "front":
        return ImageField.FRONT;
      case "ingredients":
        return ImageField.INGREDIENTS;
      case "nutrition":
        return ImageField.NUTRITION;
      case "packaging":
        return ImageField.PACKAGING;
      case "other":
      default:
        return ImageField.OTHER;
    }
  }
}

enum ImageSize {
  THUMB, // width and height <= 100 px
  SMALL, // width and height <= 200 px
  DISPLAY, // width and height <= 400 px
  ORIGINAL, // width and height: as uploaded
  UNKNOWN, // size not available
}

extension ImageSizeExtension on ImageSize? {
  String get value {
    switch (this) {
      case ImageSize.THUMB:
        return "thumb";
      case ImageSize.SMALL:
        return "small";
      case ImageSize.DISPLAY:
        return "display";
      case ImageSize.ORIGINAL:
        return "original";
      default:
        return "unknown";
    }
  }

  static ImageSize getType(String s) {
    switch (s.toLowerCase()) {
      case "thumb":
        return ImageSize.THUMB;
      case "small":
        return ImageSize.SMALL;
      case "display":
        return ImageSize.DISPLAY;
      case "original":
        return ImageSize.ORIGINAL;
      default:
        return ImageSize.UNKNOWN;
    }
  }

  static ImageSize fromNumber(String s) {
    switch (s) {
      case "100":
        return ImageSize.THUMB;
      case "200":
        return ImageSize.SMALL;
      case "400":
        return ImageSize.DISPLAY;
      case "full":
        return ImageSize.ORIGINAL;
      default:
        return ImageSize.UNKNOWN;
    }
  }

  String toNumber() {
    switch (this) {
      case ImageSize.THUMB:
        return "100";
      case ImageSize.SMALL:
        return "200";
      case ImageSize.DISPLAY:
        return "400";
      case ImageSize.ORIGINAL:
        return "full";
      case ImageSize.UNKNOWN:
      default:
        return "unknown";
    }
  }
}

/// The url to a specific product image.
/// Categorized by content type, size and language
class ProductImage {
  ProductImage({this.field, this.size, this.language, this.url, this.rev});

  final ImageField? field;
  final ImageSize? size;
  final OpenFoodFactsLanguage? language;
  String? url;
  int? rev;
}
