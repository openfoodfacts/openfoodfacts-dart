// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_single_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutocompleteSingleResult _$AutocompleteSingleResultFromJson(
        Map<String, dynamic> json) =>
    AutocompleteSingleResult(
      id: json['id'] as String,
      text: json['text'] as String,
      taxonomyNameAsString: json['taxonomy_name'] as String,
    );

Map<String, dynamic> _$AutocompleteSingleResultToJson(
        AutocompleteSingleResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'taxonomy_name': instance.taxonomyNameAsString,
    };
