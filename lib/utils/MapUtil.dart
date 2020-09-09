class MapUtil {
  static Map<String, String> flattenMap(Map<String, dynamic> map) {
    final Map<String, String> translations = {};
    map.forEach((String key, dynamic value) {
      if (value is Map) {
        translations.addAll(flattenMap(value));
      } else {
        translations['$key'] = value.toString();
      }
    });
    return translations;
  }
}
