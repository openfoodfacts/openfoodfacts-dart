import 'package:openfoodfacts/personalized_search/available_attribute_groups.dart';
import 'package:openfoodfacts/personalized_search/available_preference_importances.dart';

/// Referential for product preferences: attribute groups and importance.
class AvailableProductPreferences {
  /// Load constructor - may throw an exception.
  AvailableProductPreferences.loadFromJSONStrings({
    required final String preferenceImportancesString,
    required final String attributeGroupsString,
  }) {
    final AvailableAttributeGroups availableAttributeGroups =
        AvailableAttributeGroups.loadFromJSONString(attributeGroupsString);
    final AvailablePreferenceImportances availablePreferenceImportances =
        AvailablePreferenceImportances.loadFromJSONString(
            preferenceImportancesString);
    _availableAttributeGroups = availableAttributeGroups;
    _availablePreferenceImportances = availablePreferenceImportances;
  }

  AvailableAttributeGroups? _availableAttributeGroups;
  AvailableAttributeGroups? get availableAttributeGroups =>
      _availableAttributeGroups;

  AvailablePreferenceImportances? _availablePreferenceImportances;
  AvailablePreferenceImportances? get availablePreferenceImportances =>
      _availablePreferenceImportances;
}
