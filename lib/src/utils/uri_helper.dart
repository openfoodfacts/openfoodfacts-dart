import 'country_helper.dart';
import 'http_helper.dart';
import 'language_helper.dart';
import 'open_food_api_configuration.dart';

///Helper class for constructing urls with the in the [OpenFoodAPIConfiguration] specified settings
class UriHelper {
  const UriHelper({
    required this.host,
    this.scheme = 'https',
    this.isTestMode = false,
    this.defaultAddUserAgentParameters = false,
  });

  final String host;
  final String scheme;
  final bool isTestMode;
  final bool defaultAddUserAgentParameters;

  /// Returns a OFF uri with the [OpenFoodAPIConfiguration] specified settings
  ///
  /// Typical use-case of "[addUserAgentParameters] = false" is for other
  /// request than GET, e.g. POST or MULTIPART, where we add the user agent
  /// parameters in another part of the code.
  Uri getUri({
    required final String path,
    final Map<String, dynamic>? queryParameters,
    final bool? addUserAgentParameters,
    final String? userInfo,
    final String? forcedHost,
  }) =>
      Uri(
        scheme: scheme,
        host: forcedHost ?? host,
        path: path,
        queryParameters: addUserAgentParameters ?? defaultAddUserAgentParameters
            ? HttpHelper.addUserAgentParameters(queryParameters)
            : queryParameters,
        userInfo: userInfo,
      );

  Uri getPostUri({
    required final String path,
  }) =>
      getUri(
        path: path,
        addUserAgentParameters: false,
      );

  /// Replaces the subdomain of an URI with specific country and language.
  ///
  /// Default language and country will be used as fallback, if available.
  /// For instance
  /// * https://world.xxx... would be standard
  /// * https://world-fr.xxx... would be "standard country" in French
  /// * https://fr.xxx... would be France
  /// * https://fr-es.xxx... would be France in Spanish
  static Uri replaceSubdomain(
    final Uri uri, {
    OpenFoodFactsLanguage? language,
    OpenFoodFactsCountry? country,
  }) =>
      replaceSubdomainWithCodes(
        uri,
        languageCode: language?.code ??
            (OpenFoodAPIConfiguration.globalLanguages != null &&
                    OpenFoodAPIConfiguration.globalLanguages!.isNotEmpty
                ? OpenFoodAPIConfiguration.globalLanguages![0].code
                : null),
        countryCode:
            country?.offTag ?? OpenFoodAPIConfiguration.globalCountry?.offTag,
      );

  /// Replaces the subdomain of an URI with specific country and language.
  ///
  /// No default language nor country: null means no parameter.
  /// For instance
  /// * https://world.xxx... would be standard
  /// * https://world-fr.xxx... would be "no country" in French
  /// * https://fr.xxx... would be France
  /// * https://fr-es.xxx... would be France in Spanish
  static Uri replaceSubdomainWithCodes(
    final Uri uri, {
    final String? languageCode,
    String? countryCode,
  }) {
    final String initialSubdomain = uri.host.split('.')[0];
    countryCode = countryCode ?? initialSubdomain;
    final String subdomain;
    if (languageCode != null) {
      subdomain = '$countryCode-$languageCode';
    } else {
      subdomain = countryCode;
    }
    return uri.replace(
      host: uri.host.replaceFirst('$initialSubdomain.', '$subdomain.'),
    );
  }
}

/// [UriHelper] specific for products (e.g. off, obf, opf, opff).
class UriProductHelper extends UriHelper {
  const UriProductHelper({
    required this.domain,
    super.scheme = 'https',
    super.isTestMode = false,
    this.userInfoForPatch,
    super.defaultAddUserAgentParameters = true,
  }) : super(host: 'world.$domain');

  final String? userInfoForPatch;

  final String domain;

  /// Returns the product images folder (without trailing '/').
  String getImageUrlBase() => '$scheme://images.$domain/images/products';

  String getHost(final String subdomain) => '$subdomain.$domain';

  Uri getPatchUri({
    required final String path,
  }) =>
      getUri(
        path: path,
        addUserAgentParameters: false,
        userInfo: userInfoForPatch,
      );

  /// Returns the web folder of the product images (without trailing '/')
  ///
  /// E.g. "https://images.openfoodfacts.org/images/products/359/671/046/2858"
  String getProductImageRootUrl(final String barcode) =>
      '${getImageUrlBase()}/${getBarcodeSubPath(barcode)}';

  /// Returns the barcode sub-folder (without trailing '/').
  ///
  /// For instance:
  /// * `12345678` for barcode `12345678`
  /// * `123/456/789` for barcode `123456789`
  /// * `123/456/789/0` for barcode `1234567890`
  /// * `123/456/789/0123` for barcode `1234567890123`
  static String getBarcodeSubPath(final String barcode) {
    if (barcode.length < 9) {
      return barcode;
    }
    final String p1 = barcode.substring(0, 3);
    final String p2 = barcode.substring(3, 6);
    final String p3 = barcode.substring(6, 9);
    if (barcode.length == 9) {
      return '$p1/$p2/$p3';
    }
    final String p4 = barcode.substring(9);
    return '$p1/$p2/$p3/$p4';
  }
}
