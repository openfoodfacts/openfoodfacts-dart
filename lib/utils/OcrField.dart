enum OcrField {
  TESSERACT,
  GOOGLE_CLOUD_VISION,
}

extension OcrFieldExtension on OcrField {
  static const Map<OcrField, String> _KEYS = {
    OcrField.TESSERACT: 'tesseract',
    OcrField.GOOGLE_CLOUD_VISION: 'google_cloud_vision',
  };

  String get key => _KEYS[this] ?? 'google_cloud_vision';
}
