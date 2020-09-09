import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/utils/MapUtil.dart';

/// interface class for all serializable json model objects.
abstract class JsonObject {

  @JsonKey(ignore: true)
  final Map<String, String> apiFields = const {
   'energy_100g' : 'nutriment_energy',
   'carbohydrates_100g' : 'nutriment_carbohydrates',
   'proteins_100g' : 'nutriment_proteins',
   'fat_100g' : 'nutriment_fat',
   'energy_unit' : 'nutriment_energy_unit'
  };

  Map<String, dynamic> toJson();

  Map<String, String> toData() {
    var result = new Map<String, String>();
    for (MapEntry<String, dynamic> entry in MapUtil.flattenMap(toJson()).entries) {
      final value = entry.value;
      if(value != null) {
        final key = apiFields[entry.key] ?? entry.key;
        result.putIfAbsent(key, () => entry.value.toString());
      }
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
