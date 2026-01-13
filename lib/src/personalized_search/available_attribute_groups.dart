import '../model/attribute_group.dart';
import '../utils/http_helper.dart';

/// Referential of attribute groups, with loader.
class AvailableAttributeGroups {
  /// Load constructor; may throw an exception.
  AvailableAttributeGroups.loadFromJSONString(
    final String attributeGroupsString,
  ) {
    final dynamic inputJson = HttpHelper().jsonDecode(attributeGroupsString);

    // Handle both new format (object with "attribute_groups" key) and
    // old format (direct array) for backward compatibility with cached data
    final List<dynamic> jsonList;
    if (inputJson is Map<String, dynamic>) {
      // New format: {"attribute_groups": [...], "status": "success", ...}
      final dynamic attributeGroupsData = inputJson['attribute_groups'];
      if (attributeGroupsData is! List<dynamic>) {
        throw Exception(
          'Unexpected error: "attribute_groups" key is missing or not a list in json string $attributeGroupsString',
        );
      }
      jsonList = attributeGroupsData;
    } else if (inputJson is List<dynamic>) {
      // Old format: direct array (backward compatibility)
      jsonList = inputJson;
    } else {
      throw Exception(
        'Unexpected error: json is neither a list nor a map in json string $attributeGroupsString',
      );
    }

    final List<AttributeGroup> attributeGroups = <AttributeGroup>[];
    for (final dynamic item in jsonList) {
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
      'https://world.openfoodfacts.org/api/v3.4/attribute_groups?lc=$languageCode';
}
