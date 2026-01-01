import 'package:json_annotation/json_annotation.dart';
import 'off_tagged.dart';
import '../interface/json_object.dart';
import '../interface/parameter.dart';
import '../utils/country_helper.dart';
import '../utils/language_helper.dart';
import '../utils/taxonomy_query_configuration.dart';
import '../utils/tag_type.dart';

part 'taxonomy_packaging_shape.g.dart';

/// Fields of a [TaxonomyPackagingShape]
enum TaxonomyPackagingShapeField implements OffTagged {
  ALL(offTag: 'all'),
  NAME(offTag: 'name'),
  SYNONYMS(offTag: 'synonyms'),
  CHILDREN(offTag: 'children'),
  PARENTS(offTag: 'parents');

  const TaxonomyPackagingShapeField({required this.offTag});

  @override
  final String offTag;
}

/// A JSON-serializable version of a Packaging Shape taxonomy result.
///
/// See [OpenFoodAPIClient.getTaxonomy] for more details on how to retrieve one
/// of these.
@JsonSerializable()
class TaxonomyPackagingShape extends JsonObject {
  TaxonomyPackagingShape();

  factory TaxonomyPackagingShape.fromJson(Map<String, dynamic> json) =>
      _$TaxonomyPackagingShapeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TaxonomyPackagingShapeToJson(this);

  /// Standard localized name.
  @JsonKey(fromJson: LanguageHelper.fromJsonStringMap, includeIfNull: false)
  Map<OpenFoodFactsLanguage, String>? name;

  /// Localized synonyms of the name.
  @JsonKey(fromJson: LanguageHelper.fromJsonStringMapList, includeIfNull: false)
  Map<OpenFoodFactsLanguage, List<String>>? synonyms;

  /// Children.
  @JsonKey(includeIfNull: false)
  List<String>? children;

  /// Parents.
  @JsonKey(includeIfNull: false)
  List<String>? parents;

  @override
  String toString() => toJson().toString();
}

/// Configuration for packaging shapes API query.
class TaxonomyPackagingShapeQueryConfiguration
    extends
        TaxonomyQueryConfiguration<
          TaxonomyPackagingShape,
          TaxonomyPackagingShapeField
        > {
  /// Configuration to get the packaging shapes that match the [tags].
  TaxonomyPackagingShapeQueryConfiguration({
    required List<String> tags,
    List<OpenFoodFactsLanguage>? languages,
    OpenFoodFactsCountry? country,
    List<TaxonomyPackagingShapeField> fields = const [],
    List<Parameter> additionalParameters = const [],
    bool includeChildren = false,
  }) : super(
         TagType.PACKAGING_SHAPES,
         tags,
         languages: languages,
         country: country,
         includeChildren: includeChildren,
         fields: fields,
         additionalParameters: additionalParameters,
       );

  TaxonomyPackagingShapeQueryConfiguration.roots({
    List<OpenFoodFactsLanguage>? languages,
    OpenFoodFactsCountry? country,
    List<TaxonomyPackagingShapeField> fields = const [],
    List<Parameter> additionalParameters = const [],
    bool includeChildren = false,
  }) : super.roots(
         TagType.PACKAGING_SHAPES,
         languages: languages,
         country: country,
         includeChildren: includeChildren,
         fields: fields,
         additionalParameters: additionalParameters,
       );

  @override
  Map<String, TaxonomyPackagingShape> convertResults(dynamic jsonData) {
    if (jsonData is! Map<String, dynamic>) {
      return const {};
    }
    return jsonData.map<String, TaxonomyPackagingShape>((
      String key,
      dynamic taxonomy,
    ) {
      if (taxonomy is! Map<String, dynamic>) {
        assert(false, 'Received JSON Packaging Shape is not a Map');
        return MapEntry(key, TaxonomyPackagingShape.fromJson({}));
      }
      return MapEntry(key, TaxonomyPackagingShape.fromJson(taxonomy));
    });
  }

  @override
  Set<TaxonomyPackagingShapeField> get ignoredFields => const {
    TaxonomyPackagingShapeField.ALL,
  };

  @override
  Iterable<String> convertFieldsToStrings(
    Iterable<TaxonomyPackagingShapeField> fields,
  ) => fields
      .where(
        (TaxonomyPackagingShapeField field) => !ignoredFields.contains(field),
      )
      .map<String>((TaxonomyPackagingShapeField field) => field.offTag);
}
