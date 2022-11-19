// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchResult.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SearchResultCWProxy {
  SearchResult count(int? count);

  SearchResult page(int? page);

  SearchResult pageSize(int? pageSize);

  SearchResult products(List<Product>? products);

  SearchResult skip(int? skip);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchResult(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchResult call({
    int? count,
    int? page,
    int? pageSize,
    List<Product>? products,
    int? skip,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSearchResult.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSearchResult.copyWith.fieldName(...)`
class _$SearchResultCWProxyImpl implements _$SearchResultCWProxy {
  final SearchResult _value;

  const _$SearchResultCWProxyImpl(this._value);

  @override
  SearchResult count(int? count) => this(count: count);

  @override
  SearchResult page(int? page) => this(page: page);

  @override
  SearchResult pageSize(int? pageSize) => this(pageSize: pageSize);

  @override
  SearchResult products(List<Product>? products) => this(products: products);

  @override
  SearchResult skip(int? skip) => this(skip: skip);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchResult(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchResult call({
    Object? count = const $CopyWithPlaceholder(),
    Object? page = const $CopyWithPlaceholder(),
    Object? pageSize = const $CopyWithPlaceholder(),
    Object? products = const $CopyWithPlaceholder(),
    Object? skip = const $CopyWithPlaceholder(),
  }) {
    return SearchResult(
      count: count == const $CopyWithPlaceholder()
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int?,
      page: page == const $CopyWithPlaceholder()
          ? _value.page
          // ignore: cast_nullable_to_non_nullable
          : page as int?,
      pageSize: pageSize == const $CopyWithPlaceholder()
          ? _value.pageSize
          // ignore: cast_nullable_to_non_nullable
          : pageSize as int?,
      products: products == const $CopyWithPlaceholder()
          ? _value.products
          // ignore: cast_nullable_to_non_nullable
          : products as List<Product>?,
      skip: skip == const $CopyWithPlaceholder()
          ? _value.skip
          // ignore: cast_nullable_to_non_nullable
          : skip as int?,
    );
  }
}

extension $SearchResultCopyWith on SearchResult {
  /// Returns a callable class that can be used as follows: `instanceOfSearchResult.copyWith(...)` or like so:`instanceOfSearchResult.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SearchResultCWProxy get copyWith => _$SearchResultCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) => SearchResult(
      page: JsonObject.parseInt(json['page']),
      pageSize: JsonObject.parseInt(json['page_size']),
      count: JsonObject.parseInt(json['count']),
      skip: JsonObject.parseInt(json['skip']),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResultToJson(SearchResult instance) {
  final val = <String, dynamic>{
    'page': instance.page,
    'page_size': instance.pageSize,
    'count': instance.count,
    'skip': instance.skip,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('products', instance.products);
  return val;
}
