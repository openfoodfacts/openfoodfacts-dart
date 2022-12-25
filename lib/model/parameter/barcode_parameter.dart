import 'package:openfoodfacts/interface/parameter.dart';

/// "Barcodes" search API parameter.
class BarcodeParameter extends Parameter {
  @override
  String getName() => 'code';

  @override
  String getValue() => codes.join(',');

  final List<String> codes;

  BarcodeParameter(final String code) : this.list([code]);

  const BarcodeParameter.list(this.codes);
}
