import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/interface/JsonObject.dart';

part 'SpellingCorrections.g.dart';

@JsonSerializable()
class SpellingCorrection extends JsonObject {
  @JsonKey(includeIfNull: false)
  String corrected;
  @JsonKey(name: 'text', nullable: false)
  String input;
  @JsonKey(name: 'corrections', includeIfNull: false)
  List<TermCorrections> termCorrections;

  SpellingCorrection(this.corrected, this.input, this.termCorrections);

  factory SpellingCorrection.fromJson(Map<String, dynamic> json) => _$SpellingCorrectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SpellingCorrectionToJson(this);
}

@JsonSerializable()
class TermCorrections extends JsonObject {
  @JsonKey(name: "term_corrections")
  List<Correction> corrections;
  @JsonKey()
  double score;

  TermCorrections(this.corrections, this.score);

  factory TermCorrections.fromJson(Map<String, dynamic> json) =>
      _$TermCorrectionsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TermCorrectionsToJson(this);
}

@JsonSerializable()
class Correction extends JsonObject {
  @JsonKey(includeIfNull: false)
  String correction;
  @JsonKey(nullable: false)
  String original;
  @JsonKey(name: 'start_offset')
  int startOffset;
  @JsonKey(name: 'end_offset')
  int endOffset;
  @JsonKey(name: 'is_valid')
  bool isValid;

  Correction(this.correction, this.original, this.startOffset, this.endOffset, this.isValid);

  factory Correction.fromJson(Map<String, dynamic> json) =>
      _$CorrectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CorrectionToJson(this);
}