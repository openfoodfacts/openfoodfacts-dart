import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/interface/JsonObject.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/TaxonomyQueryConfiguration.dart';
import 'package:openfoodfacts/utils/TagType.dart';

part 'TaxonomyCountry.g.dart';

/// Fields of an [TaxonomyCountry]
enum TaxonomyCountryField {
  ALL,
  COUNTRY_CODE_2,
  COUNTRY_CODE_3,
  LANGUAGES,
  NAME,
  OFFICIAL_COUNTRY_CODE_2,
}

extension TaxonomyCountryFieldExtension on TaxonomyCountryField {
  static const Map<TaxonomyCountryField, String> _KEYS = {
    TaxonomyCountryField.ALL: 'all',
    TaxonomyCountryField.COUNTRY_CODE_2: 'country_code_2',
    TaxonomyCountryField.COUNTRY_CODE_3: 'country_code_3',
    TaxonomyCountryField.LANGUAGES: 'languages',
    TaxonomyCountryField.NAME: 'name',
    TaxonomyCountryField.OFFICIAL_COUNTRY_CODE_2: 'official_country_code_2',
  };

  /// Returns the key of the Country field
  String get key => _KEYS[this] ?? '';
}

/// A JSON-serializable version of a Country taxonomy result.
///
/// See [OpenFoodAPIClient.getTaxonomy] for more details on how to retrieve one
/// of these.
@JsonSerializable()
class TaxonomyCountry extends JsonObject {
  TaxonomyCountry(
    this.children,
    this.countryCode2,
    this.countryCode3,
    this.languages,
    this.name,
    this.officialCountryCode2,
    this.parents,
  );

  factory TaxonomyCountry.fromJson(Map<String, dynamic> json) {
    return _$TaxonomyCountryFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TaxonomyCountryToJson(this);
  }

  @JsonKey(name: 'children', includeIfNull: false)
  List<String>? children;
  @JsonKey(
    name: 'country_code_2',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? countryCode2;
  @JsonKey(
    name: 'country_code_3',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? countryCode3;
  @JsonKey(
    name: 'languages',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? languages;
  @JsonKey(
    name: 'name',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? name;
  @JsonKey(
    name: 'official_country_code_2',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? officialCountryCode2;
  @JsonKey(name: 'parents', includeIfNull: false)
  List<String>? parents;
  @override
  String toString() => toJson().toString();
}

class TaxonomyCountryQueryConfiguration
    extends TaxonomyQueryConfiguration<TaxonomyCountry, TaxonomyCountryField> {
  TaxonomyCountryQueryConfiguration({
    required List<String> tags,
    List<OpenFoodFactsLanguage>? languages = const [],
    String? cc,
    List<TaxonomyCountryField> fields = const [],
    List<Parameter> additionalParameters = const [],
  }) : super(
          TagType.LABELS,
          tags,
          languages: languages,
          cc: cc,
          includeChildren: false,
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
        .map<String>((TaxonomyCountryField field) => field.key);
  }
}
