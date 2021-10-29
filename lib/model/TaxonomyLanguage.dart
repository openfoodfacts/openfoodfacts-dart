import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/interface/JsonObject.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/TaxonomyQueryConfiguration.dart';
import 'package:openfoodfacts/utils/TagType.dart';

part 'TaxonomyLanguage.g.dart';

/// Fields of an [TaxonomyLanguage]
enum TaxonomyLanguageField {
  ALL,
  LANGUAGE_CODE_2,
  LANGUAGE_CODE_3,
  NAME,
  WIKIDATA,
}

extension TaxonomyLanguageFieldExtension on TaxonomyLanguageField {
  static const Map<TaxonomyLanguageField, String> _KEYS = {
    TaxonomyLanguageField.ALL: 'all',
    TaxonomyLanguageField.LANGUAGE_CODE_2: 'language_code_2',
    TaxonomyLanguageField.LANGUAGE_CODE_3: 'language_code_3',
    TaxonomyLanguageField.NAME: 'name',
    TaxonomyLanguageField.WIKIDATA: 'wikidata',
  };

  /// Returns the key of the Language field
  String get key => _KEYS[this] ?? '';
}

/// A JSON-serializable version of a Language taxonomy result.
///
/// See [OpenFoodAPIClient.getTaxonomy] for more details on how to retrieve one
/// of these.
@JsonSerializable()
class TaxonomyLanguage extends JsonObject {
  TaxonomyLanguage(
    this.children,
    this.languageCode2,
    this.languageCode3,
    this.name,
    this.parents,
    this.wikidata,
  );

  factory TaxonomyLanguage.fromJson(Map<String, dynamic> json) {
    return _$TaxonomyLanguageFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TaxonomyLanguageToJson(this);
  }

  @JsonKey(name: 'children', includeIfNull: false)
  List<String>? children;
  @JsonKey(
    name: 'language_code_2',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? languageCode2;
  @JsonKey(
    name: 'language_code_3',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? languageCode3;
  @JsonKey(
    name: 'name',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? name;
  @JsonKey(name: 'parents', includeIfNull: false)
  List<String>? parents;
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

class TaxonomyLanguageQueryConfiguration extends TaxonomyQueryConfiguration<
    TaxonomyLanguage, TaxonomyLanguageField> {
  TaxonomyLanguageQueryConfiguration({
    required List<String> tags,
    List<OpenFoodFactsLanguage>? languages = const [],
    String? cc,
    List<TaxonomyLanguageField> fields = const [],
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
  Map<String, TaxonomyLanguage> convertResults(dynamic jsonData) {
    if (jsonData is! Map<String, dynamic>) {
      return const {};
    }
    return jsonData
        .map<String, TaxonomyLanguage>((String key, dynamic taxonomy) {
      if (taxonomy is! Map<String, dynamic>) {
        assert(false, 'Received JSON Language is not a Map');
        return MapEntry(key, TaxonomyLanguage.fromJson({}));
      }
      return MapEntry(key, TaxonomyLanguage.fromJson(taxonomy));
    });
  }

  @override
  Set<TaxonomyLanguageField> get ignoredFields =>
      const {TaxonomyLanguageField.ALL};

  @override
  Iterable<String> convertFieldsToStrings(
      Iterable<TaxonomyLanguageField> fields) {
    return fields
        .where((TaxonomyLanguageField field) => !ignoredFields.contains(field))
        .map<String>((TaxonomyLanguageField field) => field.key);
  }
}
