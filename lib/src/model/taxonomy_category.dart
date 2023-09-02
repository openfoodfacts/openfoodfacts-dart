import 'package:json_annotation/json_annotation.dart';
import 'off_tagged.dart';
import '../interface/json_object.dart';
import '../interface/parameter.dart';
import '../utils/country_helper.dart';
import '../utils/language_helper.dart';
import '../utils/taxonomy_query_configuration.dart';
import '../utils/tag_type.dart';

part 'taxonomy_category.g.dart';

/// Fields of a [TaxonomyCategory]
enum TaxonomyCategoryField implements OffTagged {
  ALL(offTag: 'all'),
  AGRIBALYSE_FOOD_CODE(offTag: 'agribalyse_food_code'),
  AGRIBALYSE_FOOD_NAME(offTag: 'agribalyse_food_name'),
  AGRIBALYSE_PROXY_FOOD_CODE(offTag: 'agribalyse_proxy_food_code'),
  AGRIBALYSE_PROXY_FOOD_NAME(offTag: 'agribalyse_proxy_food_name'),
  AGRIBALYSE_PROXY_NAME(offTag: 'agribalyse_proxy_name'),
  CARBON_FOOTPRINT_FR_FOODGES_INGREDIENT(
      offTag: 'carbon_footprint_fr_foodges_ingredient'),
  CHILDREN(offTag: 'children'),
  CIQUAL_FOOD_CODE(offTag: 'ciqual_food_code'),
  CIQUAL_FOOD_NAME(offTag: 'ciqual_food_name'),
  CIQUAL_PROXY_FOOD_CODE(offTag: 'ciqual_proxy_food_code'),
  CIQUAL_PROXY_FOOD_NAME(offTag: 'ciqual_proxy_food_name'),
  COUNTRY(offTag: 'country'),
  GRAPEVARIETY(offTag: 'grapevariety'),
  INSTANCEOF(offTag: 'instanceof'),
  NAME(offTag: 'name'),
  NOVA(offTag: 'nova'),
  OQALI_FAMILY(offTag: 'oqali_family'),
  ORIGINS(offTag: 'origins'),
  PARENTS(offTag: 'parents'),
  PNNS_GROUP_1(offTag: 'pnns_group_1'),
  PNNS_GROUP_2(offTag: 'pnns_group_2'),
  PROTECTED_NAME_FILE_NUMBER(offTag: 'protected_name_file_number'),
  PROTECTED_NAME_TYPE(offTag: 'protected_name_type'),
  REGION(offTag: 'region'),
  SEASON_IN_COUNTRY_FR(offTag: 'season_in_country_fr'),
  WHO_ID(offTag: 'who_id'),
  WIKIDATA(offTag: 'wikidata'),
  WIKIDATA_CATEGORY(offTag: 'wikidata_category'),
  WIKIDATA_WIKIPEDIA_CATEGORY(offTag: 'wikidata_wikipedia_category');

  const TaxonomyCategoryField({
    required this.offTag,
  });

  @override
  final String offTag;
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
    OpenFoodFactsCountry? country,
    bool includeChildren = false,
    List<TaxonomyCategoryField> fields = const [],
    List<Parameter> additionalParameters = const [],
  }) : super(
          TagType.CATEGORIES,
          tags,
          languages: languages,
          country: country,
          includeChildren: includeChildren,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  TaxonomyCategoryQueryConfiguration.roots({
    List<OpenFoodFactsLanguage>? languages,
    OpenFoodFactsCountry? country,
    bool includeChildren = false,
    List<TaxonomyCategoryField> fields = const [],
    List<Parameter> additionalParameters = const [],
  }) : super.roots(
          TagType.CATEGORIES,
          languages: languages,
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
        .map<String>((TaxonomyCategoryField field) => field.offTag);
  }
}
