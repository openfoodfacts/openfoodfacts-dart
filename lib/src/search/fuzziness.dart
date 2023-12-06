import 'package:openfoodfacts/src/model/off_tagged.dart';

/// Fuzziness Level for Elastic Search API.
///
/// Levenshtein distance (= number of edits).
/// cf. https://www.elastic.co/guide/en/elasticsearch/reference/current/common-options.html#fuzziness
enum Fuzziness implements OffTagged {
  none(offTag: '0'),
  one(offTag: '1'),
  two(offTag: '2');

  const Fuzziness({
    required this.offTag,
  });

  @override
  final String offTag;
}
