// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) => SearchResult(
      page: JsonObject.parseInt(json['page']),
      pageSize: JsonObject.parseInt(json['page_size']),
      count: JsonObject.parseInt(json['count']),
      pageCount: JsonObject.parseInt(json['page_count']),
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
    'page_count': instance.pageCount,
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
