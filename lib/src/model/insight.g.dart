// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsightsResult _$InsightsResultFromJson(Map<String, dynamic> json) =>
    InsightsResult(
      status: json['status'] as String?,
      insights: Insight.fromJson(json['insights']),
    );

Map<String, dynamic> _$InsightsResultToJson(InsightsResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'insights': Insight.toJson(instance.insights),
    };
