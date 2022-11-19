// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Insight.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InsightsResultCWProxy {
  InsightsResult insights(List<Insight>? insights);

  InsightsResult status(String? status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InsightsResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InsightsResult(...).copyWith(id: 12, name: "My name")
  /// ````
  InsightsResult call({
    List<Insight>? insights,
    String? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInsightsResult.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInsightsResult.copyWith.fieldName(...)`
class _$InsightsResultCWProxyImpl implements _$InsightsResultCWProxy {
  final InsightsResult _value;

  const _$InsightsResultCWProxyImpl(this._value);

  @override
  InsightsResult insights(List<Insight>? insights) => this(insights: insights);

  @override
  InsightsResult status(String? status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InsightsResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InsightsResult(...).copyWith(id: 12, name: "My name")
  /// ````
  InsightsResult call({
    Object? insights = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return InsightsResult(
      insights: insights == const $CopyWithPlaceholder()
          ? _value.insights
          // ignore: cast_nullable_to_non_nullable
          : insights as List<Insight>?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String?,
    );
  }
}

extension $InsightsResultCopyWith on InsightsResult {
  /// Returns a callable class that can be used as follows: `instanceOfInsightsResult.copyWith(...)` or like so:`instanceOfInsightsResult.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InsightsResultCWProxy get copyWith => _$InsightsResultCWProxyImpl(this);
}

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
