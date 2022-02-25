import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/interface/JsonObject.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/TaxonomyQueryConfiguration.dart';
import 'package:openfoodfacts/utils/TagType.dart';

part 'TaxonomyCategory.g.dart';

/// Fields of a [TaxonomyCategory]
enum TaxonomyCategoryField {
  ALL,
  AGRIBALYSE_FOOD_CODE,
  AGRIBALYSE_FOOD_NAME,
  AGRIBALYSE_PROXY_FOOD_CODE,
  AGRIBALYSE_PROXY_FOOD_NAME,
  AGRIBALYSE_PROXY_NAME,
  CARBON_FOOTPRINT_FR_FOODGES_INGREDIENT,
  CHILDREN,
  CIQUAL_FOOD_CODE,
  CIQUAL_FOOD_NAME,
  CIQUAL_PROXY_FOOD_CODE,
  CIQUAL_PROXY_FOOD_NAME,
  COUNTRY,
  GRAPEVARIETY,
  INSTANCEOF,
  NAME,
  NOVA,
  OQALI_FAMILY,
  ORIGINS,
  PARENTS,
  PNNS_GROUP_1,
  PNNS_GROUP_2,
  PROTECTED_NAME_FILE_NUMBER,
  PROTECTED_NAME_TYPE,
  REGION,
  SEASON_IN_COUNTRY_FR,
  WHO_ID,
  WIKIDATA,
  WIKIDATA_CATEGORY,
  WIKIDATA_WIKIPEDIA_CATEGORY,
}

extension TaxonomyCategoryFieldExtension on TaxonomyCategoryField {
  static const Map<TaxonomyCategoryField, String> _KEYS =
      <TaxonomyCategoryField, String>{
    TaxonomyCategoryField.ALL: 'all',
    TaxonomyCategoryField.AGRIBALYSE_FOOD_CODE: 'agribalyse_food_code',
    TaxonomyCategoryField.AGRIBALYSE_FOOD_NAME: 'agribalyse_food_name',
    TaxonomyCategoryField.AGRIBALYSE_PROXY_FOOD_CODE:
        'agribalyse_proxy_food_code',
    TaxonomyCategoryField.AGRIBALYSE_PROXY_FOOD_NAME:
        'agribalyse_proxy_food_name',
    TaxonomyCategoryField.AGRIBALYSE_PROXY_NAME: 'agribalyse_proxy_name',
    TaxonomyCategoryField.CARBON_FOOTPRINT_FR_FOODGES_INGREDIENT:
        'carbon_footprint_fr_foodges_ingredient',
    TaxonomyCategoryField.CHILDREN: 'children',
    TaxonomyCategoryField.CIQUAL_FOOD_CODE: 'ciqual_food_code',
    TaxonomyCategoryField.CIQUAL_FOOD_NAME: 'ciqual_food_name',
    TaxonomyCategoryField.CIQUAL_PROXY_FOOD_CODE: 'ciqual_proxy_food_code',
    TaxonomyCategoryField.CIQUAL_PROXY_FOOD_NAME: 'ciqual_proxy_food_name',
    TaxonomyCategoryField.COUNTRY: 'country',
    TaxonomyCategoryField.GRAPEVARIETY: 'grapevariety',
    TaxonomyCategoryField.INSTANCEOF: 'instanceof',
    TaxonomyCategoryField.NAME: 'name',
    TaxonomyCategoryField.NOVA: 'nova',
    TaxonomyCategoryField.OQALI_FAMILY: 'oqali_family',
    TaxonomyCategoryField.ORIGINS: 'origins',
    TaxonomyCategoryField.PARENTS: 'parents',
    TaxonomyCategoryField.PNNS_GROUP_1: 'pnns_group_1',
    TaxonomyCategoryField.PNNS_GROUP_2: 'pnns_group_2',
    TaxonomyCategoryField.PROTECTED_NAME_FILE_NUMBER:
        'protected_name_file_number',
    TaxonomyCategoryField.PROTECTED_NAME_TYPE: 'protected_name_type',
    TaxonomyCategoryField.REGION: 'region',
    TaxonomyCategoryField.SEASON_IN_COUNTRY_FR: 'season_in_country_fr',
    TaxonomyCategoryField.WHO_ID: 'who_id',
    TaxonomyCategoryField.WIKIDATA: 'wikidata',
    TaxonomyCategoryField.WIKIDATA_CATEGORY: 'wikidata_category',
    TaxonomyCategoryField.WIKIDATA_WIKIPEDIA_CATEGORY:
        'wikidata_wikipedia_category',
  };

  /// Returns the key of the Category field
  String get key => _KEYS[this] ?? '';
}

/// A JSON-serializable version of a category taxonomy result.
///
/// See [OpenFoodAPIClient.getTaxonomy] for more details on how to retrieve one
/// of these.
@JsonSerializable()
class TaxonomyCategory extends JsonObject {
  TaxonomyCategory(
    this.agribalyseFoodCode,
    this.agribalyseFoodName,
    this.agribalyseProxyFoodCode,
    this.agribalyseProxyFoodName,
    this.agribalyseProxyName,
    this.carbonFootprintFrFoodgesIngredient,
    this.children,
    this.ciqualFoodCode,
    this.ciqualFoodName,
    this.ciqualProxyFoodCode,
    this.ciqualProxyFoodName,
    this.country,
    this.grapevariety,
    this.instanceof,
    this.name,
    this.nova,
    this.oqaliFamily,
    this.origins,
    this.parents,
    this.pnnsGroup1,
    this.pnnsGroup2,
    this.protectedNameFileNumber,
    this.protectedNameType,
    this.region,
    this.seasonInCountryFr,
    this.whoId,
    this.wikidata,
    this.wikidataCategory,
    this.wikidataWikipediaCategory,
  );

  factory TaxonomyCategory.fromJson(Map<String, dynamic> json) {
    return _$TaxonomyCategoryFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TaxonomyCategoryToJson(this);
  }

  @JsonKey(
    name: 'agribalyse_food_code',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? agribalyseFoodCode;
  @JsonKey(
    name: 'agribalyse_food_name',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? agribalyseFoodName;
  @JsonKey(
    name: 'agribalyse_proxy_food_code',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? agribalyseProxyFoodCode;
  @JsonKey(
    name: 'agribalyse_proxy_food_name',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? agribalyseProxyFoodName;
  @JsonKey(
    name: 'agribalyse_proxy_name',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? agribalyseProxyName;
  @JsonKey(
    name: 'carbon_footprint_fr_foodges_ingredient',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? carbonFootprintFrFoodgesIngredient;
  @JsonKey(name: 'children', includeIfNull: false)
  List<String>? children;
  @JsonKey(
    name: 'ciqual_food_code',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? ciqualFoodCode;
  @JsonKey(
    name: 'ciqual_food_name',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? ciqualFoodName;
  @JsonKey(
    name: 'ciqual_proxy_food_code',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? ciqualProxyFoodCode;
  @JsonKey(
    name: 'ciqual_proxy_food_name',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? ciqualProxyFoodName;
  @JsonKey(
    name: 'country',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? country;
  @JsonKey(
    name: 'grapevariety',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? grapevariety;
  @JsonKey(
    name: 'instanceof',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? instanceof;
  @JsonKey(
    name: 'name',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? name;
  @JsonKey(
    name: 'nova',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? nova;
  @JsonKey(
    name: 'oqali_family',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? oqaliFamily;
  @JsonKey(
    name: 'origins',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? origins;
  @JsonKey(name: 'parents', includeIfNull: false)
  List<String>? parents;
  @JsonKey(
    name: 'pnns_group_1',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? pnnsGroup1;
  @JsonKey(
    name: 'pnns_group_2',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? pnnsGroup2;
  @JsonKey(
    name: 'protected_name_file_number',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? protectedNameFileNumber;
  @JsonKey(
    name: 'protected_name_type',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? protectedNameType;
  @JsonKey(
    name: 'region',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? region;
  @JsonKey(
    name: 'season_in_country_fr',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? seasonInCountryFr;
  @JsonKey(
    name: 'who_id',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? whoId;
  @JsonKey(
    name: 'wikidata',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? wikidata;
  @JsonKey(
    name: 'wikidata_category',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? wikidataCategory;
  @JsonKey(
    name: 'wikidata_wikipedia_category',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? wikidataWikipediaCategory;

  @override
  String toString() => toJson().toString();
}

class TaxonomyCategoryQueryConfiguration extends TaxonomyQueryConfiguration<
    TaxonomyCategory, TaxonomyCategoryField> {
  TaxonomyCategoryQueryConfiguration({
    required List<String> tags,
    List<OpenFoodFactsLanguage>? languages,
    @Deprecated('Use parameter country instead') String? cc,
    OpenFoodFactsCountry? country,
    bool includeChildren = false,
    List<TaxonomyCategoryField> fields = const [],
    List<Parameter> additionalParameters = const [],
  }) : super(
          TagType.CATEGORIES,
          tags,
          languages: languages,
          cc: cc,
          country: country,
          includeChildren: includeChildren,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  TaxonomyCategoryQueryConfiguration.roots({
    List<OpenFoodFactsLanguage>? languages,
    @Deprecated('Use parameter country instead') String? cc,
    OpenFoodFactsCountry? country,
    bool includeChildren = false,
    List<TaxonomyCategoryField> fields = const [],
    List<Parameter> additionalParameters = const [],
  }) : super.roots(
          TagType.CATEGORIES,
          languages: languages,
          cc: cc,
          country: country,
          includeChildren: includeChildren,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  @override
  Map<String, TaxonomyCategory> convertResults(dynamic jsonData) {
    if (jsonData is! Map<String, dynamic>) {
      return const {};
    }
    return jsonData
        .map<String, TaxonomyCategory>((String key, dynamic taxonomy) {
      if (taxonomy is! Map<String, dynamic>) {
        assert(false, 'Received JSON Category is not a Map');
        return MapEntry(key, TaxonomyCategory.fromJson({}));
      }
      return MapEntry(key, TaxonomyCategory.fromJson(taxonomy));
    });
  }

  @override
  Set<TaxonomyCategoryField> get ignoredFields =>
      const {TaxonomyCategoryField.ALL};

  @override
  Iterable<String> convertFieldsToStrings(
      Iterable<TaxonomyCategoryField> fields) {
    return fields
        .where((TaxonomyCategoryField field) => !ignoredFields.contains(field))
        .map<String>((TaxonomyCategoryField field) => field.key);
  }
}
