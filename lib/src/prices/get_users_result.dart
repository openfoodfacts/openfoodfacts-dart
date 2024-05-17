import 'package:json_annotation/json_annotation.dart';

import 'price_user.dart';
import '../interface/json_object.dart';

part 'get_users_result.g.dart';

/// List of price user objects returned by the "get users" method.
@JsonSerializable()
class GetUsersResult extends JsonObject {
  @JsonKey()
  List<PriceUser>? items;

  @JsonKey()
  int? total;

  @JsonKey(name: 'page')
  int? pageNumber;

  @JsonKey(name: 'size')
  int? pageSize;

  @JsonKey(name: 'pages')
  int? numberOfPages;

  GetUsersResult();

  factory GetUsersResult.fromJson(Map<String, dynamic> json) =>
      _$GetUsersResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetUsersResultToJson(this);
}
