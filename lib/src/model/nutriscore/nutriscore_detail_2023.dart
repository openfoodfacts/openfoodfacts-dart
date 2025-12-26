import 'package:json_annotation/json_annotation.dart';
import '../../interface/json_object.dart';
import '../../utils/json_helper.dart';
import 'nutriscore_data_2023.dart';

part 'nutriscore_detail_2023.g.dart';

/// Data of Nutri-Score version 2023.
@JsonSerializable(explicitToJson: true)
class NutriScoreDetail2023 extends JsonObject {
  @JsonKey()
  String? grade;

  @JsonKey()
  int? score;

  @JsonKey()
  NutriScoreData2023? data;

  @JsonKey(name: 'not_applicable_category')
  String? notApplicableCategory;

  @JsonKey(
    name: 'category_available',
    toJson: JsonHelper.boolToJSON,
    fromJson: JsonHelper.boolFromJSON,
  )
  bool? categoryAvailable;

  @JsonKey(
    name: 'nutrients_available',
    toJson: JsonHelper.boolToJSON,
    fromJson: JsonHelper.boolFromJSON,
  )
  bool? nutrientsAvailable;

  @JsonKey(
    name: 'nutriscore_applicable',
    toJson: JsonHelper.boolToJSON,
    fromJson: JsonHelper.boolFromJSON,
  )
  bool? nutriScoreApplicable;

  @JsonKey(
    name: 'nutriscore_computed',
    toJson: JsonHelper.boolToJSON,
    fromJson: JsonHelper.boolFromJSON,
  )
  bool? nutriScoreComputed;

  NutriScoreDetail2023();

  factory NutriScoreDetail2023.fromJson(Map<String, dynamic> json) =>
      _$NutriScoreDetail2023FromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NutriScoreDetail2023ToJson(this);
}
