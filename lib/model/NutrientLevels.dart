enum Level { LOW, MODERATE, HIGH, UNDEFINED }

extension LevelExtension on Level {
  String get value {
    switch (this) {
      case Level.LOW:
        return 'low';
        break;
      case Level.MODERATE:
        return 'moderate';
        break;
      case Level.HIGH:
        return 'high';
        break;
      case Level.UNDEFINED:
        return 'undefined';
        break;
      default:
        return 'undefined';
        break;
    }
  }

  static Level getLevel(String s) {
    switch (s) {
      case 'low':
        return Level.LOW;
        break;
      case 'moderate':
        return Level.MODERATE;
        break;
      case 'high':
        return Level.HIGH;
        break;
      default:
        return Level.UNDEFINED;
        break;
    }
  }
}

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

    if (json == null) {
      return NutrientLevels(result);
    }

    for (int i = 0; i < nutrients.length; i++) {
      var key = nutrients[i];
      result[key] = LevelExtension.getLevel(json[key]);
    }

    return NutrientLevels(result);
  }

  static Map<String, dynamic> toJson(NutrientLevels nutrientLevels) {
    Map<String, String> result = Map<String, String>();

    if (nutrientLevels == null) {
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
      result[key] = nutrientLevels.levels[key].value;
    }

    return result;
  }
}
