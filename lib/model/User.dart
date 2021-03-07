import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'User.g.dart';

@JsonSerializable()
class User extends JsonObject {
  @JsonKey(includeIfNull: false)
  final String? comment;

  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey()
  final String? password;

  const User({this.userId, this.password, this.comment});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
