/// Where the preferences regarding the importance of attributes are accessed
///
/// You are free to use whatever solution to set and get
/// the importance of an attribute, and to notify listeners after refresh.
/// E.g. `SharedPreferences` and provider.
/// Some simple app may even use simple fix solution.
class ProductPreferencesSelection {
  ProductPreferencesSelection({
    required this.getImportance,
    final Future<void> Function(String attributeId, String importanceId)?
        setImportance,
    final Function()? notify,
  })  : _setImportance = setImportance,
        _notify = notify;

  /// Sets the importance of an attribute, e.g. in a SharedPreferences.
  ///
  /// Ex:
  /// ```dart
  /// setImportance: (String attributeId, String importanceIndex) async =>
  ///     await mySharedPreferences.setString(attributeId, importanceId)
  /// ```
  /// For pre-determined fix settings, that can be more simple:
  /// ```dart
  /// setImportance: null
  /// ```
  final Future<void> Function(String attributeId, String importanceId)?
      _setImportance;

  Future<void> setImportance(String attributeId, String importanceId) async {
    if (_setImportance == null) {
      return;
    }
    await _setImportance!(attributeId, importanceId);
  }

  /// Gets the importance of an attribute, e.g. from a SharedPreferences.
  ///
  /// Ex:
  /// ```dart
  /// getImportance: (String attributeId) =>
  ///     mySharedPreferences.getString(attributeId)
  ///     ?? PreferenceImportance.ID_NOT_IMPORTANT
  /// ```
  /// For pre-determined fix settings, that can be more simple:
  /// ```dart
  /// getImportance: (String attributeId) =>
  ///     attributeId == AvailableAttributeGroups.ATTRIBUTE_VEGAN
  ///     ? PreferenceImportance.ID_MANDATORY
  ///     : PreferenceImportance.ID_NOT_IMPORTANT
  /// ```
  final String Function(String attributeId) getImportance;

  /// Notifies listeners about a refresh.
  ///
  /// Ex:
  /// ```dart
  /// notify: () => myProvider.notifyListeners()
  /// ```
  /// For pre-determined fix settings, that can be more simple:
  /// ```dart
  /// notify: null
  /// ```
  final void Function()? _notify;

  void notify() {
    if (_notify == null) {
      return;
    }
    _notify!();
  }
}
