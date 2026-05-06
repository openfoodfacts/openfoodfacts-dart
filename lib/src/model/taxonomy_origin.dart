import 'package:json_annotation/json_annotation.dart';
import 'off_tagged.dart';
import '../interface/json_object.dart';
import '../interface/parameter.dart';
import '../utils/country_helper.dart';
import '../utils/language_helper.dart';
import '../utils/taxonomy_query_configuration.dart';
import '../utils/tag_type.dart';

part 'taxonomy_origin.g.dart';

/// Fields of a [TaxonomyOrigin]
enum TaxonomyOriginField implements OffTagged {
  ALL(offTag: 'all'),
  NAME(offTag: 'name'),
  SYNONYMS(offTag: 'synonyms'),
  CHILDREN(offTag: 'children'),
  PARENTS(offTag: 'parents');

  const TaxonomyOriginField({required this.offTag});

  @override
  final String offTag;
}

/// A JSON-serializable version of an Origin taxonomy result.
///
/// See [OpenFoodAPIClient.getTaxonomy] for more details on how to retrieve one
/// of these.
@JsonSerializable()
class TaxonomyOrigin extends JsonObject {
  TaxonomyOrigin();

  factory TaxonomyOrigin.fromJson(Map<String, dynamic> json) =>
      _$TaxonomyOriginFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TaxonomyOriginToJson(this);

  /// Standard localized name of the origin (e.g., 'Italy' in English).
  @JsonKey(fromJson: LanguageHelper.fromJsonStringMap, includeIfNull: false)
  Map<OpenFoodFactsLanguage, String>? name;

  /// Localized synonyms of the name of the origin.
  ///
  /// In real life the field contains rarely more than the name already known.
  @JsonKey(fromJson: LanguageHelper.fromJsonStringMapList, includeIfNull: false)
  Map<OpenFoodFactsLanguage, List<String>>? synonyms;

  /// Children of the origin (like, Aquitaine is a child of France).
  ///
  /// In real life the field is rarely populated.
  /// Stats on 2022-11-06: 16/369 origins have children.
  @JsonKey(includeIfNull: false)
  List<String>? children;

  /// Parents of the origin (like, France is the parent of Aquitaine).
  ///
  /// In real life the field is rarely populated, or with only one parent.
  /// Stats on 2022-11-06: 81/369 origins have children.
  /// Don't expect too much relevancy - tree-wise - as France and Europe are
  /// both root origins, and Europe is not the parent of France.
  @JsonKey(includeIfNull: false)
  List<String>? parents;

  @override
  String toString() => toJson().toString();
}

/// Configuration for origins API query.
class TaxonomyOriginQueryConfiguration
    extends TaxonomyQueryConfiguration<TaxonomyOrigin, TaxonomyOriginField> {
  /// Configuration to get the origins that match the [tags].
  TaxonomyOriginQueryConfiguration({
    required List<String> tags,
    List<OpenFoodFactsLanguage>? languages,
    OpenFoodFactsCountry? country,
    List<TaxonomyOriginField> fields = const [],
    List<Parameter> additionalParameters = const [],
    bool includeChildren = false,
  }) : super(
         TagType.ORIGINS,
         tags,
         languages: languages,
         country: country,
         includeChildren: includeChildren,
         fields: fields,
         additionalParameters: additionalParameters,
       );

  TaxonomyOriginQueryConfiguration.roots({
    List<OpenFoodFactsLanguage>? languages,
    OpenFoodFactsCountry? country,
    List<TaxonomyOriginField> fields = const [],
    List<Parameter> additionalParameters = const [],
    bool includeChildren = false,
  }) : super.roots(
         TagType.ORIGINS,
         languages: languages,
         country: country,
         includeChildren: includeChildren,
         fields: fields,
         additionalParameters: additionalParameters,
       );

  @override
  Map<String, TaxonomyOrigin> convertResults(dynamic jsonData) {
    if (jsonData is! Map<String, dynamic>) {
      return const {};
    }
    return jsonData.map<String, TaxonomyOrigin>((String key, dynamic taxonomy) {
      if (taxonomy is! Map<String, dynamic>) {
        assert(false, 'Received JSON Origin is not a Map');
        return MapEntry(key, TaxonomyOrigin.fromJson({}));
      }
      return MapEntry(key, TaxonomyOrigin.fromJson(taxonomy));
    });
  }

  @override
  Set<TaxonomyOriginField> get ignoredFields => const {TaxonomyOriginField.ALL};

  @override
  Iterable<String> convertFieldsToStrings(
    Iterable<TaxonomyOriginField> fields,
  ) => fields
      .where((TaxonomyOriginField field) => !ignoredFields.contains(field))
      .map<String>((TaxonomyOriginField field) => field.offTag);
}
