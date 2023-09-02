import 'package:json_annotation/json_annotation.dart';
import 'off_tagged.dart';
import '../interface/json_object.dart';
import '../interface/parameter.dart';
import '../utils/country_helper.dart';
import '../utils/language_helper.dart';
import '../utils/taxonomy_query_configuration.dart';
import '../utils/tag_type.dart';

part 'taxonomy_language.g.dart';

/// Fields of an [TaxonomyLanguage]
enum TaxonomyLanguageField implements OffTagged {
  ALL(offTag: 'all'),
  LANGUAGE_CODE_2(offTag: 'language_code_2'),
  LANGUAGE_CODE_3(offTag: 'language_code_3'),
  NAME(offTag: 'name'),
  WIKIDATA(offTag: 'wikidata');

  const TaxonomyLanguageField({
    required this.offTag,
  });

  @override
  final String offTag;
}

/// A JSON-serializable version of a Language taxonomy result.
///
/// See [OpenFoodAPIClient.getTaxonomy] for more details on how to retrieve one
/// of these.
@JsonSerializable()
class TaxonomyLanguage extends JsonObject {
  TaxonomyLanguage(
    this.languageCode2,
    this.languageCode3,
    this.name,
    this.wikidata,
  );

  factory TaxonomyLanguage.fromJson(Map<String, dynamic> json) {
    return _$TaxonomyLanguageFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TaxonomyLanguageToJson(this);
  }

  @JsonKey(
    name: 'language_code_2',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? languageCode2;
  @JsonKey(
    name: 'language_code_3',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? languageCode3;
  @JsonKey(
    name: 'name',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? name;
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

/// Configuration for languages API query.
class TaxonomyLanguageQueryConfiguration extends TaxonomyQueryConfiguration<
    TaxonomyLanguage, TaxonomyLanguageField> {
  /// Configuration to get the languages that match the [tags].
  TaxonomyLanguageQueryConfiguration({
    required List<String> tags,
    List<OpenFoodFactsLanguage>? languages,
    OpenFoodFactsCountry? country,
    List<TaxonomyLanguageField> fields = const [],
    List<Parameter> additionalParameters = const [],
  }) : super(
          TagType.LANGUAGES,
          tags,
          languages: languages,
          country: country,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  /// Configuration to get ALL the languages.
  TaxonomyLanguageQueryConfiguration.all({
    List<OpenFoodFactsLanguage>? languages,
    OpenFoodFactsCountry? country,
    List<TaxonomyLanguageField> fields = const [],
    List<Parameter> additionalParameters = const [],
  }) : super.roots(
          TagType.LANGUAGES,
          languages: languages,
          country: country,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  @override
  Map<String, TaxonomyLanguage> convertResults(dynamic jsonData) {
    if (jsonData is! Map<String, dynamic>) {
      return const {};
    }
    return jsonData
        .map<String, TaxonomyLanguage>((String key, dynamic taxonomy) {
      if (taxonomy is! Map<String, dynamic>) {
        assert(false, 'Received JSON Language is not a Map');
        return MapEntry(key, TaxonomyLanguage.fromJson({}));
      }
      return MapEntry(key, TaxonomyLanguage.fromJson(taxonomy));
    });
  }

  @override
  Set<TaxonomyLanguageField> get ignoredFields =>
      const {TaxonomyLanguageField.ALL};

  @override
  Iterable<String> convertFieldsToStrings(
      Iterable<TaxonomyLanguageField> fields) {
    return fields
        .where((TaxonomyLanguageField field) => !ignoredFields.contains(field))
        .map<String>((TaxonomyLanguageField field) => field.offTag);
  }
}
