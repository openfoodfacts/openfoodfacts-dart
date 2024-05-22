import 'package:json_annotation/json_annotation.dart';

import 'proof.dart';
import '../interface/json_object.dart';

part 'get_proofs_result.g.dart';

/// List of proof objects returned by the "get proofs" method.
@JsonSerializable()
class GetProofsResult extends JsonObject {
  @JsonKey()
  List<Proof>? items;

  @JsonKey()
  int? total;

  @JsonKey(name: 'page')
  int? pageNumber;

  @JsonKey(name: 'size')
  int? pageSize;

  @JsonKey(name: 'pages')
  int? numberOfPages;

  GetProofsResult();

  factory GetProofsResult.fromJson(Map<String, dynamic> json) =>
      _$GetProofsResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetProofsResultToJson(this);
}
