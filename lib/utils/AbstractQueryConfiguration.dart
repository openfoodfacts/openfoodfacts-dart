import 'package:openfoodfacts/utils/LanguageHelper.dart';
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
  List<OpenFoodFactsLanguage> languages;

  /// Deprecated: please use [language] or [languages]
  @deprecated
  String? lc;

  String? cc;
  List<ProductField>? fields;

  AbstractQueryConfiguration({
    this.language,
    this.languages = const [],
    this.lc,
    this.cc,
    this.fields,
  }) {
    fields ??= [ProductField.ALL];
    if ((language != null || lc != null) && languages.isNotEmpty) {
      throw ArgumentError(
          '[languages] cannot be used together with [language]/[lc]');
    }
  }

  /// Returns the corresponding API URI parameter map
  Map<String, String> getParametersMap() {
    final Map<String, String> result = {};

    final languages = language != null ? [language!] : this.languages.toList();
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
