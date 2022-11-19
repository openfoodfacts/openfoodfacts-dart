// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BadgeBase.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BadgeBaseCWProxy {
  BadgeBase badgeName(String badgeName);

  BadgeBase level(int level);

  BadgeBase userId(String? userId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BadgeBase(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BadgeBase(...).copyWith(id: 12, name: "My name")
  /// ````
  BadgeBase call({
    String? badgeName,
    int? level,
    String? userId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBadgeBase.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBadgeBase.copyWith.fieldName(...)`
class _$BadgeBaseCWProxyImpl implements _$BadgeBaseCWProxy {
  final BadgeBase _value;

  const _$BadgeBaseCWProxyImpl(this._value);

  @override
  BadgeBase badgeName(String badgeName) => this(badgeName: badgeName);

  @override
  BadgeBase level(int level) => this(level: level);

  @override
  BadgeBase userId(String? userId) => this(userId: userId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BadgeBase(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BadgeBase(...).copyWith(id: 12, name: "My name")
  /// ````
  BadgeBase call({
    Object? badgeName = const $CopyWithPlaceholder(),
    Object? level = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
  }) {
    return BadgeBase(
      badgeName: badgeName == const $CopyWithPlaceholder() || badgeName == null
          ? _value.badgeName
          // ignore: cast_nullable_to_non_nullable
          : badgeName as String,
      level: level == const $CopyWithPlaceholder() || level == null
          ? _value.level
          // ignore: cast_nullable_to_non_nullable
          : level as int,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String?,
    );
  }
}

extension $BadgeBaseCopyWith on BadgeBase {
  /// Returns a callable class that can be used as follows: `instanceOfBadgeBase.copyWith(...)` or like so:`instanceOfBadgeBase.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BadgeBaseCWProxy get copyWith => _$BadgeBaseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BadgeBase _$BadgeBaseFromJson(Map<String, dynamic> json) => BadgeBase(
      badgeName: json['badge_name'] as String,
      level: json['level'] as int,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$BadgeBaseToJson(BadgeBase instance) => <String, dynamic>{
      'user_id': instance.userId,
      'badge_name': instance.badgeName,
      'level': instance.level,
    };
