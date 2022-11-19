// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LeaderboardEntry.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LeaderboardEntryCWProxy {
  LeaderboardEntry score(int score);

  LeaderboardEntry userId(String? userId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LeaderboardEntry(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LeaderboardEntry(...).copyWith(id: 12, name: "My name")
  /// ````
  LeaderboardEntry call({
    int? score,
    String? userId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLeaderboardEntry.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLeaderboardEntry.copyWith.fieldName(...)`
class _$LeaderboardEntryCWProxyImpl implements _$LeaderboardEntryCWProxy {
  final LeaderboardEntry _value;

  const _$LeaderboardEntryCWProxyImpl(this._value);

  @override
  LeaderboardEntry score(int score) => this(score: score);

  @override
  LeaderboardEntry userId(String? userId) => this(userId: userId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LeaderboardEntry(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LeaderboardEntry(...).copyWith(id: 12, name: "My name")
  /// ````
  LeaderboardEntry call({
    Object? score = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
  }) {
    return LeaderboardEntry(
      score: score == const $CopyWithPlaceholder() || score == null
          ? _value.score
          // ignore: cast_nullable_to_non_nullable
          : score as int,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String?,
    );
  }
}

extension $LeaderboardEntryCopyWith on LeaderboardEntry {
  /// Returns a callable class that can be used as follows: `instanceOfLeaderboardEntry.copyWith(...)` or like so:`instanceOfLeaderboardEntry.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LeaderboardEntryCWProxy get copyWith => _$LeaderboardEntryCWProxyImpl(this);
}

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
