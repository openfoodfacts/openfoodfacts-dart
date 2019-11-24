import '../interface/JsonObject.dart';

enum Level { LOW, MODERATE, HIGH, UNDEFINED }

class NutrientLevels extends JsonObject {
  static const String NUTRIENT_SUGARS = "sugars";
  static const String NUTRIENT_FAT = "fat";
  static const String NUTRIENT_SATURATED_FAT = "saturated-fat";
  static const String NUTRIENT_SALT = "salt";

  static const List<String> nutrients = [
    NUTRIENT_SUGARS,
    NUTRIENT_FAT,
    NUTRIENT_SATURATED_FAT,
    NUTRIENT_SALT
  ];

  Map<String, Level> levels; // "nutrient" : Level

  NutrientLevels(this.levels);

  factory NutrientLevels.fromJson(Map<String, dynamic> json) {
    Map<String, Level> result = Map<String, Level>();

    for (int i = 0; i < nutrients.length; i++) {
      var key = nutrients[i];

      switch (json[key]) {
        case "low":
          result[key] = Level.LOW;
          break;
        case "moderate":
          result[key] = Level.MODERATE;
          break;
        case "high":
          result[key] = Level.HIGH;
          break;
        default:
          result[key] = Level.UNDEFINED;
          break;
      }
    }

    return NutrientLevels(result);
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, String> result = Map<String, String>();

    for (int i = 0; i < levels.length; i++) {
      var key = nutrients[i];

      switch (levels[key]) {
        case Level.LOW:
          result[key] = "low";
          break;
        case Level.MODERATE:
          result[key] = "moderate";
          break;
        case Level.HIGH:
          result[key] = "high";
          break;
        default:
          break;
      }
    }

    return result;
  }
}
