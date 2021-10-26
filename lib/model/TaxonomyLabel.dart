import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/interface/JsonObject.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/TaxonomyQueryConfiguration.dart';
import 'package:openfoodfacts/utils/TagType.dart';

part 'TaxonomyLabel.g.dart';

/// Fields of an [TaxonomyLabel]
enum TaxonomyLabelField {
  ALL,
  AUTH_ADDRESS,
  AUTH_NAME,
  AUTH_URL,
  CATEGORIES,
  CHILDREN,
  COUNTRIES_WHERE_SOLD,
  COUNTRY,
  DESCRIPTION,
  EU_GROUPS,
  EXCEPTIONS,
  IMAGE,
  IMAGES,
  INGREDIENTS,
  LABEL_CATEGORIES,
  MANUFACTURING_PLACES,
  NAME,
  OPPOSITE,
  ORIGINS,
  PACKAGING,
  PACKAGING_PLACES,
  PARENTS,
  PROTECTED_NAME_TYPE,
  STORES,
  WIKIDATA,
}

extension TaxonomyLabelFieldExtension on TaxonomyLabelField {
  static const Map<TaxonomyLabelField, String> _KEYS =
      <TaxonomyLabelField, String>{
    TaxonomyLabelField.ALL: 'all',
    TaxonomyLabelField.AUTH_ADDRESS: 'auth_address',
    TaxonomyLabelField.AUTH_NAME: 'auth_name',
    TaxonomyLabelField.AUTH_URL: 'auth_url',
    TaxonomyLabelField.CATEGORIES: 'categories',
    TaxonomyLabelField.CHILDREN: 'children',
    TaxonomyLabelField.COUNTRIES_WHERE_SOLD: 'countries_where_sold',
    TaxonomyLabelField.COUNTRY: 'country',
    TaxonomyLabelField.DESCRIPTION: 'description',
    TaxonomyLabelField.EU_GROUPS: 'eu_groups',
    TaxonomyLabelField.EXCEPTIONS: 'exceptions',
    TaxonomyLabelField.IMAGE: 'image',
    TaxonomyLabelField.IMAGES: 'images',
    TaxonomyLabelField.INGREDIENTS: 'ingredients',
    TaxonomyLabelField.LABEL_CATEGORIES: 'label_categories',
    TaxonomyLabelField.MANUFACTURING_PLACES: 'manufacturing_places',
    TaxonomyLabelField.NAME: 'name',
    TaxonomyLabelField.OPPOSITE: 'opposite',
    TaxonomyLabelField.ORIGINS: 'origins',
    TaxonomyLabelField.PACKAGING: 'packaging',
    TaxonomyLabelField.PACKAGING_PLACES: 'packaging_places',
    TaxonomyLabelField.PARENTS: 'parents',
    TaxonomyLabelField.PROTECTED_NAME_TYPE: 'protected_name_type',
    TaxonomyLabelField.STORES: 'stores',
    TaxonomyLabelField.WIKIDATA: 'wikidata',
  };

  /// Returns the key of the Label field
  String get key => _KEYS[this] ?? '';
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
    List<OpenFoodFactsLanguage>? languages = const [],
    String? cc,
    List<TaxonomyLabelField> fields = const [],
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
        .map<String>((TaxonomyLabelField field) => field.key);
  }
}
