import '../off_tagged.dart';

/// Internal marker interface for version-specific Nutri-Score categories.
///
/// This is used internally by the abstract [NutriScore] base class to enable
/// shared handling of 2021 and 2023 category types. It is intentionally private
/// to prevent accidental external usage or misimplementation.
abstract class _NutriScoreCategory {}

/// Nutri-Score categories defined for the 2021 specification.
enum NutriScoreCategory2021 implements _NutriScoreCategory {
  general,
  cheese,
  fat,
  beverage,
  water,
}

/// Nutri-Score categories defined for the 2023 specification.
enum NutriScoreCategory2023 implements _NutriScoreCategory {
  general,
  cheese,
  redMeatProduct,
  fatOilNutsSeeds,
  beverage,
  water,
}

/// Nutri-Score letter grades: `A` (best) to `E` (worst).
///
/// Implements [OffTagged] to support conversion from tags.
enum NutriScoreGrade implements OffTagged {
  a,
  b,
  c,
  d,
  e;

  @override
  String get offTag => name;
}

/// Represents one of three mutually exclusive Nutri-Score states.
enum NutriScoreStatus { computed, notApplicable, unknown }

/// Abstract base class for Nutri-Score models (e.g. 2021, 2023).
///
/// Provides common properties and logic for representing Nutri-Score data
/// in a version-agnostic, structured way. Subclasses enforce version-specific
/// category types.
///
/// This model ensures:
/// - Grades are normalized from tags (`a`–`e`)
/// - Categories are only available when `categoryAvailable` is `true`
/// - Semantic helpers like `isComputed` and `isApplicable` are provided
abstract class NutriScore {
  /// The Nutri-Score grade (`A`–`E`), or `null` if unavailable.
  final NutriScoreGrade? grade;

  /// The raw numeric score used to derive the grade.
  final int? score;

  /// The version-specific food category used to evaluate the Nutri-Score.
  final _NutriScoreCategory? category;

  /// Specifies the product's category for which the Nutri-Score is not applicable.
  final String? notApplicableCategory;

  /// Indicates whether the category required to compute the Nutri-Score is available.
  final bool categoryAvailable;

  /// Indicates whether the nutrients required to compute the Nutri-Score are available.
  final bool nutrientsAvailable;

  /// Constructs a [NutriScore] model from raw data and enforces valid semantics.
  ///
  /// - If `categoryAvailable` is false, `category` will be set to `null`.
  /// - Grade tags are parsed to `NutriScoreGrade` (`A`-`E`) via [OffTagged].
  NutriScore({
    String? grade,
    _NutriScoreCategory? category,
    this.score,
    this.notApplicableCategory,
    this.categoryAvailable = false,
    this.nutrientsAvailable = false,
  })  : grade = OffTagged.fromOffTag(grade, NutriScoreGrade.values)
            as NutriScoreGrade?,
        category = categoryAvailable ? category : null;

  /// Returns the current Nutri-Score status, one of three mutually exclusive states.
  ///
  /// - `notApplicable`: Nutri-Score is not applicable to the product
  ///   (see [notApplicableCategory]).
  /// - `computed`: Nutri-Score has been computed; [grade] and [score] are available.
  /// - `unknown`: Nutri-Score cannot be computed due to missing data
  ///   (see [categoryAvailable] and [nutrientsAvailable]).
  ///
  /// Note: In the raw JSON, the `grade` field conflates status and actual grades,
  /// using values `'unknown'`, `'not-applicable'`, and `'a'`–`'e'`.
  NutriScoreStatus get status {
    if (notApplicableCategory != null) return NutriScoreStatus.notApplicable;
    if (grade != null) return NutriScoreStatus.computed;
    return NutriScoreStatus.unknown;
  }
}

/// Nutri-Score domain model for the 2021 specification.
///
/// Accepts only [NutriScoreCategory2021] categories.
class NutriScore2021 extends NutriScore {
  NutriScore2021({
    NutriScoreCategory2021? category,
    super.grade,
    super.score,
    super.notApplicableCategory,
    super.categoryAvailable,
    super.nutrientsAvailable,
  }) : super(category: category);

  @override
  NutriScoreCategory2021? get category =>
      super.category as NutriScoreCategory2021?;
}

/// Nutri-Score domain model for the 2023 specification.
///
/// Accepts only [NutriScoreCategory2023] categories.
class NutriScore2023 extends NutriScore {
  NutriScore2023({
    NutriScoreCategory2023? category,
    super.grade,
    super.score,
    super.notApplicableCategory,
    super.categoryAvailable,
    super.nutrientsAvailable,
  }) : super(category: category);

  @override
  NutriScoreCategory2023? get category =>
      super.category as NutriScoreCategory2023?;
}
