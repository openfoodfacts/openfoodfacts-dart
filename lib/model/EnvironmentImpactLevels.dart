import 'package:openfoodfacts/model/NutrientLevels.dart';

class EnvironmentImpactLevels {
  List<Level> levels;

  EnvironmentImpactLevels(this.levels);

  static EnvironmentImpactLevels fromJson(List<dynamic> json) {
    if (json == null) {
      return null;
    }

    List<Level> result = List<Level>();

    for (String s in json) {
      result.add(LevelExtension.getLevel(s.substring(3)));
    }

    return EnvironmentImpactLevels(result);
  }

  static List<String> toJson(EnvironmentImpactLevels environmentImpactLevels) {
    if (environmentImpactLevels == null) {
      return null;
    }

    List<String> result = List<String>();

    for (Level level in environmentImpactLevels.levels) {
      result.add('en:${level.value}');
    }

    return result;
  }
}
