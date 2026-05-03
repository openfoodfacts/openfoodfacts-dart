import '../utils/country_helper.dart';
import '../utils/language_helper.dart';
import 'external_source_filter.dart';
import 'json_map.dart';

/// External Source Metadata.
class ExternalSourceMetadata extends JsonMap {
  ExternalSourceMetadata(super.jsonMap);

  /// ID
  ///
  /// e.g. "empreinte_souffrance"
  String get id => jsonMap['id'] as String;

  /// Localized name
  ///
  /// e.g. "Suffering Fingerprint"
  String get name => jsonMap['name'] as String;

  /// e.g. `{"categories":["en:eggs"],"product_types":["food"],"countries":[],"languages":[]}`
  ExternalSourceFilter get filter => ExternalSourceFilter(jsonMap['filters']);

  /// Localized description
  ///
  /// e.g. "Indicator of animal suffering computed by product"
  String get description => jsonMap['description'] as String;

  /// e.g. "https://lheuredescomptes.org/logo_ES_alpha.svg"
  String get iconUrl => jsonMap['icon_url'] as String;

  /// e.g. "https://api.lheuredescomptes.org/off/v1/knowledge-panel/$code?lang=$lc&country=$cc"
  String get knowledgePanelUrl => jsonMap['knowledge_panel_url'] as String;

  String get privacyPolicyUrl => jsonMap['privacy_policy_url'] as String;

  /// e.g. "l'Heure des Comptes"
  String get providerName => jsonMap['provider_name'] as String;

  /// e.g. ""https://lheuredescomptes.org/"
  String get providerWebsite => jsonMap['provider_website'] as String;

  /// e.g. "moderators"
  String get scope => jsonMap['scope'] as String;

  /// e.g. "animal_welfare"
  String get section => jsonMap['section'] as String;

  /// Localized section title.
  ///
  /// e.g. "Animal welfare"
  String get sectionTitle => jsonMap['section_title'] as String;

  bool get userInScope => jsonMap['user_in_scope'] as bool;

  /// Returns the URL to product data.
  String getProductUrl(
    final String barcode,
    final OpenFoodFactsLanguage language,
    final OpenFoodFactsCountry country,
  ) => knowledgePanelUrl
      .replaceFirst(r'$code', barcode)
      .replaceFirst(r'$lc', language.offTag)
      .replaceFirst(r'$cc', country.offTag);
}
