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

  AbstractQueryConfiguration({
    this.language,
    this.languages,
    this.lc,
    this.cc,
    this.fields,
  }) {
    fields ??= [ProductField.ALL];
    if (languages != null) {
      if ((language != null || lc != null) && languages!.isNotEmpty) {
        throw ArgumentError(
            '[languages] cannot be used together with [language]/[lc]');
      }
    }
  }

  /// Returns the corresponding API URI parameter map
  Map<String, String> getParametersMap() {
    final Map<String, String> result = {};
    late List<OpenFoodFactsLanguage> languages;

    if (language != null) {
      languages = [language!];
    } else if (this.languages != null && this.languages!.isNotEmpty) {
      languages = this.languages!.toList();
    } else if (OpenFoodAPIConfiguration.globalLanguages != null) {
      languages = OpenFoodAPIConfiguration.globalLanguages!;
    } else {
      languages = const <OpenFoodFactsLanguage>[];
    }

    if (languages.isNotEmpty) {
      result.putIfAbsent('lc', () => languages.map((e) => e.code).join(','));
    } else if (lc != null) {
      result.putIfAbsent('lc', () => lc!);
    }

    if (cc != null) {
      result.putIfAbsent('cc', () => cc!);
    }

    if (fields != null) {
      final bool ignoreFieldsFilter = fields!.any(
        (field) => field == ProductField.ALL,
      );
      if (!ignoreFieldsFilter) {
        final fieldsStrings = convertFieldsToStrings(fields!, languages);
        result.putIfAbsent('fields', () => fieldsStrings.join(','));
      }
    }

    return result;
  }
}
