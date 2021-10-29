// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Insight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsightsResult _$InsightsResultFromJson(Map<String, dynamic> json) =>
    InsightsResult(
      status: json['status'] as String?,
      insights: Insight.fromJson(json['insights']),
    );

Map<String, dynamic> _$InsightsResultToJson(InsightsResult instance) {
  final val = <String, dynamic>{
    'status': instance.status,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('insights', Insight.toJson(instance.insights));
  return val;
}
