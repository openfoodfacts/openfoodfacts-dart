// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_proofs_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProofsResult _$GetProofsResultFromJson(Map<String, dynamic> json) =>
    GetProofsResult()
      ..items = (json['items'] as List<dynamic>?)
          ?.map((e) => Proof.fromJson(e as Map<String, dynamic>))
          .toList()
      ..total = (json['total'] as num?)?.toInt()
      ..pageNumber = (json['page'] as num?)?.toInt()
      ..pageSize = (json['size'] as num?)?.toInt()
      ..numberOfPages = (json['pages'] as num?)?.toInt();

Map<String, dynamic> _$GetProofsResultToJson(GetProofsResult instance) =>
    <String, dynamic>{
      'items': instance.items,
      'total': instance.total,
      'page': instance.pageNumber,
      'size': instance.pageSize,
      'pages': instance.numberOfPages,
    };
