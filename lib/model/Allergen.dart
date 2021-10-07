import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/interface/JsonObject.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/TaxonomyQueryConfiguration.dart';
import 'package:openfoodfacts/utils/TaxonomyType.dart';

part 'Allergen.g.dart';

/// Fields of an [Allergen]
enum AllergenField {
  ALL,
  NAME,
  SYNONYMS,
  WIKIDATA,
}

extension AllergenFieldExtension on AllergenField {
  static const Map<AllergenField, String> _KEYS = <AllergenField, String>{
    AllergenField.ALL: 'all',
    AllergenField.NAME: 'name',
    AllergenField.SYNONYMS: 'synonyms',
    AllergenField.WIKIDATA: 'wikidata',
  };

  /// Returns the key of the Allergen field
  String get key => _KEYS[this] ?? '';
}

/// A JSON-serializable version of a Allergen taxonomy result.
///
/// See [OpenFoodAPIClient.getTaxonomy] for more details on how to retrieve one
/// of these.
@JsonSerializable()
class Allergen extends JsonObject {
  Allergen(
    this.name,
    this.synonyms,
    this.wikidata,
  );

  factory Allergen.fromJson(Map<String, dynamic> json) {
    return _$AllergenFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$AllergenToJson(this);
  }

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

  @override
  String toString() => toJson().toString();
}

class AllergenQueryConfiguration
    extends TaxonomyQueryConfiguration<Allergen, AllergenField> {
  AllergenQueryConfiguration({
    required List<String> tags,
    List<OpenFoodFactsLanguage>? languages = const [],
    String? cc,
    List<AllergenField> fields = const [],
    List<Parameter> additionalParameters = const [],
  }) : super(
          TaxonomyType.ALLERGENS,
          tags,
          languages: languages,
          cc: cc,
          includeChildren: false,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  @override
  Map<String, Allergen> convertResults(dynamic jsonData) {
    if (jsonData is! Map<String, dynamic>) {
      return const {};
    }
    return jsonData.map<String, Allergen>((String key, dynamic taxonomy) {
      if (taxonomy is! Map<String, dynamic>) {
        assert(false, 'Received JSON Allergen is not a Map');
        return MapEntry(key, Allergen.fromJson({}));
      }
      return MapEntry(key, Allergen.fromJson(taxonomy));
    });
  }

  @override
  Set<AllergenField> get ignoredFields => const {AllergenField.ALL};

  @override
  Iterable<String> convertFieldsToStrings(Iterable<AllergenField> fields) {
    return fields
        .where((AllergenField field) => !ignoredFields.contains(field))
        .map<String>((AllergenField field) => field.key);
  }
}
