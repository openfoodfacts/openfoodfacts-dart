import 'package:json_annotation/json_annotation.dart';
import 'off_tagged.dart';
import '../interface/json_object.dart';
import '../interface/parameter.dart';
import '../utils/country_helper.dart';
import '../utils/language_helper.dart';
import '../utils/taxonomy_query_configuration.dart';
import '../utils/tag_type.dart';

part 'taxonomy_country.g.dart';

/// Fields of an [TaxonomyCountry]
enum TaxonomyCountryField implements OffTagged {
  ALL(offTag: 'all'),
  COUNTRY_CODE_2(offTag: 'country_code_2'),
  COUNTRY_CODE_3(offTag: 'country_code_3'),
  LANGUAGES(offTag: 'languages'),
  NAME(offTag: 'name'),
  OFFICIAL_COUNTRY_CODE_2(offTag: 'official_country_code_2'),
  SYNONYMS(offTag: 'synonyms'),
  WIKIDATA(offTag: 'wikidata');

  const TaxonomyCountryField({required this.offTag});

  @override
  final String offTag;
}

/// A JSON-serializable version of a Country taxonomy result.
///
/// See [OpenFoodAPIClient.getTaxonomy] for more details on how to retrieve one
/// of these.
@JsonSerializable()
class TaxonomyCountry extends JsonObject {
  TaxonomyCountry();

  factory TaxonomyCountry.fromJson(Map<String, dynamic> json) {
    return _$TaxonomyCountryFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TaxonomyCountryToJson(this);
  }

  @JsonKey(
    name: 'country_code_2',
    fromJson: LanguageHelper.fromJsonStringMapIsoUnique,
    includeIfNull: false,
  )
  String? countryCode2;
  @JsonKey(
    name: 'country_code_3',
    fromJson: LanguageHelper.fromJsonStringMapIsoUnique,
    includeIfNull: false,
  )
  String? countryCode3;
  @JsonKey(
    name: 'language_codes',
    fromJson: LanguageHelper.fromJsonStringMapIsoList,
    includeIfNull: false,
  )
  List<OpenFoodFactsLanguage>? languages;
  @JsonKey(
    fromJson: LanguageHelper.fromJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? name;
  @JsonKey(
    fromJson: LanguageHelper.fromJsonStringMapList,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, List<String>>? synonyms;
  @JsonKey(
    fromJson: LanguageHelper.fromJsonStringMapIsoUnique,
    includeIfNull: false,
  )
  String? wikidata;
  @JsonKey(
    name: 'official_country_code_2',
    fromJson: LanguageHelper.fromJsonStringMapIsoUnique,
    includeIfNull: false,
  )
  String? officialCountryCode2;
  @override
  String toString() => toJson().toString();
}

/// Configuration for countries API query.
class TaxonomyCountryQueryConfiguration
    extends TaxonomyQueryConfiguration<TaxonomyCountry, TaxonomyCountryField> {
  /// Configuration to get the countries that match the [tags].
  TaxonomyCountryQueryConfiguration({
    required List<String> tags,
    List<OpenFoodFactsLanguage>? languages,
    OpenFoodFactsCountry? country,
    List<TaxonomyCountryField> fields = const [],
    List<Parameter> additionalParameters = const [],
  }) : super(
          TagType.COUNTRIES,
          tags,
          languages: languages,
          country: country,
          includeChildren: false,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  /// Configuration to get ALL the countries.
  TaxonomyCountryQueryConfiguration.all({
    List<OpenFoodFactsLanguage>? languages,
    OpenFoodFactsCountry? country,
    List<TaxonomyCountryField> fields = const [],
    List<Parameter> additionalParameters = const [],
  }) : super.roots(
          TagType.COUNTRIES,
          languages: languages,
          country: country,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  @override
  Map<String, TaxonomyCountry> convertResults(dynamic jsonData) {
    if (jsonData is! Map<String, dynamic>) {
      return const {};
    }
    return jsonData
        .map<String, TaxonomyCountry>((String key, dynamic taxonomy) {
      if (taxonomy is! Map<String, dynamic>) {
        assert(false, 'Received JSON Country is not a Map');
        return MapEntry(key, TaxonomyCountry.fromJson({}));
      }
      return MapEntry(key, TaxonomyCountry.fromJson(taxonomy));
    });
  }

  @override
  Set<TaxonomyCountryField> get ignoredFields =>
      const {TaxonomyCountryField.ALL};

  @override
  Iterable<String> convertFieldsToStrings(
      Iterable<TaxonomyCountryField> fields) {
    return fields
        .where((TaxonomyCountryField field) => !ignoredFields.contains(field))
        .map<String>((TaxonomyCountryField field) => field.offTag);
  }
}
