import 'package:image/image.dart';

class ImageHelper {
  static const int MAX_IMAGE_SIZE = 2048;

  static Image resize(Image image, {int maxSize = MAX_IMAGE_SIZE}) {
    // check if the image is already small enough
    if (image.width <= maxSize || image.height <= maxSize) {
      return image;
    }

    // resize the image
    if (image.width > image.height) {
      return copyResize(image, width: maxSize);
    } else {
      return copyResize(image, height: maxSize);
    }
  }
}
