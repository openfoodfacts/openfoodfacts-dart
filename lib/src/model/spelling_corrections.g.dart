// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spelling_corrections.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpellingCorrection _$SpellingCorrectionFromJson(Map<String, dynamic> json) =>
    SpellingCorrection(
      json['corrected'] as String?,
      json['text'] as String?,
      (json['corrections'] as List<dynamic>?)
          ?.map((e) => TermCorrections.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpellingCorrectionToJson(SpellingCorrection instance) =>
    <String, dynamic>{
      if (instance.corrected case final value?) 'corrected': value,
      'text': instance.input,
      if (instance.termCorrections case final value?) 'corrections': value,
    };

TermCorrections _$TermCorrectionsFromJson(Map<String, dynamic> json) =>
    TermCorrections(
      (json['term_corrections'] as List<dynamic>?)
          ?.map((e) => Correction.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TermCorrectionsToJson(TermCorrections instance) =>
    <String, dynamic>{
      'term_corrections': instance.corrections,
      'score': instance.score,
    };

Correction _$CorrectionFromJson(Map<String, dynamic> json) => Correction(
  json['correction'] as String?,
  json['original'] as String?,
  (json['start_offset'] as num?)?.toInt(),
  (json['end_offset'] as num?)?.toInt(),
  json['is_valid'] as bool?,
);

Map<String, dynamic> _$CorrectionToJson(Correction instance) =>
    <String, dynamic>{
      if (instance.correction case final value?) 'correction': value,
      'original': instance.original,
      'start_offset': instance.startOffset,
      'end_offset': instance.endOffset,
      'is_valid': instance.isValid,
    };
