import 'package:json_annotation/json_annotation.dart';
import 'off_tagged.dart';
import '../interface/json_object.dart';
import '../interface/parameter.dart';
import '../utils/country_helper.dart';
import '../utils/language_helper.dart';
import '../utils/taxonomy_query_configuration.dart';
import '../utils/tag_type.dart';

part 'taxonomy_label.g.dart';

/// Fields of an [TaxonomyLabel]
enum TaxonomyLabelField implements OffTagged {
  ALL(offTag: 'all'),
  AUTH_ADDRESS(offTag: 'auth_address'),
  AUTH_NAME(offTag: 'auth_name'),
  AUTH_URL(offTag: 'auth_url'),
  CATEGORIES(offTag: 'categories'),
  CHILDREN(offTag: 'children'),
  COUNTRIES_WHERE_SOLD(offTag: 'countries_where_sold'),
  COUNTRY(offTag: 'country'),
  DESCRIPTION(offTag: 'description'),
  EU_GROUPS(offTag: 'eu_groups'),
  EXCEPTIONS(offTag: 'exceptions'),
  IMAGE(offTag: 'image'),
  IMAGES(offTag: 'images'),
  INGREDIENTS(offTag: 'ingredients'),
  LABEL_CATEGORIES(offTag: 'label_categories'),
  MANUFACTURING_PLACES(offTag: 'manufacturing_places'),
  NAME(offTag: 'name'),
  OPPOSITE(offTag: 'opposite'),
  ORIGINS(offTag: 'origins'),
  PACKAGING(offTag: 'packaging'),
  PACKAGING_PLACES(offTag: 'packaging_places'),
  PARENTS(offTag: 'parents'),
  PROTECTED_NAME_TYPE(offTag: 'protected_name_type'),
  STORES(offTag: 'stores'),
  WIKIDATA(offTag: 'wikidata');

  const TaxonomyLabelField({
    required this.offTag,
  });

  @override
  final String offTag;
}

/// A JSON-serializable version of a Label taxonomy result.
///
/// See [OpenFoodAPIClient.getTaxonomy] for more details on how to retrieve one
/// of these.
@JsonSerializable()
class TaxonomyLabel extends JsonObject {
  TaxonomyLabel(
    this.authAddress,
    this.authName,
    this.authUrl,
    this.categories,
    this.children,
    this.countriesWhereSold,
    this.country,
    this.description,
    this.euGroups,
    this.exceptions,
    this.image,
    this.images,
    this.ingredients,
    this.labelCategories,
    this.manufacturingPlaces,
    this.name,
    this.opposite,
    this.origins,
    this.packaging,
    this.packagingPlaces,
    this.parents,
    this.protectedNameType,
    this.stores,
    this.wikidata,
  );

  factory TaxonomyLabel.fromJson(Map<String, dynamic> json) {
    return _$TaxonomyLabelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TaxonomyLabelToJson(this);
  }

  @JsonKey(
    name: 'auth_address',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? authAddress;
  @JsonKey(
    name: 'auth_name',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? authName;
  @JsonKey(
    name: 'auth_url',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? authUrl;
  @JsonKey(
    name: 'categories',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? categories;
  @JsonKey(
    name: 'countries_where_sold',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? countriesWhereSold;
  @JsonKey(name: 'children', includeIfNull: false)
  List<String>? children;
  @JsonKey(
    name: 'country',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? country;
  @JsonKey(
    name: 'description',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? description;
  @JsonKey(
    name: 'eu_groups',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? euGroups;
  @JsonKey(
    name: 'exceptions',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? exceptions;
  @JsonKey(
    name: 'image',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? image;
  @JsonKey(
    name: 'images',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? images;
  @JsonKey(
    name: 'ingredients',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? ingredients;
  @JsonKey(
    name: 'label_categories',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? labelCategories;
  @JsonKey(
    name: 'manufacturing_places',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? manufacturingPlaces;
  @JsonKey(
    name: 'name',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? name;
  @JsonKey(
    name: 'opposite',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? opposite;
  @JsonKey(
    name: 'origins',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? origins;
  @JsonKey(
    name: 'packaging',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? packaging;
  @JsonKey(
    name: 'packaging_places',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? packagingPlaces;
  @JsonKey(name: 'parents', includeIfNull: false)
  List<String>? parents;
  @JsonKey(
    name: 'protected_name_type',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? protectedNameType;
  @JsonKey(
    name: 'stores',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? stores;
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

class TaxonomyLabelQueryConfiguration
    extends TaxonomyQueryConfiguration<TaxonomyLabel, TaxonomyLabelField> {
  TaxonomyLabelQueryConfiguration({
    required List<String> tags,
    List<OpenFoodFactsLanguage>? languages,
    OpenFoodFactsCountry? country,
    List<TaxonomyLabelField> fields = const [],
    List<Parameter> additionalParameters = const [],
  }) : super(
          TagType.LABELS,
          tags,
          languages: languages,
          country: country,
          includeChildren: false,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  TaxonomyLabelQueryConfiguration.roots({
    List<OpenFoodFactsLanguage>? languages,
    OpenFoodFactsCountry? country,
    List<TaxonomyLabelField> fields = const [],
    List<Parameter> additionalParameters = const [],
  }) : super.roots(
          TagType.LABELS,
          languages: languages,
          country: country,
          includeChildren: false,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  @override
  Map<String, TaxonomyLabel> convertResults(dynamic jsonData) {
    if (jsonData is! Map<String, dynamic>) {
      return const {};
    }
    return jsonData.map<String, TaxonomyLabel>((String key, dynamic taxonomy) {
      if (taxonomy is! Map<String, dynamic>) {
        assert(false, 'Received JSON Label is not a Map');
        return MapEntry(key, TaxonomyLabel.fromJson({}));
      }
      return MapEntry(key, TaxonomyLabel.fromJson(taxonomy));
    });
  }

  @override
  Set<TaxonomyLabelField> get ignoredFields => const {TaxonomyLabelField.ALL};

  @override
  Iterable<String> convertFieldsToStrings(Iterable<TaxonomyLabelField> fields) {
    return fields
        .where((TaxonomyLabelField field) => !ignoredFields.contains(field))
        .map<String>((TaxonomyLabelField field) => field.offTag);
  }
}
