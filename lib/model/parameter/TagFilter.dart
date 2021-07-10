import 'package:openfoodfacts/interface/Parameter.dart';

/// Tag filter ("LIST contains/without ITEM") search API parameter
///
/// Eg. 'nutrition_grades' contains 'A'
class TagFilter extends Parameter {
  // actually not used
  @override
  String getName() => '';

  String getTagType() => tagType;

  String getContains() => contains ? 'contains' : 'without';

  String getTagName() => tagName;

  // actually not used
  @override
  String getValue() => '';

  final String tagType;
  final bool contains;
  final String tagName;

  const TagFilter({
    required this.tagType,
    required this.contains,
    required this.tagName,
  });

  @override
  int addToMap(final Map<String, String> result, final int currentIndex) {
    result['tagtype_$currentIndex'] = getTagType();
    result['tag_contains_$currentIndex'] = getContains();
    result['tag_$currentIndex'] = getTagName();
    return currentIndex + 1;
  }
}
