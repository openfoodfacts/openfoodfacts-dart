// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutriscore_detail_2023.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutriScoreDetail2023 _$NutriScoreDetail2023FromJson(
        Map<String, dynamic> json) =>
    NutriScoreDetail2023()
      ..grade = json['grade'] as String?
      ..score = (json['score'] as num?)?.toInt()
      ..data = json['data'] == null
          ? null
          : NutriScoreData2023.fromJson(json['data'] as Map<String, dynamic>)
      ..notApplicableCategory = json['not_applicable_category'] as String?
      ..categoryAvailable = JsonHelper.boolFromJSON(json['category_available'])
      ..nutrientsAvailable =
          JsonHelper.boolFromJSON(json['nutrients_available'])
      ..nutriScoreApplicable =
          JsonHelper.boolFromJSON(json['nutriscore_applicable'])
      ..nutriScoreComputed =
          JsonHelper.boolFromJSON(json['nutriscore_computed']);

Map<String, dynamic> _$NutriScoreDetail2023ToJson(
        NutriScoreDetail2023 instance) =>
    <String, dynamic>{
      'grade': instance.grade,
      'score': instance.score,
      'data': instance.data?.toJson(),
      'not_applicable_category': instance.notApplicableCategory,
      'category_available': JsonHelper.boolToJSON(instance.categoryAvailable),
      'nutrients_available': JsonHelper.boolToJSON(instance.nutrientsAvailable),
      'nutriscore_applicable':
          JsonHelper.boolToJSON(instance.nutriScoreApplicable),
      'nutriscore_computed': JsonHelper.boolToJSON(instance.nutriScoreComputed),
    };
