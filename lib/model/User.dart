import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'User.g.dart';

@JsonSerializable()
class User extends JsonObject {
  @JsonKey(includeIfNull: false)
  final String? comment;
  @JsonKey()
  final String? name;
  @JsonKey()
  final String? email;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey()
  final String password;
  @JsonKey()
  final bool pro;
  @JsonKey()
  final String? requested_org;
  @JsonKey()
  final bool newsletter;

  const User({
    this.comment,
    this.name,
    this.email,
    required this.userId,
    required this.password,
    this.pro = false,
    this.requested_org,
    this.newsletter = true,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
