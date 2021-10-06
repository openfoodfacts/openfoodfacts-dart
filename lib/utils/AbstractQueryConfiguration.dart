import 'package:openfoodfacts/interface/Parameter.dart';
import 'package:openfoodfacts/model/parameter/TagFilter.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';

/// Abstract Query Configuration, that helps build API URI
abstract class AbstractQueryConfiguration {
  /// Use to set the desired product language. Cannot be used together with
  /// the [languages] field.
  /// See also the comment to the [languages] field.
  OpenFoodFactsLanguage? language;

  /// The [languages] field should be used when a product is requested
  /// with fields in multiple languages. I.e.:
  /// - when some of the `IN_LANGUAGES` fields are used
  ///   (e.g. [ProductField.NAME_IN_LANGUAGES]).
  /// - when Product's text fields are wanted to be filled with either
  ///   of several languages in prioritized manner
  ///
  /// However, the `IN_LANGUAGES` fields are also compatible with the [language]
  /// field - if only 1 language is needed, [language] can be used.
  ///
  /// Please see https://github.com/openfoodfacts/openfoodfacts-dart/blob/master/DOCUMENTATION.md#about-languages-mechanics
  /// for detailed explanation on how to work with multiple languages.
  List<OpenFoodFactsLanguage>? languages;

  // TODO: deprecated from 2021-07-20 (#185); remove when old enough
  @Deprecated('Use parameters language or languages instead')
  String? lc;

  String? cc;
  List<ProductField>? fields;

  List<Parameter> additionalParameters;

  AbstractQueryConfiguration({
    this.language,
    this.languages,
    this.lc,
    this.cc,
    this.fields,
    this.additionalParameters = const [],
  }) {
    fields ??= [ProductField.ALL];
    if (languages != null) {
      // ignore: deprecated_member_use_from_same_package
      if ((language != null || lc != null) && languages!.isNotEmpty) {
        throw ArgumentError(
            '[languages] cannot be used together with [language]/[lc]');
      }
    }
  }

  /// Returns the corresponding API URI parameter map
  Map<String, String> getParametersMap() {
    final Map<String, String> result = {};

    //the languages added to the query parameters, not named languages to avoid confusion
    late final List<OpenFoodFactsLanguage> queryLanguages;

    if (language != null) {
      queryLanguages = [language!];
    } else if (languages != null) {
      queryLanguages = languages!.toList();
    } else if (OpenFoodAPIConfiguration.globalLanguages != null) {
      queryLanguages = OpenFoodAPIConfiguration.globalLanguages!;
    } else {
      queryLanguages = const <OpenFoodFactsLanguage>[];
    }

    if (queryLanguages.isNotEmpty) {
      result.putIfAbsent(
          'lc', () => queryLanguages.map((e) => e.code).join(','));
      // ignore: deprecated_member_use_from_same_package
    } else if (lc != null) {
      // ignore: deprecated_member_use_from_same_package
      result.putIfAbsent('lc', () => lc!);
    }

    if (cc != null) {
      result.putIfAbsent('cc', () => cc!);
    } else if (OpenFoodAPIConfiguration.globalCC != null) {
      result.putIfAbsent('cc', () => OpenFoodAPIConfiguration.globalCC!);
    }

    if (fields != null) {
      final bool ignoreFieldsFilter = fields!.any(
        (field) => field == ProductField.ALL,
      );
      if (!ignoreFieldsFilter) {
        final fieldsStrings = convertFieldsToStrings(fields!, queryLanguages);
        result.putIfAbsent('fields', () => fieldsStrings.join(','));
      }
    }

    int filterTagCount = 0;
    for (final p in additionalParameters) {
      if (p is TagFilter) {
        TagFilter tf = p;
        result.putIfAbsent('tagtype_$filterTagCount', () => tf.getTagType());
        result.putIfAbsent(
            'tag_contains_$filterTagCount', () => tf.getContains());
        result.putIfAbsent('tag_$filterTagCount', () => tf.getTagName());
        filterTagCount++;
      } else {
        result.putIfAbsent(p.getName(), () => p.getValue());
      }
    }

    return result;
  }
}
