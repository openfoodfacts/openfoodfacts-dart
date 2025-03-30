import 'nutriscore_category.dart';
import 'nutriscore_enums.dart';
import 'nutriscore_raw.dart';

/// Represents the computed or inferred Nutri-Score of a product.
///
/// The Nutri-Score may include different information depending on its [status] and [version].
///
/// The [NutriScoreStatus] can be:
/// - [unknown]: The Nutri-Score is unknown (see [missingData]).
/// - [notApplicable]: The Nutri-Score is not applicable (see [notApplicableCategory]).
/// - [computed]: The Nutri-Score is computed (see [grade], [category], [score]).
/// - [invalid]: The Nutri-Score is invalid (see [errorMessage]).
///
/// Example:
/// ```dart
/// final nutriScore = product.nutriscores?[NutriScoreVersion.v2023];
///
/// final category = switch (nutriScore?.category?.as2023) {
///   NutriScoreCategory2023.water => 'Water',
///   NutriScoreCategory2023.beverage => 'Beverage',
///   NutriScoreCategory2023.fatOilNutsSeeds => 'Fat/Oil/Nuts/Seeds',
///   NutriScoreCategory2023.cheese => 'Cheese',
///   NutriScoreCategory2023.redMeatProduct => 'Red Meat Product',
///   NutriScoreCategory2023.general => 'General Food',
///   _ => 'Unknown Category',
/// };
///
/// final infoText = switch (nutriScore?.status) {
///   NutriScoreStatus.unknown =>
///     'Unknown (missing data: ${nutriScore?.missingData?.join(', ') ?? 'n/a'})',
///   NutriScoreStatus.notApplicable =>
///     'Not Applicable (category: ${nutriScore?.notApplicableCategory ?? 'n/a'})',
///   NutriScoreStatus.computed =>
///     'Computed (grade: ${nutriScore?.grade}, score: ${nutriScore?.score}, category: $category)',
///   NutriScoreStatus.invalid =>
///     'Invalid (error: ${nutriScore?.errorMessage ?? 'unknown error'})',
///   null => 'No Nutri-Score available',
/// };
///
/// print('Nutri-Score: $infoText');
/// ```
class NutriScore {
  final NutriScoreStatus status;
  final NutriScoreGrade? grade;
  final NutriScoreVersion? version;
  final NutriScoreCategory? category;
  final int? score;
  final String? notApplicableCategory;
  final List<NutriScoreInput>? missingData;
  final String? errorMessage;

  /// Private Constructor.
  /// Use the factory constructors to create instances of [NutriScore].
  const NutriScore._({
    required this.status,
    this.grade,
    this.version,
    this.category,
    this.score,
    this.notApplicableCategory,
    this.errorMessage,
    this.missingData,
  });

  /// Creates a [NutriScore] with [NutriScoreStatus.unknown].
  ///
  /// This indicates that the Nutri-Score could not be computed due to missing data,
  /// but partial information such as [version] and [category] may still be present.
  ///
  /// The [missingData] parameter indicates which data is missing.
  factory NutriScore.unknown([
    NutriScoreVersion? version,
    NutriScoreCategory? category,
    List<NutriScoreInput>? missingData,
  ]) {
    return NutriScore._(
      status: NutriScoreStatus.unknown,
      version: version,
      category: category,
      missingData: missingData,
    );
  }

  /// Creates a [NutriScore] with [NutriScoreStatus.notApplicable].
  ///
  /// Used when the Nutri-Score does not apply to the product category (e.g., alcoholic beverages).
  /// See [notApplicableCategory] for the explanation provided by the API.
  factory NutriScore.notApplicable(
    NutriScoreVersion version,
    NutriScoreCategory? category,
    List<NutriScoreInput>? missingData,
    String? notApplicableCategory,
  ) {
    return NutriScore._(
      status: NutriScoreStatus.notApplicable,
      version: version,
      category: category,
      missingData: missingData,
      notApplicableCategory: notApplicableCategory,
    );
  }

  /// Creates a [NutriScore] with [NutriScoreStatus.computed].
  ///
  /// This represents a successfully calculated Nutri-Score with a [grade], [score], and product [category].
  factory NutriScore.computed(
    NutriScoreVersion version,
    NutriScoreGrade grade,
    NutriScoreCategory category,
    int score,
  ) {
    return NutriScore._(
      status: NutriScoreStatus.computed,
      grade: grade,
      version: version,
      category: category,
      score: score,
    );
  }

  /// Creates a [NutriScore] with [NutriScoreStatus.invalid].
  ///
  /// Used to represent an error in parsing or interpreting Nutri-Score data.
  /// The [errorMessage] can be shown in the UI or logs.
  factory NutriScore.invalid(String errorMessage) {
    return NutriScore._(
      status: NutriScoreStatus.invalid,
      errorMessage: errorMessage,
    );
  }

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
        result[version] = NutriScore._fromRaw(version, raw);
      } catch (_) {
        continue;
      }
    }
    return result.isEmpty ? null : result;
  }

  /// Parses the raw grade string from the API into a [NutriScoreStatus] and optional [NutriScoreGrade].
  ///
  /// Returns a tuple where the status indicates whether the grade is computed, unknown, or not applicable.
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
      _ => NutriScore.invalid('Unexpected NutriScore: ${raw.grade}'),
    };
  }

  @override
  String toString() {
    return 'NutriScore{status: ${status.name}, grade: ${grade?.name}, version: $version, category: $category, score: $score, notApplicableCategory: $notApplicableCategory, errorMessage: $errorMessage, missingData: $missingData}';
  }
}
