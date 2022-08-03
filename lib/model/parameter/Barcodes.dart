import 'package:openfoodfacts/interface/Parameter.dart';

/// "Barcodes" search API parameter.
class Barcodes extends Parameter {
  @override
  String getName() => 'code';

  @override
  String getValue() => codes.join(',');

  final List<String> codes;

  Barcodes(final String code) : this.list([code]);

  const Barcodes.list(this.codes);
}
