// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpellingCorrections.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpellingCorrection _$SpellingCorrectionFromJson(Map<String, dynamic> json) {
  return SpellingCorrection(
    json['corrected'] as String?,
    json['text'] as String?,
    (json['corrections'] as List<dynamic>?)
        ?.map((e) => TermCorrections.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

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

TermCorrections _$TermCorrectionsFromJson(Map<String, dynamic> json) {
  return TermCorrections(
    (json['term_corrections'] as List<dynamic>?)
        ?.map((e) => Correction.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['score'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$TermCorrectionsToJson(TermCorrections instance) =>
    <String, dynamic>{
      'term_corrections': instance.corrections,
      'score': instance.score,
    };

Correction _$CorrectionFromJson(Map<String, dynamic> json) {
  return Correction(
    json['correction'] as String?,
    json['original'] as String?,
    json['start_offset'] as int?,
    json['end_offset'] as int?,
    json['is_valid'] as bool?,
  );
}

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
