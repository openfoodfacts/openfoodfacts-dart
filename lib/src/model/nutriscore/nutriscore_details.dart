import 'package:json_annotation/json_annotation.dart';
import '../../interface/json_object.dart';
import 'nutriscore_detail_2021.dart';
import 'nutriscore_detail_2023.dart';
import 'nutriscore.dart';

part 'nutriscore_details.g.dart';

/// Container for Nutri-Score data from both 2021 and 2023 versions, as received from the API.
///
/// This class includes:
/// - The raw deserialized data for each version (`rawNutriScore2021`, `rawNutriScore2023`)
/// - Strongly typed domain models (`nutriScore2021`, `nutriScore2023`) derived from the raw data
///
/// While the raw data reflects the exact API structure, it is recommended to use
/// the domain models in application logic, as they provide a cleaner, validated,
/// and version-specific representation of Nutri-Score values.
@JsonSerializable(explicitToJson: true)
class NutriScoreDetails extends JsonObject {
  @JsonKey(name: '2021')
  NutriScoreDetail2021? rawNutriScore2021;

  @JsonKey(name: '2023')
  NutriScoreDetail2023? rawNutriScore2023;

  NutriScoreDetails();

  /// Returns a strongly typed domain model specific to Nutri-Score 2021.
  ///
  /// Ensures that only valid 2021-specific categories and values are used.
  /// Returns `null` if no raw data is available.
  NutriScore2021? get nutriScore2021 {
    if (rawNutriScore2021 == null) return null;

    return NutriScore2021(
      category: rawNutriScore2021?.data?.category,
      grade: rawNutriScore2021?.grade,
      score: rawNutriScore2021?.score,
      notApplicableCategory: rawNutriScore2021?.notApplicableCategory,
      categoryAvailable: rawNutriScore2021?.categoryAvailable ?? false,
      nutrientsAvailable: rawNutriScore2021?.nutrientsAvailable ?? false,
    );
  }

  /// Returns a strongly typed domain model specific to Nutri-Score 2023.
  ///
  /// Ensures that only valid 2023-specific categories and values are used.
  /// Returns `null` if no raw data is available.
  NutriScore2023? get nutriScore2023 {
    if (rawNutriScore2023 == null) return null;

    return NutriScore2023(
      category: rawNutriScore2023?.data?.category,
      grade: rawNutriScore2023?.grade,
      score: rawNutriScore2023?.score,
      notApplicableCategory: rawNutriScore2023?.notApplicableCategory,
      categoryAvailable: rawNutriScore2023?.categoryAvailable ?? false,
      nutrientsAvailable: rawNutriScore2023?.nutrientsAvailable ?? false,
    );
  }

  factory NutriScoreDetails.fromJson(Map<String, dynamic> json) =>
      _$NutriScoreDetailsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NutriScoreDetailsToJson(this);
}
