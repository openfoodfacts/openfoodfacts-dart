// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Status.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StatusCWProxy {
  Status body(String? body);

  Status error(String? error);

  Status imageId(int? imageId);

  Status status(dynamic status);

  Status statusVerbose(String? statusVerbose);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Status(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Status(...).copyWith(id: 12, name: "My name")
  /// ````
  Status call({
    String? body,
    String? error,
    int? imageId,
    dynamic? status,
    String? statusVerbose,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStatus.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStatus.copyWith.fieldName(...)`
class _$StatusCWProxyImpl implements _$StatusCWProxy {
  final Status _value;

  const _$StatusCWProxyImpl(this._value);

  @override
  Status body(String? body) => this(body: body);

  @override
  Status error(String? error) => this(error: error);

  @override
  Status imageId(int? imageId) => this(imageId: imageId);

  @override
  Status status(dynamic status) => this(status: status);

  @override
  Status statusVerbose(String? statusVerbose) =>
      this(statusVerbose: statusVerbose);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Status(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Status(...).copyWith(id: 12, name: "My name")
  /// ````
  Status call({
    Object? body = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? imageId = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? statusVerbose = const $CopyWithPlaceholder(),
  }) {
    return Status(
      body: body == const $CopyWithPlaceholder()
          ? _value.body
          // ignore: cast_nullable_to_non_nullable
          : body as String?,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as String?,
      imageId: imageId == const $CopyWithPlaceholder()
          ? _value.imageId
          // ignore: cast_nullable_to_non_nullable
          : imageId as int?,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as dynamic,
      statusVerbose: statusVerbose == const $CopyWithPlaceholder()
          ? _value.statusVerbose
          // ignore: cast_nullable_to_non_nullable
          : statusVerbose as String?,
    );
  }
}

extension $StatusCopyWith on Status {
  /// Returns a callable class that can be used as follows: `instanceOfStatus.copyWith(...)` or like so:`instanceOfStatus.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StatusCWProxy get copyWith => _$StatusCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      status: json['status'],
      statusVerbose: json['status_verbose'] as String?,
      body: json['body'] as String?,
      error: json['error'] as String?,
      imageId: JsonObject.parseInt(json['imgid']),
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'status': instance.status,
      'status_verbose': instance.statusVerbose,
      'body': instance.body,
      'error': instance.error,
      'imgid': instance.imageId,
    };
