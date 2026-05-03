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

  static String getUserWikiTag(final String userId) =>
      '${userId.substring(0, 1).toUpperCase()}${userId.substring(1)}';

  static String getUserWikiPage(final String userId) => Uri(
    scheme: 'https',
    host: 'wiki.openfoodfacts.org',
    path: 'User:${getUserWikiTag(userId)}',
  ).toString();

  /// Link to add a discussion topic on the OpenFoodFacts wiki page of a user.
  static String getUserWikiDiscussionPage(final String userId) => Uri(
    scheme: 'https',
    host: 'wiki.openfoodfacts.org',
    path: 'index.php',
    queryParameters: {
      'title': 'User_talk:${getUserWikiTag(userId)}',
      'action': 'edit',
      'section': 'new',
    },
  ).toString();
}
