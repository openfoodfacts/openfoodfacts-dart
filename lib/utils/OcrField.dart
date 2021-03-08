enum OcrField {
  TESSERACT,
  GOOGLE_CLOUD_VISION,
}

extension OcrFieldExtension on OcrField {
  String get key {
    switch (this) {
      case OcrField.TESSERACT:
        return 'tesseract';
      case OcrField.GOOGLE_CLOUD_VISION:
      default:
        return 'google_cloud_vision';
    }
  }
}
