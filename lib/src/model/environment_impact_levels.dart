import 'nutrient_levels.dart';

class EnvironmentImpactLevels {
  List<NutrientLevel> levels;

  EnvironmentImpactLevels(this.levels);

  static EnvironmentImpactLevels? fromJson(List<dynamic>? json) {
    if (json == null) {
      return null;
    }
    List<NutrientLevel> result = <NutrientLevel>[];

    for (String s in json) {
      result.add(NutrientLevelExtension.getLevel(s.substring(3)));
    }

    return EnvironmentImpactLevels(result);
  }

  static List<String>? toJson(
      EnvironmentImpactLevels? environmentImpactLevels) {
    if (environmentImpactLevels == null) {
      return null;
    }

    List<String> result = [];

    for (NutrientLevel level in environmentImpactLevels.levels) {
      result.add('en:${level.value}');
    }

    return result;
  }
}
