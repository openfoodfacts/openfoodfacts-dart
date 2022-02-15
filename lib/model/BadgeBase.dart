import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'BadgeBase.g.dart';

/// Events API: badge.
@JsonSerializable()
class BadgeBase extends JsonObject {
  @JsonKey(name: 'user_id')
  final String? userId;

  @JsonKey(name: 'badge_name')
  final String badgeName;

  @JsonKey()
  final int level;

  BadgeBase({
    required this.badgeName,
    required this.level,
    this.userId,
  });

  factory BadgeBase.fromJson(Map<String, dynamic> json) =>
      _$BadgeBaseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BadgeBaseToJson(this);

  @override
  String toString() => 'BadgeBase(badgeName: $badgeName'
      ', level: $level'
      '${userId == null ? '' : ', userId: $userId'}'
      ')';
}
