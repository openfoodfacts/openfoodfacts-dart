import 'package:json_annotation/json_annotation.dart';
import 'off_tagged.dart';
import '../interface/json_object.dart';
import '../interface/parameter.dart';
import '../utils/country_helper.dart';
import '../utils/language_helper.dart';
import '../utils/taxonomy_query_configuration.dart';
import '../utils/tag_type.dart';

part 'taxonomy_packaging.g.dart';

/// Fields of an [TaxonomyPackaging]
enum TaxonomyPackagingField implements OffTagged {
  ALL(offTag: 'all'),
  NAME(offTag: 'name'),
  SYNONYMS(offTag: 'synonyms'),
  WIKIDATA(offTag: 'wikidata'),
  CHILDREN(offTag: 'children'),
  PARENTS(offTag: 'parents');
  //PACKAGING_MATERIALS, only 4/122 found for roots
  //TaxonomyPackagingField.PACKAGING_MATERIALS: 'packaging_materials',
  //NON_RECYCLABLE_AND_NOT_BIODEGRADABLE, only 4/122 found for roots
  //TaxonomyPackagingField.NON_RECYCLABLE_AND_NOT_BIODEGRADABLE:'non_recyclable_and_non_biodegradable',
  //WEIGHT, only 4/122 found for roots
  //TaxonomyPackagingField.WEIGHT: 'weight',
  //PACKAGING_SHAPE, only 2/122 found for roots
  //TaxonomyPackagingField.PACKAGING_SHAPE:'packaging_shapes',

  const TaxonomyPackagingField({
    required this.offTag,
  });

  @override
  final String offTag;
}

/// A JSON-serializable version of a Packaging taxonomy result.
///
/// See [OpenFoodAPIClient.getTaxonomy] for more details on how to retrieve one
/// of these.
@JsonSerializable()
class TaxonomyPackaging extends JsonObject {
  TaxonomyPackaging();

  factory TaxonomyPackaging.fromJson(Map<String, dynamic> json) =>
      _$TaxonomyPackagingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TaxonomyPackagingToJson(this);

  @JsonKey(
    name: 'name',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? name;
  @JsonKey(
    name: 'synonyms',
    fromJson: LanguageHelper.fromJsonStringsListMap,
    toJson: LanguageHelper.toJsonStringsListMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, List<String>>? synonyms;
  @JsonKey(
    name: 'wikidata',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? wikidata;
  @JsonKey(name: 'children', includeIfNull: false)
  List<String>? children;
  @JsonKey(name: 'parents', includeIfNull: false)
  List<String>? parents;

  @override
  String toString() => toJson().toString();
}

/// Configuration for packaging API query.
class TaxonomyPackagingQueryConfiguration extends TaxonomyQueryConfiguration<
    TaxonomyPackaging, TaxonomyPackagingField> {
  /// Configuration to get the packagings that match the [tags].
  TaxonomyPackagingQueryConfiguration({
    required List<String> tags,
    List<OpenFoodFactsLanguage>? languages,
    OpenFoodFactsCountry? country,
    List<TaxonomyPackagingField> fields = const [],
    List<Parameter> additionalParameters = const [],
  }) : super(
          TagType.PACKAGING,
          tags,
          languages: languages,
          country: country,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  /// Configuration to get the root packagings.
  TaxonomyPackagingQueryConfiguration.roots({
    final List<OpenFoodFactsLanguage>? languages,
    final OpenFoodFactsCountry? country,
    final List<TaxonomyPackagingField> fields = const [],
    final List<Parameter> additionalParameters = const [],
  }) : super.roots(
          TagType.PACKAGING,
          languages: languages,
          country: country,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  @override
  Map<String, TaxonomyPackaging> convertResults(dynamic jsonData) {
    if (jsonData is! Map<String, dynamic>) {
      return const {};
    }
    return jsonData
        .map<String, TaxonomyPackaging>((String key, dynamic taxonomy) {
      if (taxonomy is! Map<String, dynamic>) {
        assert(false, 'Received JSON Packaging is not a Map');
        return MapEntry(key, TaxonomyPackaging.fromJson({}));
      }
      return MapEntry(key, TaxonomyPackaging.fromJson(taxonomy));
    });
  }

  @override
  Set<TaxonomyPackagingField> get ignoredFields =>
      const {TaxonomyPackagingField.ALL};

  @override
  Iterable<String> convertFieldsToStrings(
    Iterable<TaxonomyPackagingField> fields,
  ) =>
      fields
          .where(
              (TaxonomyPackagingField field) => !ignoredFields.contains(field))
          .map<String>((TaxonomyPackagingField field) => field.offTag);
}
