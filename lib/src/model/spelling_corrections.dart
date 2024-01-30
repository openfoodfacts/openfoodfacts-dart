import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';

part 'spelling_corrections.g.dart';

@JsonSerializable()
class SpellingCorrection extends JsonObject {
  @JsonKey(includeIfNull: false)
  String? corrected;
  @JsonKey(name: 'text')
  String? input;
  @JsonKey(name: 'corrections', includeIfNull: false)
  List<TermCorrections>? termCorrections;

  SpellingCorrection(this.corrected, this.input, this.termCorrections);

  factory SpellingCorrection.fromJson(Map<String, dynamic> json) =>
      _$SpellingCorrectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SpellingCorrectionToJson(this);
}

@JsonSerializable()
class TermCorrections extends JsonObject {
  @JsonKey(name: 'term_corrections')
  List<Correction>? corrections;
  @JsonKey()
  double? score;

  TermCorrections(this.corrections, this.score);

  factory TermCorrections.fromJson(Map<String, dynamic> json) =>
      _$TermCorrectionsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TermCorrectionsToJson(this);

  TermCorrections copyWith({
    List<Correction>? corrections,
    double? score,
  }) {
    return TermCorrections(
      corrections ?? this.corrections,
      score ?? this.score,
    );
  }
}

@JsonSerializable()
class Correction extends JsonObject {
  @JsonKey(includeIfNull: false)
  String? correction;
  @JsonKey()
  String? original;
  @JsonKey(name: 'start_offset')
  int? startOffset;
  @JsonKey(name: 'end_offset')
  int? endOffset;
  @JsonKey(name: 'is_valid')
  bool? isValid;

  Correction(this.correction, this.original, this.startOffset, this.endOffset,
      this.isValid);

  factory Correction.fromJson(Map<String, dynamic> json) =>
      _$CorrectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CorrectionToJson(this);

  Correction copyWith({
    String? correction,
    String? original,
    int? startOffset,
    int? endOffset,
    bool? isValid,
  }) {
    return Correction(
      correction ?? this.correction,
      original ?? this.original,
      startOffset ?? this.startOffset,
      endOffset ?? this.endOffset,
      isValid ?? this.isValid,
    );
  }
}
