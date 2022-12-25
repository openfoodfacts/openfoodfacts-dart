import 'dart:convert';

/// Invalid barcode blacklist
///
/// cf. https://github.com/openfoodfacts/openfoodfacts-dart/issues/188
/// The barcode scanners will return invalid barcodes due to bright reflections,
/// poor lighting, etc… While those barcodes are theoretically valid EAN-8
/// barcodes, they are not attributed. We are thus putting in place a server
/// side blacklist of common invalid barcodes, so that the app doesn't return a
/// prompt to add a blacklisted product, or return a result for an invalid
/// product once someone has created it.
class InvalidBarcodes {
  /// JSON load constructor; may throw an exception.
  InvalidBarcodes.loadFromJSONString(final String jsonString) {
    final List<dynamic> inputJson = json.decode(jsonString);
    for (final dynamic item in inputJson) {
      _barcodes.add(item as String);
    }
    if (_barcodes.isEmpty) {
      throw Exception(
          'Unexpected error: empty invalid barcode list from json string $jsonString');
    }
  }

  /// Lazy but 99.9% of the time good enough constructor
  InvalidBarcodes.base() {
    _barcodes.addAll(_INVALID_BARCODES);
  }

  final List<String> _barcodes = [];

  /// Checks if a barcode is blacklisted
  bool isBlacklisted(final String barcode) => _barcodes.contains(barcode);

  /// Where the JSON file can be found.
  static String getUrl() =>
      'https://world.openfoodfacts.org/data/invalid-barcodes.json';

  // TODO: values from URL as of 2022-07-12; check for changes once in a while
  static const List<String> _INVALID_BARCODES = [
    '323673',
    '2575405',
    '10232903',
    '10576403',
    '10836813',
    '12562213',
    '13297703',
    '15600703',
    '16130357',
    '16256163',
    '16256866',
  ];
}
