import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';

/// Abstract Query Configuration, that helps build API URI
abstract class AbstractQueryConfiguration {
  OpenFoodFactsLanguage? language;

  /// The [extraLanguages] field should be used when a product is requested
  /// with fields in multiple languages. I.e. when some of the
  /// `IN_LANGS` fields are used (e.g. [ProductField.NAME_IN_LANGS]).
  ///
  /// However, the `IN_LANGS` fields are also compatible with the [language]
  /// and [lc] fields - if only 1 language is needed, [extraLanguages] can
  /// be omitted.
  List<OpenFoodFactsLanguage> extraLanguages;
  // Allow apps to directly provide the language code and country code without
  // having to use the OpenFoodFactsLanguage helper.
  String? lc;
  String? cc;
  List<ProductField>? fields;

  AbstractQueryConfiguration({
    this.language,
    this.extraLanguages = const [],
    this.lc,
    this.cc,
    this.fields,
  }) {
    fields ??= [ProductField.ALL];
  }

  /// Returns the corresponding API URI parameter map
  Map<String, String> getParametersMap() {
    final Map<String, String> result = {};

    if (language != null) {
      result.putIfAbsent('lc', () => language.code);
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
        final languages = extraLanguages.toList();
        if (language != null && !languages.contains(language)) {
          languages.insert(0, language!);
        }
        final lcLanguage = LanguageHelper.fromJson(lc);
        if (lcLanguage != OpenFoodFactsLanguage.UNDEFINED &&
            !languages.contains(lcLanguage)) {
          languages.insert(0, lcLanguage);
        }
        final fieldsStrings = convertFieldsToStrings(fields!, languages);
        result.putIfAbsent('fields', () => fieldsStrings.join(','));
      }
    }

    return result;
  }
}
