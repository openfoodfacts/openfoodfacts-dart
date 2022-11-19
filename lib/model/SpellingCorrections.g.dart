// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpellingCorrections.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TermCorrectionsCWProxy {
  TermCorrections corrections(List<Correction>? corrections);

  TermCorrections score(double? score);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TermCorrections(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TermCorrections(...).copyWith(id: 12, name: "My name")
  /// ````
  TermCorrections call({
    List<Correction>? corrections,
    double? score,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTermCorrections.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTermCorrections.copyWith.fieldName(...)`
class _$TermCorrectionsCWProxyImpl implements _$TermCorrectionsCWProxy {
  final TermCorrections _value;

  const _$TermCorrectionsCWProxyImpl(this._value);

  @override
  TermCorrections corrections(List<Correction>? corrections) =>
      this(corrections: corrections);

  @override
  TermCorrections score(double? score) => this(score: score);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TermCorrections(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TermCorrections(...).copyWith(id: 12, name: "My name")
  /// ````
  TermCorrections call({
    Object? corrections = const $CopyWithPlaceholder(),
    Object? score = const $CopyWithPlaceholder(),
  }) {
    return TermCorrections(
      corrections: corrections == const $CopyWithPlaceholder()
          ? _value.corrections
          // ignore: cast_nullable_to_non_nullable
          : corrections as List<Correction>?,
      score: score == const $CopyWithPlaceholder()
          ? _value.score
          // ignore: cast_nullable_to_non_nullable
          : score as double?,
    );
  }
}

extension $TermCorrectionsCopyWith on TermCorrections {
  /// Returns a callable class that can be used as follows: `instanceOfTermCorrections.copyWith(...)` or like so:`instanceOfTermCorrections.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TermCorrectionsCWProxy get copyWith => _$TermCorrectionsCWProxyImpl(this);
}

abstract class _$CorrectionCWProxy {
  Correction correction(String? correction);

  Correction endOffset(int? endOffset);

  Correction isValid(bool? isValid);

  Correction original(String? original);

  Correction startOffset(int? startOffset);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Correction(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Correction(...).copyWith(id: 12, name: "My name")
  /// ````
  Correction call({
    String? correction,
    int? endOffset,
    bool? isValid,
    String? original,
    int? startOffset,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCorrection.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCorrection.copyWith.fieldName(...)`
class _$CorrectionCWProxyImpl implements _$CorrectionCWProxy {
  final Correction _value;

  const _$CorrectionCWProxyImpl(this._value);

  @override
  Correction correction(String? correction) => this(correction: correction);

  @override
  Correction endOffset(int? endOffset) => this(endOffset: endOffset);

  @override
  Correction isValid(bool? isValid) => this(isValid: isValid);

  @override
  Correction original(String? original) => this(original: original);

  @override
  Correction startOffset(int? startOffset) => this(startOffset: startOffset);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Correction(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Correction(...).copyWith(id: 12, name: "My name")
  /// ````
  Correction call({
    Object? correction = const $CopyWithPlaceholder(),
    Object? endOffset = const $CopyWithPlaceholder(),
    Object? isValid = const $CopyWithPlaceholder(),
    Object? original = const $CopyWithPlaceholder(),
    Object? startOffset = const $CopyWithPlaceholder(),
  }) {
    return Correction(
      correction: correction == const $CopyWithPlaceholder()
          ? _value.correction
          // ignore: cast_nullable_to_non_nullable
          : correction as String?,
      endOffset: endOffset == const $CopyWithPlaceholder()
          ? _value.endOffset
          // ignore: cast_nullable_to_non_nullable
          : endOffset as int?,
      isValid: isValid == const $CopyWithPlaceholder()
          ? _value.isValid
          // ignore: cast_nullable_to_non_nullable
          : isValid as bool?,
      original: original == const $CopyWithPlaceholder()
          ? _value.original
          // ignore: cast_nullable_to_non_nullable
          : original as String?,
      startOffset: startOffset == const $CopyWithPlaceholder()
          ? _value.startOffset
          // ignore: cast_nullable_to_non_nullable
          : startOffset as int?,
    );
  }
}

extension $CorrectionCopyWith on Correction {
  /// Returns a callable class that can be used as follows: `instanceOfCorrection.copyWith(...)` or like so:`instanceOfCorrection.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CorrectionCWProxy get copyWith => _$CorrectionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpellingCorrection _$SpellingCorrectionFromJson(Map<String, dynamic> json) =>
    SpellingCorrection(
      corrected: json['corrected'] as String?,
      input: json['text'] as String?,
      termCorrections: (json['corrections'] as List<dynamic>?)
          ?.map((e) => TermCorrections.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpellingCorrectionToJson(SpellingCorrection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('corrected', instance.corrected);
  val['text'] = instance.input;
  writeNotNull('corrections', instance.termCorrections);
  return val;
}

TermCorrections _$TermCorrectionsFromJson(Map<String, dynamic> json) =>
    TermCorrections(
      corrections: (json['term_corrections'] as List<dynamic>?)
          ?.map((e) => Correction.fromJson(e as Map<String, dynamic>))
          .toList(),
      score: (json['score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TermCorrectionsToJson(TermCorrections instance) =>
    <String, dynamic>{
      'term_corrections': instance.corrections,
      'score': instance.score,
    };

Correction _$CorrectionFromJson(Map<String, dynamic> json) => Correction(
      correction: json['correction'] as String?,
      original: json['original'] as String?,
      startOffset: json['start_offset'] as int?,
      endOffset: json['end_offset'] as int?,
      isValid: json['is_valid'] as bool?,
    );

Map<String, dynamic> _$CorrectionToJson(Correction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('correction', instance.correction);
  val['original'] = instance.original;
  val['start_offset'] = instance.startOffset;
  val['end_offset'] = instance.endOffset;
  val['is_valid'] = instance.isValid;
  return val;
}
