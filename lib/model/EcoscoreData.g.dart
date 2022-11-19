// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EcoscoreData.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EcoscoreDataCWProxy {
  EcoscoreData adjustments(EcoscoreAdjustments? adjustments);

  EcoscoreData agribalyse(Agribalyse? agribalyse);

  EcoscoreData grade(String? grade);

  EcoscoreData missingDataWarning(bool missingDataWarning);

  EcoscoreData score(double? score);

  EcoscoreData status(EcoscoreStatus? status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EcoscoreData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EcoscoreData(...).copyWith(id: 12, name: "My name")
  /// ````
  EcoscoreData call({
    EcoscoreAdjustments? adjustments,
    Agribalyse? agribalyse,
    String? grade,
    bool? missingDataWarning,
    double? score,
    EcoscoreStatus? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEcoscoreData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEcoscoreData.copyWith.fieldName(...)`
class _$EcoscoreDataCWProxyImpl implements _$EcoscoreDataCWProxy {
  final EcoscoreData _value;

  const _$EcoscoreDataCWProxyImpl(this._value);

  @override
  EcoscoreData adjustments(EcoscoreAdjustments? adjustments) =>
      this(adjustments: adjustments);

  @override
  EcoscoreData agribalyse(Agribalyse? agribalyse) =>
      this(agribalyse: agribalyse);

  @override
  EcoscoreData grade(String? grade) => this(grade: grade);

  @override
  EcoscoreData missingDataWarning(bool missingDataWarning) =>
      this(missingDataWarning: missingDataWarning);

  @override
  EcoscoreData score(double? score) => this(score: score);

  @override
  EcoscoreData status(EcoscoreStatus? status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EcoscoreData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EcoscoreData(...).copyWith(id: 12, name: "My name")
  /// ````
  EcoscoreData call({
    Object? adjustments = const $CopyWithPlaceholder(),
    Object? agribalyse = const $CopyWithPlaceholder(),
    Object? grade = const $CopyWithPlaceholder(),
    Object? missingDataWarning = const $CopyWithPlaceholder(),
    Object? score = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return EcoscoreData(
      adjustments: adjustments == const $CopyWithPlaceholder()
          ? _value.adjustments
          // ignore: cast_nullable_to_non_nullable
          : adjustments as EcoscoreAdjustments?,
      agribalyse: agribalyse == const $CopyWithPlaceholder()
          ? _value.agribalyse
          // ignore: cast_nullable_to_non_nullable
          : agribalyse as Agribalyse?,
      grade: grade == const $CopyWithPlaceholder()
          ? _value.grade
          // ignore: cast_nullable_to_non_nullable
          : grade as String?,
      missingDataWarning: missingDataWarning == const $CopyWithPlaceholder() ||
              missingDataWarning == null
          ? _value.missingDataWarning
          // ignore: cast_nullable_to_non_nullable
          : missingDataWarning as bool,
      score: score == const $CopyWithPlaceholder()
          ? _value.score
          // ignore: cast_nullable_to_non_nullable
          : score as double?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as EcoscoreStatus?,
    );
  }
}

extension $EcoscoreDataCopyWith on EcoscoreData {
  /// Returns a callable class that can be used as follows: `instanceOfEcoscoreData.copyWith(...)` or like so:`instanceOfEcoscoreData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EcoscoreDataCWProxy get copyWith => _$EcoscoreDataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcoscoreData _$EcoscoreDataFromJson(Map<String, dynamic> json) => EcoscoreData(
      grade: json['grade'] as String?,
      score: JsonObject.parseDouble(json['score']),
      status: $enumDecodeNullable(_$EcoscoreStatusEnumMap, json['status']),
      agribalyse: json['agribalyse'] == null
          ? null
          : Agribalyse.fromJson(json['agribalyse'] as Map<String, dynamic>),
      adjustments: json['adjustments'] == null
          ? null
          : EcoscoreAdjustments.fromJson(
              json['adjustments'] as Map<String, dynamic>),
      missingDataWarning: json['missing_data_warning'] == null
          ? false
          : JsonObject.parseBool(json['missing_data_warning']),
    );

Map<String, dynamic> _$EcoscoreDataToJson(EcoscoreData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('grade', instance.grade);
  writeNotNull('score', instance.score);
  writeNotNull('status', _$EcoscoreStatusEnumMap[instance.status]);
  writeNotNull('agribalyse', instance.agribalyse?.toJson());
  writeNotNull('adjustments', instance.adjustments?.toJson());
  val['missing_data_warning'] = instance.missingDataWarning;
  return val;
}

const _$EcoscoreStatusEnumMap = {
  EcoscoreStatus.KNOWN: 'known',
  EcoscoreStatus.UNKNOWN: 'unknown',
};
