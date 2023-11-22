import 'package:json_annotation/json_annotation.dart';
import 'taxonomy_name.dart';
import '../interface/json_object.dart';

part 'autocomplete_single_result.g.dart';

/// Single item result of an autocomplete search on the Elastic Search API.
@JsonSerializable()
class AutocompleteSingleResult extends JsonObject {
  /// Tag, e.g. 'en:margherita-pizza'.
  @JsonKey()
  final String id;

  /// Localized text, e.g. 'Pizza au fromage et aux tomates'.
  @JsonKey()
  final String text;

  /// Taxonomy name off tag, e.g. 'category'.
  @JsonKey(name: 'taxonomy_name')
  final String taxonomyNameAsString;

  /// Taxonomy name, if [taxonomyNameAsString] is valid.
  TaxonomyName? get taxonomyName =>
      TaxonomyName.fromOffTag(taxonomyNameAsString);

  const AutocompleteSingleResult({
    required this.id,
    required this.text,
    required this.taxonomyNameAsString,
  });

  factory AutocompleteSingleResult.fromJson(Map<String, dynamic> json) =>
      _$AutocompleteSingleResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AutocompleteSingleResultToJson(this);
}
