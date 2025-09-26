// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_challenges_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetChallengesResult _$GetChallengesResultFromJson(Map<String, dynamic> json) =>
    GetChallengesResult()
      ..items = (json['items'] as List<dynamic>?)
          ?.map((e) => Challenge.fromJson(e as Map<String, dynamic>))
          .toList()
      ..total = (json['total'] as num?)?.toInt()
      ..pageNumber = (json['page'] as num?)?.toInt()
      ..pageSize = (json['size'] as num?)?.toInt()
      ..numberOfPages = (json['pages'] as num?)?.toInt();

Map<String, dynamic> _$GetChallengesResultToJson(
        GetChallengesResult instance) =>
    <String, dynamic>{
      'items': instance.items,
      'total': instance.total,
      'page': instance.pageNumber,
      'size': instance.pageSize,
      'pages': instance.numberOfPages,
    };
