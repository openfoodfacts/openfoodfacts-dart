import 'package:json_annotation/json_annotation.dart';
import '../../interface/json_object.dart';
import 'nutriscore_detail_2021.dart';
import 'nutriscore_detail_2023.dart';

part 'nutriscore_details.g.dart';

/// NutriScore detailed info.
@JsonSerializable()
class NutriScoreDetails extends JsonObject {
  @JsonKey(name: '2021')
  NutriScoreDetail2021? nutriScore2021;

  @JsonKey(name: '2023')
  NutriScoreDetail2023? nutriScore2023;

  NutriScoreDetails();

  factory NutriScoreDetails.fromJson(Map<String, dynamic> json) =>
      _$NutriScoreDetailsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NutriScoreDetailsToJson(this);
}
