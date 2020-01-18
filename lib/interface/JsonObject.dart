import 'dart:ffi';

/// interface class for all serializable json model objects.
abstract class JsonObject {
  Map<String, dynamic> toJson();

  Map<String, String> toData() {
    var result = new Map<String, String>();
    for (MapEntry<String, dynamic> entry in toJson().entries) {
      result.putIfAbsent(entry.key, () => entry.value.toString());
    }

    return result;
  }

  const JsonObject();

  static int parseInt(dynamic json) =>
      json is String ? int.tryParse(json) : json;

  static double parseDouble(dynamic json) {
    if (json is String) {
      return double.tryParse(json);
    } else if (json is int) {
      return json.toDouble();
    } else {
      return json;
    }
  }
}
