import '../model/attribute_group.dart';
import '../utils/http_helper.dart';

/// Referential of attribute groups, with loader.
class AvailableAttributeGroups {
  /// Load constructor; may throw an exception.
  AvailableAttributeGroups.loadFromJSONString(
    final String attributeGroupsString,
  ) {
    final dynamic inputJson = HttpHelper().jsonDecode(attributeGroupsString);
    final List<AttributeGroup> attributeGroups = <AttributeGroup>[];
    for (final dynamic item in inputJson as List<dynamic>) {
      attributeGroups.add(AttributeGroup.fromJson(item));
    }
    if (attributeGroups.isEmpty) {
      throw Exception(
        'Unexpected error: empty attribute groups from json string $attributeGroupsString',
      );
    }
    _attributeGroups = attributeGroups;
  }

  List<AttributeGroup>? _attributeGroups;

  List<AttributeGroup>? get attributeGroups => _attributeGroups;

  /// Where a localized JSON file can be found.
  /// [languageCode] is a 2-letter language code.
  static String getUrl(final String languageCode) =>
      'https://world.openfoodfacts.org/api/v2/attribute_groups?lc=$languageCode';
}
