import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/interface/json_object.dart';
import 'package:openfoodfacts/model/off_tagged.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/country_helper.dart';
import 'package:openfoodfacts/utils/taxonomy_query_configuration.dart';
import 'package:openfoodfacts/utils/tag_type.dart';

part 'taxonomy_packaging_recycling.g.dart';

/// Fields of a [TaxonomyPackagingRecycling]
enum TaxonomyPackagingRecyclingField implements OffTagged {
  ALL(offTag: 'all'),
  NAME(offTag: 'name'),
  SYNONYMS(offTag: 'synonyms'),
  SHAPE(offTag: 'packaging_shapes'),
  MATERIAL(offTag: 'packaging_materials'),
  CHILDREN(offTag: 'children'),
  PARENTS(offTag: 'parents');

  const TaxonomyPackagingRecyclingField({required this.offTag});

  @override
  final String offTag;
}

/// A JSON-serializable version of a Packaging Recycling taxonomy result.
///
/// See [OpenFoodAPIClient.getTaxonomy] for more details on how to retrieve one
/// of these.
@JsonSerializable()
class TaxonomyPackagingRecycling extends JsonObject {
  TaxonomyPackagingRecycling();

  factory TaxonomyPackagingRecycling.fromJson(Map<String, dynamic> json) =>
      _$TaxonomyPackagingRecyclingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TaxonomyPackagingRecyclingToJson(this);

  /// Standard localized name.
  @JsonKey(fromJson: LanguageHelper.fromJsonStringMap, includeIfNull: false)
  Map<OpenFoodFactsLanguage, String>? name;

  /// Localized synonyms of the name.
  @JsonKey(fromJson: LanguageHelper.fromJsonStringMapList, includeIfNull: false)
  Map<OpenFoodFactsLanguage, List<String>>? synonyms;

  /// Shape.
  @JsonKey(fromJson: LanguageHelper.fromJsonStringMap, includeIfNull: false)
  Map<OpenFoodFactsLanguage, String>? shape;

  /// Material.
  @JsonKey(fromJson: LanguageHelper.fromJsonStringMap, includeIfNull: false)
  Map<OpenFoodFactsLanguage, String>? material;

  /// Children.
  @JsonKey(includeIfNull: false)
  List<String>? children;

  /// Parents.
  @JsonKey(includeIfNull: false)
  List<String>? parents;

  @override
  String toString() => toJson().toString();
}

/// Configuration for packaging recycling API query.
class TaxonomyPackagingRecyclingQueryConfiguration
    extends TaxonomyQueryConfiguration<TaxonomyPackagingRecycling,
        TaxonomyPackagingRecyclingField> {
  /// Configuration to get the packaging recycling that match the [tags].
  TaxonomyPackagingRecyclingQueryConfiguration({
    required List<String> tags,
    List<OpenFoodFactsLanguage>? languages,
    OpenFoodFactsCountry? country,
    List<TaxonomyPackagingRecyclingField> fields = const [],
    List<Parameter> additionalParameters = const [],
    bool includeChildren = false,
  }) : super(
          TagType.PACKAGING_RECYCLING,
          tags,
          languages: languages,
          country: country,
          includeChildren: includeChildren,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  TaxonomyPackagingRecyclingQueryConfiguration.roots({
    List<OpenFoodFactsLanguage>? languages,
    OpenFoodFactsCountry? country,
    List<TaxonomyPackagingRecyclingField> fields = const [],
    List<Parameter> additionalParameters = const [],
    bool includeChildren = false,
  }) : super.roots(
          TagType.PACKAGING_RECYCLING,
          languages: languages,
          country: country,
          includeChildren: includeChildren,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  @override
  Map<String, TaxonomyPackagingRecycling> convertResults(dynamic jsonData) {
    if (jsonData is! Map<String, dynamic>) {
      return const {};
    }
    return jsonData.map<String, TaxonomyPackagingRecycling>(
        (String key, dynamic taxonomy) {
      if (taxonomy is! Map<String, dynamic>) {
        assert(false, 'Received JSON Packaging Recycling is not a Map');
        return MapEntry(key, TaxonomyPackagingRecycling.fromJson({}));
      }
      return MapEntry(key, TaxonomyPackagingRecycling.fromJson(taxonomy));
    });
  }

  @override
  Set<TaxonomyPackagingRecyclingField> get ignoredFields =>
      const {TaxonomyPackagingRecyclingField.ALL};

  @override
  Iterable<String> convertFieldsToStrings(
          Iterable<TaxonomyPackagingRecyclingField> fields) =>
      fields
          .where((TaxonomyPackagingRecyclingField field) =>
              !ignoredFields.contains(field))
          .map<String>((TaxonomyPackagingRecyclingField field) => field.offTag);
}
