import 'package:openfoodfacts/model/OffTagged.dart';

enum Level implements OffTagged {
  LOW(offTag: 'low'),
  MODERATE(offTag: 'moderate'),
  HIGH(offTag: 'high'),
  UNDEFINED(offTag: 'undefined');

  const Level({
    required this.offTag,
  });

  @override
  final String offTag;

  /// Returns the first [Level] that matches the [offTag].
  static Level? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, Level.values) as Level?;
}

extension LevelExtension on Level? {
  String get value => (this ?? Level.UNDEFINED).offTag;

  static Level getLevel(String? s) => Level.fromOffTag(s) ?? Level.UNDEFINED;
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
