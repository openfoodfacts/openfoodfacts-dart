import 'nutriscore_category.dart';
import 'nutriscore_enums.dart';

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
/// final nutriScore = product.nutriscoreDetails?[NutriScoreVersion.v2023];
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
  final List<NutriScoreInput> missingData;
  final String? errorMessage;

  /// Creates a [NutriScore] with [NutriScoreStatus.unknown].
  ///
  /// Used when Nutri-Score computation is not possible due to missing input.
  /// Partial data like [version] and [category] may still be present.
  /// The [missingData] parameter indicates which data is missing.
  NutriScore.unknown([
    this.version,
    this.category,
    this.missingData = const [],
  ])  : status = NutriScoreStatus.unknown,
        grade = null,
        score = null,
        notApplicableCategory = null,
        errorMessage = null;

  /// Creates a [NutriScore] with [NutriScoreStatus.notApplicable].
  ///
  /// Used when the Nutri-Score does not apply to the product category
  /// (e.g., alcoholic beverages). See [notApplicableCategory].
  NutriScore.notApplicable(
    NutriScoreVersion this.version,
    this.category,
    this.missingData,
    this.notApplicableCategory,
  )   : status = NutriScoreStatus.notApplicable,
        grade = null,
        score = null,
        errorMessage = null;

  /// Creates a [NutriScore] with [NutriScoreStatus.computed].
  ///
  /// Used when the Nutri-Score has been successfully calculated.
  /// See [grade], [score], and product [category].
  NutriScore.computed(
    NutriScoreVersion this.version,
    NutriScoreGrade this.grade,
    NutriScoreCategory this.category,
    int this.score,
  )   : status = NutriScoreStatus.computed,
        notApplicableCategory = null,
        errorMessage = null,
        missingData = const [];

  /// Creates a [NutriScore] with [NutriScoreStatus.invalid].
  ///
  /// Used to represent an unexpected or malformed Nutri-Score entry.
  /// See [errorMessage] for details.
  NutriScore.invalid(String this.errorMessage)
      : status = NutriScoreStatus.invalid,
        version = null,
        grade = null,
        category = null,
        score = null,
        notApplicableCategory = null,
        missingData = const [];

  @override
  String toString() {
    return 'NutriScore{'
        'status: ${status.name}, '
        'grade: ${grade?.name}, '
        'version: ${version?.name}, '
        'category: $category, '
        'score: $score, '
        'notApplicableCategory: $notApplicableCategory, '
        'errorMessage: $errorMessage, '
        'missingData: $missingData'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutriScore &&
          status == other.status &&
          grade == other.grade &&
          version == other.version &&
          category?.value == other.category?.value &&
          score == other.score &&
          notApplicableCategory == other.notApplicableCategory &&
          errorMessage == other.errorMessage &&
          _unorderedEquals(missingData, other.missingData);

  @override
  int get hashCode => Object.hash(
        status,
        grade,
        version,
        category?.value,
        score,
        notApplicableCategory,
        errorMessage,
        missingData.fold<int>(0, (acc, e) => acc ^ e.hashCode),
      );

  bool _unorderedEquals<T>(List<T> a, List<T> b) =>
      Set.from(a).containsAll(b) && Set.from(b).containsAll(a);
}
