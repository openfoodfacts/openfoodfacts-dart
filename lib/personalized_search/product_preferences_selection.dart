/// Where the preferences regarding the importance of attributes are accessed
///
/// You are free to use whatever solution to set and get
/// the importance of an attribute, and to notify listeners after refresh.
/// E.g. `SharedPreferences` and provider.
/// Some simple app may even use simple fix solution.
class ProductPreferencesSelection {
  ProductPreferencesSelection({
    required this.setImportance,
    required this.getImportance,
    required this.notify,
  });

  /// Sets the importance of an attribute, e.g. in a SharedPreferences.
  ///
  /// Ex:
  /// ```dart
  /// (String attributeId, String importanceIndex) async =>
  ///     await mySharedPreferences.setString(attributeId, importanceId)
  /// ```
  /// For pre-determined fix settings, that can be more simple:
  /// ```dart
  /// (String attributeId, String importanceIndex) async {}
  /// ```
  final Future<void> Function(
    String attributeId,
    String importanceId,
  ) setImportance;

  /// Gets the importance of an attribute, e.g. from a SharedPreferences.
  ///
  /// Ex:
  /// ```dart
  /// (String attributeId) =>
  ///     mySharedPreferences.getString(attributeId)
  ///     ?? PreferenceImportance.ID_NOT_IMPORTANT
  /// ```
  /// For pre-determined fix settings, that can be more simple:
  /// ```dart
  /// (String attributeId) =>
  ///     attributeId == AvailableAttributeGroups.ATTRIBUTE_VEGAN
  ///     ? PreferenceImportance.ID_MANDATORY
  ///     : PreferenceImportance.ID_NOT_IMPORTANT
  /// ```
  final String Function(String attributeId) getImportance;

  /// Notifies listeners about a refresh.
  ///
  /// Ex:
  /// ```dart
  /// () => myProvider.notifyListeners()
  /// ```
  /// For pre-determined fix settings, that can be more simple:
  /// ```dart
  /// () {}
  /// ```
  final void Function() notify;
}
