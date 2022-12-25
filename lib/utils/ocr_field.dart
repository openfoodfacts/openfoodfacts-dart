import 'package:openfoodfacts/model/off_tagged.dart';

enum OcrField implements OffTagged {
  TESSERACT(offTag: 'tesseract'),
  GOOGLE_CLOUD_VISION(offTag: 'google_cloud_vision');

  const OcrField({
    required this.offTag,
  });

  @override
  final String offTag;

  // TODO: deprecated from 2022-11-12; remove when old enough
  @Deprecated('Use offTag instead')
  String get key => offTag;
}
