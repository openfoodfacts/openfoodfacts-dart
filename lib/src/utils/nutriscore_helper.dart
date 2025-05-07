import '../model/nutriscore.dart';
import '../model/nutriscore_category.dart';
import '../model/nutriscore_enums.dart';
import '../model/nutriscore_raw.dart';

class NutriScoreHelper {
  /// Returns Map of [NutriScore]s for each version from a JSON map
  static Map<NutriScoreVersion, NutriScore>? fromJson(dynamic json) {
    if (json == null) return null;

    if (json is! Map<String, dynamic>) {
      throw FormatException(
          'Nutri-Score data is not Map<String, dynamic>, got ${json.runtimeType}');
    }

    final result = <NutriScoreVersion, NutriScore>{};

    for (final MapEntry(:key, :value) in json.entries) {
      final version = NutriScoreVersion.tryParse(key);
      if (version == null || value is! Map<String, dynamic>) {
        continue;
      }

      try {
        final raw = NutriScoreRaw.fromJson(value);
        result[version] = _fromRaw(version, raw);
      } catch (_) {
        continue;
      }
    }
    return result.isEmpty ? null : result;
  }

  /// Converts a Map of [NutriScore]s to a JSON map.
  static toJson(Map<NutriScoreVersion, NutriScore>? nutriscoreDetails) {
    if (nutriscoreDetails == null) return null;

    return {
      for (final MapEntry(:key, :value) in nutriscoreDetails.entries)
        key.name: value.toJson(),
    };
  }

  /// Parses the raw grade string from the API into a [NutriScoreStatus]
  /// and optional [NutriScoreGrade].
  ///
  /// Returns a tuple where the status indicates whether the grade is
  /// computed, unknown, or not applicable.
  static (NutriScoreStatus, NutriScoreGrade?) _parseGrade(String grade) =>
      switch (grade.toLowerCase()) {
        'not-applicable' => (NutriScoreStatus.notApplicable, null),
        'a' => (NutriScoreStatus.computed, NutriScoreGrade.A),
        'b' => (NutriScoreStatus.computed, NutriScoreGrade.B),
        'c' => (NutriScoreStatus.computed, NutriScoreGrade.C),
        'd' => (NutriScoreStatus.computed, NutriScoreGrade.D),
        'e' => (NutriScoreStatus.computed, NutriScoreGrade.E),
        _ => (NutriScoreStatus.unknown, null),
      };

  /// Parses a [NutriScore] from raw API data using the given [version].
  ///
  /// Internally determines the Nutri-Score status, grade, category, and score.
  /// Falls back to [NutriScore.invalid] if critical fields are missing.
  static NutriScore _fromRaw(
    NutriScoreVersion version,
    NutriScoreRaw raw,
  ) {
    final (status, grade) = _parseGrade(raw.grade ?? '');
    final category = NutriScoreCategory.fromRaw(version, raw.data);
    final score = raw.score;
    final missingData = <NutriScoreInput>[
      if (!raw.categoryAvailable) NutriScoreInput.category,
      if (!raw.nutrientsAvailable) NutriScoreInput.nutrients,
    ];

    return switch (status) {
      NutriScoreStatus.unknown =>
        NutriScore.unknown(version, category, missingData),
      NutriScoreStatus.notApplicable => NutriScore.notApplicable(
          version, category, missingData, raw.notApplicableCategory),
      NutriScoreStatus.computed
          when grade == null || category == null || score == null =>
        NutriScore.invalid('Missing required fields (grade, category, score)'),
      NutriScoreStatus.computed =>
        NutriScore.computed(version, grade!, category!, score!),
      _ => NutriScore.invalid('Unexpected Nutri-Score: ${raw.grade}'),
    };
  }
}

extension _NutriScoreJsonExtension on NutriScore {
  /// Converts the [NutriScore] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'grade': _combinedGradeAndStatus,
      'category_available': _isAvailable(NutriScoreInput.category) ? 1 : 0,
      'nutrients_available': _isAvailable(NutriScoreInput.nutrients) ? 1 : 0,
      'data': category?.toJson() ?? {},
      if (score != null) 'score': score,
      if (notApplicableCategory != null)
        'not_applicable_category': notApplicableCategory,
    };
  }

  bool _isAvailable(NutriScoreInput input) => !missingData.contains(input);

  /// Returns a string representation of the Nutri-Score grade and status.
  String get _combinedGradeAndStatus =>
      grade?.name.toLowerCase() ??
      (status == NutriScoreStatus.notApplicable ? 'not-applicable' : 'unknown');
}

extension NutriScoreCategoryJsonExtension on NutriScoreCategory {
  /// Converts the [NutriScoreCategory] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return switch (version) {
      NutriScoreVersion.v2021 => as2021!.toJson(),
      NutriScoreVersion.v2023 => as2023!.toJson(),
    };
  }
}

extension NutriScoreCategory2021JsonExtension on NutriScoreCategory2021 {
  /// Converts the [NutriScoreCategory2021] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'is_water': this == NutriScoreCategory2021.water ? 1 : 0,
      'is_beverage': this == NutriScoreCategory2021.beverage ? 1 : 0,
      'is_cheese': this == NutriScoreCategory2021.cheese ? 1 : 0,
      'is_fat': this == NutriScoreCategory2021.fat ? 1 : 0,
    };
  }
}

extension NutriScoreCategory2023JsonExtension on NutriScoreCategory2023 {
  /// Converts the [NutriScoreCategory2023] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'is_water': this == NutriScoreCategory2023.water ? 1 : 0,
      'is_beverage': this == NutriScoreCategory2023.beverage ? 1 : 0,
      'is_cheese': this == NutriScoreCategory2023.cheese ? 1 : 0,
      'is_red_meat_product':
          this == NutriScoreCategory2023.redMeatProduct ? 1 : 0,
      'is_fat_oil_nuts_seeds':
          this == NutriScoreCategory2023.fatOilNutsSeeds ? 1 : 0,
    };
  }
}
