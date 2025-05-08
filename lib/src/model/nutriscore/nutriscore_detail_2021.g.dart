// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutriscore_detail_2021.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutriScoreDetail2021 _$NutriScoreDetail2021FromJson(
        Map<String, dynamic> json) =>
    NutriScoreDetail2021()
      ..grade = $enumDecodeNullable(_$NutriScoreGradeEnumMap, json['grade'])
      ..score = (json['score'] as num?)?.toInt()
      ..data = json['data'] == null
          ? null
          : NutriScoreData2021.fromJson(json['data'] as Map<String, dynamic>)
      ..notApplicableCategory = json['not_applicable_category'] as String?
      ..categoryAvailable = JsonHelper.boolFromJSON(json['category_available'])
      ..nutrientsAvailable =
          JsonHelper.boolFromJSON(json['nutrients_available'])
      ..nutriScoreApplicable =
          JsonHelper.boolFromJSON(json['nutriscore_applicable'])
      ..nutriScoreComputed =
          JsonHelper.boolFromJSON(json['nutriscore_computed']);

Map<String, dynamic> _$NutriScoreDetail2021ToJson(
        NutriScoreDetail2021 instance) =>
    <String, dynamic>{
      'grade': _$NutriScoreGradeEnumMap[instance.grade],
      'score': instance.score,
      'data': instance.data,
      'not_applicable_category': instance.notApplicableCategory,
      'category_available': JsonHelper.boolToJSON(instance.categoryAvailable),
      'nutrients_available': JsonHelper.boolToJSON(instance.nutrientsAvailable),
      'nutriscore_applicable':
          JsonHelper.boolToJSON(instance.nutriScoreApplicable),
      'nutriscore_computed': JsonHelper.boolToJSON(instance.nutriScoreComputed),
    };

const _$NutriScoreGradeEnumMap = {
  NutriScoreGrade.a: 'a',
  NutriScoreGrade.b: 'b',
  NutriScoreGrade.c: 'c',
  NutriScoreGrade.d: 'd',
  NutriScoreGrade.e: 'e',
  NutriScoreGrade.notApplicable: 'not-applicable',
};
