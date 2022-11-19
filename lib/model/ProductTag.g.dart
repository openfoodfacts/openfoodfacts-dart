// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductTag.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProductTagCWProxy {
  ProductTag barcode(String barcode);

  ProductTag comment(String comment);

  ProductTag editor(String editor);

  ProductTag key(String key);

  ProductTag lastEdit(DateTime lastEdit);

  ProductTag owner(String owner);

  ProductTag value(String value);

  ProductTag version(int version);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductTag(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductTag(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductTag call({
    String? barcode,
    String? comment,
    String? editor,
    String? key,
    DateTime? lastEdit,
    String? owner,
    String? value,
    int? version,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductTag.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProductTag.copyWith.fieldName(...)`
class _$ProductTagCWProxyImpl implements _$ProductTagCWProxy {
  final ProductTag _value;

  const _$ProductTagCWProxyImpl(this._value);

  @override
  ProductTag barcode(String barcode) => this(barcode: barcode);

  @override
  ProductTag comment(String comment) => this(comment: comment);

  @override
  ProductTag editor(String editor) => this(editor: editor);

  @override
  ProductTag key(String key) => this(key: key);

  @override
  ProductTag lastEdit(DateTime lastEdit) => this(lastEdit: lastEdit);

  @override
  ProductTag owner(String owner) => this(owner: owner);

  @override
  ProductTag value(String value) => this(value: value);

  @override
  ProductTag version(int version) => this(version: version);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductTag(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductTag(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductTag call({
    Object? barcode = const $CopyWithPlaceholder(),
    Object? comment = const $CopyWithPlaceholder(),
    Object? editor = const $CopyWithPlaceholder(),
    Object? key = const $CopyWithPlaceholder(),
    Object? lastEdit = const $CopyWithPlaceholder(),
    Object? owner = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
  }) {
    return ProductTag(
      barcode: barcode == const $CopyWithPlaceholder() || barcode == null
          ? _value.barcode
          // ignore: cast_nullable_to_non_nullable
          : barcode as String,
      comment: comment == const $CopyWithPlaceholder() || comment == null
          ? _value.comment
          // ignore: cast_nullable_to_non_nullable
          : comment as String,
      editor: editor == const $CopyWithPlaceholder() || editor == null
          ? _value.editor
          // ignore: cast_nullable_to_non_nullable
          : editor as String,
      key: key == const $CopyWithPlaceholder() || key == null
          ? _value.key
          // ignore: cast_nullable_to_non_nullable
          : key as String,
      lastEdit: lastEdit == const $CopyWithPlaceholder() || lastEdit == null
          ? _value.lastEdit
          // ignore: cast_nullable_to_non_nullable
          : lastEdit as DateTime,
      owner: owner == const $CopyWithPlaceholder() || owner == null
          ? _value.owner
          // ignore: cast_nullable_to_non_nullable
          : owner as String,
      value: value == const $CopyWithPlaceholder() || value == null
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as String,
      version: version == const $CopyWithPlaceholder() || version == null
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as int,
    );
  }
}

extension $ProductTagCopyWith on ProductTag {
  /// Returns a callable class that can be used as follows: `instanceOfProductTag.copyWith(...)` or like so:`instanceOfProductTag.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductTagCWProxy get copyWith => _$ProductTagCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductTag _$ProductTagFromJson(Map<String, dynamic> json) => ProductTag(
      barcode: json['product'] as String,
      key: json['k'] as String,
      value: json['v'] as String,
      owner: json['owner'] as String,
      version: json['version'] as int,
      editor: json['editor'] as String,
      lastEdit: JsonHelper.stringTimestampToDate(json['last_edit']),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$ProductTagToJson(ProductTag instance) =>
    <String, dynamic>{
      'product': instance.barcode,
      'k': instance.key,
      'v': instance.value,
      'owner': instance.owner,
      'version': instance.version,
      'editor': instance.editor,
      'last_edit': instance.lastEdit.toIso8601String(),
      'comment': instance.comment,
    };
