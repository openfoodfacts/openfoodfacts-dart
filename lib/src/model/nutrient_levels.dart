import 'off_tagged.dart';

enum NutrientLevel implements OffTagged {
  LOW(offTag: 'low'),
  MODERATE(offTag: 'moderate'),
  HIGH(offTag: 'high'),
  UNDEFINED(offTag: 'undefined');

  const NutrientLevel({
    required this.offTag,
  });

  @override
  final String offTag;

  /// Returns the first [NutrientLevel] that matches the [offTag].
  static NutrientLevel? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, NutrientLevel.values) as NutrientLevel?;
}

extension NutrientLevelExtension on NutrientLevel? {
  String get value => (this ?? NutrientLevel.UNDEFINED).offTag;

  static NutrientLevel getLevel(String? s) =>
      NutrientLevel.fromOffTag(s) ?? NutrientLevel.UNDEFINED;
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

  Map<String, NutrientLevel> levels; // "nutrient" : Level

  NutrientLevels(this.levels);

  static NutrientLevels fromJson(Map? json) {
    Map<String, NutrientLevel> result = {};

    if (json == null) {
      return NutrientLevels(result);
    }

    for (int i = 0; i < nutrients.length; i++) {
      var key = nutrients[i];
      result[key] = NutrientLevelExtension.getLevel(json[key]);
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
