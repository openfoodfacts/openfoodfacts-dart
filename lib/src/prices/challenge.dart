import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';
import '../utils/json_helper.dart';
import 'location.dart';

part 'challenge.g.dart';

/// Challenge object in the Prices API.
///
/// cf. `Challenge` in https://prices.openfoodfacts.org/api/docs
@JsonSerializable()
class Challenge extends JsonObject {
  @JsonKey()
  int? id;

  @JsonKey()
  List<Location>? locations;

  @JsonKey()
  String? status;

  @JsonKey()
  String? tag;

  @JsonKey()
  String? title;

  @JsonKey()
  String? icon;

  @JsonKey()
  String? subtitle;

  @JsonKey(name: 'start_date', fromJson: JsonHelper.stringTimestampToDate)
  DateTime? startDate;

  @JsonKey(name: 'end_date', fromJson: JsonHelper.stringTimestampToDate)
  DateTime? endDate;

  @JsonKey()
  List<String>? categories;

  @JsonKey(name: 'example_proof_url')
  String? exampleProofUrl;

  @JsonKey(name: 'is_published')
  bool? isPublished;

  @JsonKey()
  dynamic stats;

  @JsonKey(fromJson: JsonHelper.stringTimestampToDate)
  DateTime? created;

  @JsonKey(fromJson: JsonHelper.nullableStringTimestampToDate)
  DateTime? updated;

  Challenge();

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChallengeToJson(this);
}
