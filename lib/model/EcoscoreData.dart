import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';
import 'EcoscoreAdjustments.dart';

part 'EcoscoreData.g.dart';

enum EcoscoreStatus {
  @JsonValue('known')
  KNOWN,
  @JsonValue('unknown')
  UNKNOWN
}

@JsonSerializable(explicitToJson: true)
class EcoscoreData extends JsonObject {
  @JsonKey(includeIfNull: false)
  String? grade;
  @JsonKey(includeIfNull: false, fromJson: JsonObject.parseDouble)
  double? score;
  @JsonKey(includeIfNull: false)
  EcoscoreStatus? status;
  @JsonKey(includeIfNull: false)
  EcoscoreAdjustments? adjustments;

  EcoscoreData({this.grade, this.score, this.status, this.adjustments});

  factory EcoscoreData.fromJson(Map<String, dynamic> json) =>
      _$EcoscoreDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EcoscoreDataToJson(this);

  static Map<String, dynamic>? toJsonHelper(EcoscoreData? d) =>
      d != null ? d.toJson() : null;
}
