import 'package:openfoodfacts/src/model/off_tagged.dart';

/// Fuzziness Level for Elastic Search API.
enum Fuzziness implements OffTagged {
  // TODO(monsieurtanuki): introduce other values when available, like 1 and 2.
  none(offTag: '0');

  const Fuzziness({
    required this.offTag,
  });

  @override
  final String offTag;
}
