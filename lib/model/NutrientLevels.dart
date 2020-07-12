enum Level { LOW, MODERATE, HIGH, UNDEFINED }

class NutrientLevels {
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

  static NutrientLevels fromJson(Map<String, dynamic> json) {
    Map<String, Level> result = Map<String, Level>();

    if(json == null) {
      return NutrientLevels(result);
    }

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

  static Map<String, dynamic> toJson(NutrientLevels nutrientLevels) {
    Map<String, String> result = Map<String, String>();

    if(nutrientLevels == null) {
      return null;
    }

    if (nutrientLevels.levels == null) {
      nutrientLevels.levels = Map<String, Level>();
      nutrientLevels.levels[NUTRIENT_SUGARS] = Level.UNDEFINED;
      nutrientLevels.levels[NUTRIENT_FAT] = Level.UNDEFINED;
      nutrientLevels.levels[NUTRIENT_SATURATED_FAT] = Level.UNDEFINED;
      nutrientLevels.levels[NUTRIENT_SALT] = Level.UNDEFINED;
    }

    for (int i = 0; i < nutrientLevels.levels.length; i++) {
      var key = nutrients[i];

      switch (nutrientLevels.levels[key]) {
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
