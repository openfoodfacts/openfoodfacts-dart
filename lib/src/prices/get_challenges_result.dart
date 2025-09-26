import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

import '../interface/json_object.dart';

part 'get_challenges_result.g.dart';

/// List of challenge objects returned by the "get challenges" method.
@JsonSerializable()
class GetChallengesResult extends JsonObject {
  @JsonKey()
  List<Challenge>? items;

  @JsonKey()
  int? total;

  @JsonKey(name: 'page')
  int? pageNumber;

  @JsonKey(name: 'size')
  int? pageSize;

  @JsonKey(name: 'pages')
  int? numberOfPages;

  GetChallengesResult();

  factory GetChallengesResult.fromJson(Map<String, dynamic> json) =>
      _$GetChallengesResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetChallengesResultToJson(this);
}
