import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/interface/JsonObject.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/TaxonomyQueryConfiguration.dart';
import 'package:openfoodfacts/utils/TagType.dart';

part 'TaxonomyPackaging.g.dart';

/// Fields of an [TaxonomyPackaging]
enum TaxonomyPackagingField {
  ALL,
  NAME,
  SYNONYMS,
  WIKIDATA,
  CHILDREN,
  PARENTS,
  //PACKAGING_MATERIALS, only 4/122 found for roots
  //NON_RECYCLABLE_AND_NOT_BIODEGRADABLE, only 4/122 found for roots
  //WEIGHT, only 4/122 found for roots
  //PACKAGING_SHAPE, only 2/122 found for roots
}

extension TaxonomyPackagingFieldExtension on TaxonomyPackagingField {
  static const Map<TaxonomyPackagingField, String> _KEYS =
      <TaxonomyPackagingField, String>{
    TaxonomyPackagingField.ALL: 'all',
    TaxonomyPackagingField.NAME: 'name',
    TaxonomyPackagingField.SYNONYMS: 'synonyms',
    TaxonomyPackagingField.WIKIDATA: 'wikidata',
    TaxonomyPackagingField.CHILDREN: 'children',
    TaxonomyPackagingField.PARENTS: 'parents',
    //TaxonomyPackagingField.PACKAGING_MATERIALS: 'packaging_materials',
    //TaxonomyPackagingField.NON_RECYCLABLE_AND_NOT_BIODEGRADABLE:'non_recyclable_and_non_biodegradable',
    //TaxonomyPackagingField.WEIGHT: 'weight',
    //TaxonomyPackagingField.PACKAGING_SHAPE:'packaging_shapes',
  };

  /// Returns the key of the Packaging field
  String get key => _KEYS[this] ?? '';
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
          .map<String>((TaxonomyPackagingField field) => field.key);
}
