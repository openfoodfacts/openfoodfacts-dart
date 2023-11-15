import 'preference_importance.dart';
import '../utils/http_helper.dart';

/// Referential of preference importance, with loader.
class AvailablePreferenceImportances {
  /// Load constructor; may throw an exception.
  AvailablePreferenceImportances.loadFromJSONString(
    final String preferenceImportancesString,
  ) {
    final List<String> importanceIds = <String>[];
    final Map<String, PreferenceImportance> preferenceImportances =
        <String, PreferenceImportance>{};
    final Map<String, int> importancesReverseIds = <String, int>{};
    final dynamic inputJson =
        HttpHelper().jsonDecode(preferenceImportancesString);
    for (final dynamic item in inputJson as List<dynamic>) {
      final PreferenceImportance preferenceImportance =
          PreferenceImportance.fromJson(item);
      final String? id = preferenceImportance.id;
      if (id != null) {
        preferenceImportances[id] = preferenceImportance;
        importanceIds.add(id);
        importancesReverseIds[id] = importanceIds.length - 1;
      }
    }
    if (importanceIds.isEmpty) {
      throw Exception(
          'Unexpected error: empty preference importance list from json string $preferenceImportancesString');
    }
    int i = 0;
    for (final String preferenceImportanceId in importanceIds) {
      importancesReverseIds[preferenceImportanceId] = i++;
    }
    _importanceIds = importanceIds;
    _preferenceImportances = preferenceImportances;
    _importancesReverseIds = importancesReverseIds;
  }

  List<String>? _importanceIds;
  List<String>? get importanceIds => _importanceIds;
  Map<String, PreferenceImportance>? _preferenceImportances;
  Map<String, int>? _importancesReverseIds;

  /// Where a localized JSON file can be found.
  /// [languageCode] is a 2-letter language code.
  static String getUrl(final String languageCode) =>
      'https://world.openfoodfacts.org/api/v2/preferences?lc=$languageCode';

  /// Returns the index of an importance.
  ///
  /// From 0: not important.
  int getImportanceIndex(final String importanceId) =>
      _importancesReverseIds?[importanceId] ??
      PreferenceImportance.INDEX_NOT_IMPORTANT;

  /// Returns the importance from its id.
  PreferenceImportance? getPreferenceImportance(final String importanceId) =>
      _preferenceImportances?[importanceId] ??
      _preferenceImportances?[PreferenceImportance.ID_NOT_IMPORTANT];
}
