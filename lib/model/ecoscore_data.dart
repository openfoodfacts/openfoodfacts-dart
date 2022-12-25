import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';
import 'agribalyse.dart';
import 'ecoscore_adjustments.dart';

part 'ecoscore_data.g.dart';

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
  Agribalyse? agribalyse;
  @JsonKey(includeIfNull: false)
  EcoscoreAdjustments? adjustments;
  @JsonKey(
    name: 'missing_data_warning',
    fromJson: JsonObject.parseBool,
  )
  bool missingDataWarning;

  EcoscoreData({
    this.grade,
    this.score,
    this.status,
    this.agribalyse,
    this.adjustments,
    this.missingDataWarning = false,
  });

  factory EcoscoreData.fromJson(Map<String, dynamic> json) =>
      _$EcoscoreDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EcoscoreDataToJson(this);

  static Map<String, dynamic>? toJsonHelper(EcoscoreData? d) => d?.toJson();
}
