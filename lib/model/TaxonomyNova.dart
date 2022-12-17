import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/interface/JsonObject.dart';
import 'package:openfoodfacts/model/OffTagged.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/TaxonomyQueryConfiguration.dart';
import 'package:openfoodfacts/utils/TagType.dart';

part 'TaxonomyNova.g.dart';

/// Fields of a [TaxonomyNova]
enum TaxonomyNovaField implements OffTagged {
  ALL(offTag: 'all'),
  NAME(offTag: 'name'),
  SYNONYMS(offTag: 'synonyms');

  const TaxonomyNovaField({required this.offTag});

  @override
  final String offTag;
}

/// A JSON-serializable version of a Nova taxonomy result.
///
/// See [OpenFoodAPIClient.getTaxonomy] for more details on how to retrieve one
/// of these.
@JsonSerializable()
class TaxonomyNova extends JsonObject {
  TaxonomyNova();

  static const Map<int, String> offTags = <int, String>{
    1: 'en:1-unprocessed-or-minimally-processed-foods',
    2: 'en:2-processed-culinary-ingredients',
    3: 'en:3-processed-foods',
    4: 'en:4-ultra-processed-food-and-drink-products',
  };

  factory TaxonomyNova.fromJson(Map<String, dynamic> json) =>
      _$TaxonomyNovaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TaxonomyNovaToJson(this);

  /// Standard localized name.
  @JsonKey(fromJson: LanguageHelper.fromJsonStringMap, includeIfNull: false)
  Map<OpenFoodFactsLanguage, String>? name;

  /// Localized synonyms of the name.
  @JsonKey(fromJson: LanguageHelper.fromJsonStringMapList, includeIfNull: false)
  Map<OpenFoodFactsLanguage, List<String>>? synonyms;

  @override
  String toString() => toJson().toString();
}

/// Configuration for nova API query.
class TaxonomyNovaQueryConfiguration
    extends TaxonomyQueryConfiguration<TaxonomyNova, TaxonomyNovaField> {
  TaxonomyNovaQueryConfiguration.roots({
    List<OpenFoodFactsLanguage>? languages,
    OpenFoodFactsCountry? country,
  }) : super.roots(
          TagType.NOVA,
          languages: languages,
          country: country,
          includeChildren: false,
          fields: const [],
          additionalParameters: const [],
        );

  @override
  Map<String, TaxonomyNova> convertResults(dynamic jsonData) {
    if (jsonData is! Map<String, dynamic>) {
      return const {};
    }
    return jsonData.map<String, TaxonomyNova>((String key, dynamic taxonomy) {
      if (taxonomy is! Map<String, dynamic>) {
        assert(false, 'Received JSON Nova is not a Map');
        return MapEntry(key, TaxonomyNova.fromJson({}));
      }
      return MapEntry(key, TaxonomyNova.fromJson(taxonomy));
    });
  }

  @override
  Set<TaxonomyNovaField> get ignoredFields => const {TaxonomyNovaField.ALL};

  @override
  Iterable<String> convertFieldsToStrings(Iterable<TaxonomyNovaField> fields) =>
      fields
          .where((TaxonomyNovaField field) => !ignoredFields.contains(field))
          .map<String>((TaxonomyNovaField field) => field.offTag);
}
