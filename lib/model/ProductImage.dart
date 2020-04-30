import 'package:openfoodfacts/utils/LanguageHelper.dart';

enum ImageField { FRONT, INGREDIENTS, NUTRITION, OTHER }

extension ImageFieldExtension on ImageField {
  String get value {
    return getValue(this);
  }

  static String getValue(ImageField field) {
    switch (field) {
      case ImageField.FRONT:
        return "front";
        break;
      case ImageField.INGREDIENTS:
        return "ingredients";
        break;
      case ImageField.NUTRITION:
        return "nutrition";
        break;
      case ImageField.OTHER:
      default:
        return "other";
        break;
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
      case "other":
      default:
        return ImageField.OTHER;
    }
  }
}

enum ImageSize {
  THUMB, // width: 100 px
  SMALL, // width: 200 px
  DISPLAY, // width: 400 px
  ORIGINAL, // width: as uploaded
  UNKNOWN, // size not available
}

extension ImageSizeExtension on ImageSize {
  String get value {
    switch (this) {
      case ImageSize.THUMB:
        return "thumb";
        break;
      case ImageSize.SMALL:
        return "small";
        break;
      case ImageSize.DISPLAY:
        return "display";
        break;
      case ImageSize.ORIGINAL:
        return "original";
        break;
      default:
        return null;
        break;
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
        break;
      case ImageSize.SMALL:
        return "200";
        break;
      case ImageSize.DISPLAY:
        return "400";
        break;
      case ImageSize.ORIGINAL:
        return "full";
        break;
      case ImageSize.UNKNOWN:
      default:
        return null;
        break;
    }
  }
}

/// The url to a specific product image.
/// Categorized by content type, size and language
class ProductImage {
  ProductImage({this.field, this.size, this.language, this.url, this.rev});

  final ImageField field;
  final ImageSize size;
  final OpenFoodFactsLanguage language;
  String url;
  int rev;
}
