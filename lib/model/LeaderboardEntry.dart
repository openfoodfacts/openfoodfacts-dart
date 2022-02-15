import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'LeaderboardEntry.g.dart';

/// Events API: leaderboard entry.
@JsonSerializable()
class LeaderboardEntry extends JsonObject {
  @JsonKey(name: 'user_id')
  final String? userId;

  @JsonKey()
  final int score;

  LeaderboardEntry({
    required this.score,
    this.userId,
  });

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardEntryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LeaderboardEntryToJson(this);

  @override
  String toString() => 'LeaderboardEntry(score: $score'
      '${userId == null ? ', no user id' : ', userId: $userId'}'
      ')';
}
