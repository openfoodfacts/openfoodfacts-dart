import 'package:json_annotation/json_annotation.dart';
import '../../interface/json_object.dart';
import '../../utils/json_helper.dart';
import 'nutriscore_data_2021.dart';

part 'nutriscore_detail_2021.g.dart';

/// Data of NutriScore version 2021.
@JsonSerializable(explicitToJson: true)
class NutriScoreDetail2021 extends JsonObject {
  @JsonKey()
  String? grade;

  @JsonKey()
  int? score;

  @JsonKey()
  NutriScoreData2021? data;

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

  NutriScoreDetail2021();

  factory NutriScoreDetail2021.fromJson(Map<String, dynamic> json) =>
      _$NutriScoreDetail2021FromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NutriScoreDetail2021ToJson(this);
}
