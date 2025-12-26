import 'package:json_annotation/json_annotation.dart';
import '../../interface/json_object.dart';
import 'nutriscore_detail_2021.dart';
import 'nutriscore_detail_2023.dart';

part 'nutriscore_details.g.dart';

/// Container for Nutri-Score data from both 2021 and 2023 versions, as received from the API.
@JsonSerializable(explicitToJson: true)
class NutriScoreDetails extends JsonObject {
  @JsonKey(name: '2021')
  NutriScoreDetail2021? v2021;

  @JsonKey(name: '2023')
  NutriScoreDetail2023? v2023;

  NutriScoreDetails();

  factory NutriScoreDetails.fromJson(Map<String, dynamic> json) =>
      _$NutriScoreDetailsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NutriScoreDetailsToJson(this);

  static Map<String, dynamic>? toJsonMap(NutriScoreDetails? v) => v?.toJson();
}
