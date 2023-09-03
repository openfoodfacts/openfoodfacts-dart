import '../model/off_tagged.dart';

enum OcrField implements OffTagged {
  TESSERACT(offTag: 'tesseract'),
  GOOGLE_CLOUD_VISION(offTag: 'google_cloud_vision');

  const OcrField({
    required this.offTag,
  });

  @override
  final String offTag;
}
