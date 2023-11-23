// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutocompleteSearchResult _$AutocompleteSearchResultFromJson(
        Map<String, dynamic> json) =>
    AutocompleteSearchResult(
      took: JsonObject.parseInt(json['took']),
      timedOut: JsonObject.parseBool(json['timed_out']),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) =>
              AutocompleteSingleResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AutocompleteSearchResultToJson(
        AutocompleteSearchResult instance) =>
    <String, dynamic>{
      'took': instance.took,
      'timed_out': instance.timedOut,
      'options': instance.options,
    };
