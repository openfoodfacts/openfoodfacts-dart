// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutriscore_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutriScoreDetails _$NutriScoreDetailsFromJson(Map<String, dynamic> json) =>
    NutriScoreDetails()
      ..nutriScore2021 = json['2021'] == null
          ? null
          : NutriScoreDetail2021.fromJson(json['2021'] as Map<String, dynamic>)
      ..nutriScore2023 = json['2023'] == null
          ? null
          : NutriScoreDetail2023.fromJson(json['2023'] as Map<String, dynamic>);

Map<String, dynamic> _$NutriScoreDetailsToJson(NutriScoreDetails instance) =>
    <String, dynamic>{
      '2021': instance.nutriScore2021,
      '2023': instance.nutriScore2023,
    };
