import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';

part 'leaderboard_entry.g.dart';

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

  LeaderboardEntry copyWith({
    String? userId,
    int? score,
  }) {
    return LeaderboardEntry(
      userId: userId ?? this.userId,
      score: score ?? this.score,
    );
  }
}
