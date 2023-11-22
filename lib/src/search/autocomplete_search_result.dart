import 'package:json_annotation/json_annotation.dart';
import 'autocomplete_single_result.dart';
import '../interface/json_object.dart';

part 'autocomplete_search_result.g.dart';

/// Result of an autocomplete search on the Elastic Search API.
@JsonSerializable()
class AutocompleteSearchResult extends JsonObject {
  @JsonKey(fromJson: JsonObject.parseInt)
  final int? took;

  @JsonKey(name: 'timed_out', fromJson: JsonObject.parseBool)
  final bool? timedOut;

  @JsonKey()
  final List<AutocompleteSingleResult>? options;

  const AutocompleteSearchResult({
    this.took,
    this.timedOut,
    this.options,
  });

  factory AutocompleteSearchResult.fromJson(Map<String, dynamic> json) =>
      _$AutocompleteSearchResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AutocompleteSearchResultToJson(this);
}
