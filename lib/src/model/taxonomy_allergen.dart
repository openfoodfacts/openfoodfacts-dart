import 'package:json_annotation/json_annotation.dart';
import 'off_tagged.dart';
import '../interface/json_object.dart';
import '../interface/parameter.dart';
import '../utils/country_helper.dart';
import '../utils/language_helper.dart';
import '../utils/taxonomy_query_configuration.dart';
import '../utils/tag_type.dart';

part 'taxonomy_allergen.g.dart';

/// Fields of an [TaxonomyAllergen]
enum TaxonomyAllergenField implements OffTagged {
  ALL(offTag: 'all'),
  NAME(offTag: 'name'),
  SYNONYMS(offTag: 'synonyms'),
  WIKIDATA(offTag: 'wikidata');

  const TaxonomyAllergenField({
    required this.offTag,
  });

  @override
  final String offTag;
}

/// A JSON-serializable version of a Allergen taxonomy result.
///
/// See [OpenFoodAPIClient.getTaxonomy] for more details on how to retrieve one
/// of these.
@JsonSerializable()
class TaxonomyAllergen extends JsonObject {
  TaxonomyAllergen(
    this.name,
    this.synonyms,
    this.wikidata,
  );

  factory TaxonomyAllergen.fromJson(Map<String, dynamic> json) {
    return _$TaxonomyAllergenFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TaxonomyAllergenToJson(this);
  }

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

  @override
  String toString() => toJson().toString();
}

/// Configuration for allergens API query.
class TaxonomyAllergenQueryConfiguration extends TaxonomyQueryConfiguration<
    TaxonomyAllergen, TaxonomyAllergenField> {
  /// Configuration to get the allergens that match the [tags].
  TaxonomyAllergenQueryConfiguration({
    required List<String> tags,
    List<OpenFoodFactsLanguage>? languages,
    OpenFoodFactsCountry? country,
    List<TaxonomyAllergenField> fields = const [],
    List<Parameter> additionalParameters = const [],
  }) : super(
          TagType.ALLERGENS,
          tags,
          languages: languages,
          country: country,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  /// Configuration to get ALL the allergens.
  TaxonomyAllergenQueryConfiguration.all({
    final List<OpenFoodFactsLanguage>? languages,
    final OpenFoodFactsCountry? country,
    final List<TaxonomyAllergenField> fields = const [],
    final List<Parameter> additionalParameters = const [],
  }) : super.roots(
          TagType.ALLERGENS,
          languages: languages,
          country: country,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  @override
  Map<String, TaxonomyAllergen> convertResults(dynamic jsonData) {
    if (jsonData is! Map<String, dynamic>) {
      return const {};
    }
    return jsonData
        .map<String, TaxonomyAllergen>((String key, dynamic taxonomy) {
      if (taxonomy is! Map<String, dynamic>) {
        assert(false, 'Received JSON Allergen is not a Map');
        return MapEntry(key, TaxonomyAllergen.fromJson({}));
      }
      return MapEntry(key, TaxonomyAllergen.fromJson(taxonomy));
    });
  }

  @override
  Set<TaxonomyAllergenField> get ignoredFields =>
      const {TaxonomyAllergenField.ALL};

  @override
  Iterable<String> convertFieldsToStrings(
      Iterable<TaxonomyAllergenField> fields) {
    return fields
        .where((TaxonomyAllergenField field) => !ignoredFields.contains(field))
        .map<String>((TaxonomyAllergenField field) => field.offTag);
  }
}
