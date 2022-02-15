// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LeaderboardEntry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaderboardEntry _$LeaderboardEntryFromJson(Map<String, dynamic> json) =>
    LeaderboardEntry(
      score: json['score'] as int,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$LeaderboardEntryToJson(LeaderboardEntry instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'score': instance.score,
    };
