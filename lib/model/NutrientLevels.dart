enum Level { LOW, MODERATE, HIGH, UNDEFINED }

extension LevelExtension on Level? {
  String get value {
    switch (this) {
      case Level.LOW:
        return 'low';
      case Level.MODERATE:
        return 'moderate';
      case Level.HIGH:
        return 'high';
      case Level.UNDEFINED:
        return 'undefined';
      default:
        return 'undefined';
    }
  }

  static Level getLevel(String? s) {
    switch (s) {
      case 'low':
        return Level.LOW;
      case 'moderate':
        return Level.MODERATE;
      case 'high':
        return Level.HIGH;
      default:
        return Level.UNDEFINED;
    }
  }
}

class NutrientLevels {
  static const String NUTRIENT_SUGARS = 'sugars';
  static const String NUTRIENT_FAT = 'fat';
  static const String NUTRIENT_SATURATED_FAT = 'saturated-fat';
  static const String NUTRIENT_SALT = 'salt';

  static const List<String> nutrients = [
    NUTRIENT_SUGARS,
    NUTRIENT_FAT,
    NUTRIENT_SATURATED_FAT,
    NUTRIENT_SALT
  ];

  Map<String, Level> levels; // "nutrient" : Level

  NutrientLevels(this.levels);

  static NutrientLevels fromJson(Map? json) {
    Map<String, Level> result = {};

    if (json == null) {
      return NutrientLevels(result);
    }

    for (int i = 0; i < nutrients.length; i++) {
      var key = nutrients[i];
      result[key] = LevelExtension.getLevel(json[key]);
    }

    return NutrientLevels(result);
  }

  static Map<String, dynamic>? toJson(NutrientLevels? nutrientLevels) {
    Map<String, String> result = {};

    if (nutrientLevels == null) {
      return null;
    }

    for (int i = 0; i < nutrientLevels.levels.length; i++) {
      var key = nutrients[i];
      result[key] = nutrientLevels.levels[key].value;
    }

    return result;
  }
}
