import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends JsonObject {
  @JsonKey(includeIfNull: false)
  final String? comment;

  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey()
  final String password;

  final String? cookie;

  const User({
    this.comment,
    required this.userId,
    required this.password,
    this.cookie,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  static String getUserWikiPage(final String userId) => Uri(
        scheme: 'https',
        host: 'wiki.openfoodfacts.org',
        path: 'User:'
            '${userId.substring(0, 1).toUpperCase()}${userId.substring(1)}',
      ).toString();
}
