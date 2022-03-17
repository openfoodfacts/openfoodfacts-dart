import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';

import 'QueryType.dart';

///Helper class for constructing urls with the in the [OpenFoodAPIConfiguration] specified settings
class UriHelper {
  UriHelper._();

  /// Returns a OFF uri with the [OpenFoodAPIConfiguration] specified settings
  ///
  /// Typical use-case of "[addUserAgentParameters] = false" is for other
  /// request than GET, e.g. POST or MULTIPART, where we add the user agent
  /// parameters in another part of the code.
  static Uri getUri({
    required final String path,
    final Map<String, String>? queryParameters,
    final QueryType? queryType,
    final bool addUserAgentParameters = true,
  }) =>
      Uri(
        scheme: OpenFoodAPIConfiguration.uriScheme,
        host: OpenFoodAPIConfiguration.getQueryType(queryType) == QueryType.PROD
            ? OpenFoodAPIConfiguration.uriProdHost
            : OpenFoodAPIConfiguration.uriTestHost,
        path: path,
        queryParameters: addUserAgentParameters
            ? HttpHelper.addUserAgentParameters(queryParameters)
            : queryParameters,
      );

  static Uri getPostUri({
    required final String path,
    final QueryType? queryType,
  }) =>
      getUri(path: path, queryType: queryType, addUserAgentParameters: false);

  ///Returns a OFF-Robotoff uri with the in the [OpenFoodAPIConfiguration] specified settings
  static Uri getRobotoffUri({
    required final String path,
    final Map<String, dynamic>? queryParameters,
    final QueryType? queryType,
  }) =>
      Uri(
        scheme: OpenFoodAPIConfiguration.uriScheme,
        host: OpenFoodAPIConfiguration.getQueryType(queryType) == QueryType.PROD
            ? OpenFoodAPIConfiguration.uriProdHostRobotoff
            : OpenFoodAPIConfiguration.uriTestHostRobotoff,
        path: path,
        queryParameters: queryParameters,
      );

  ///Returns a OFF-Folksonomy uri with the in the [OpenFoodAPIConfiguration] specified settings
  static Uri getFolksonomyUri({
    required final String path,
    final Map<String, dynamic>? queryParameters,
    final QueryType? queryType,
  }) =>
      Uri(
        scheme: OpenFoodAPIConfiguration.uriScheme,
        host: OpenFoodAPIConfiguration.getQueryType(queryType) == QueryType.PROD
            ? OpenFoodAPIConfiguration.uriProdHostFolksonomy
            : OpenFoodAPIConfiguration.uriTestHostFolksonomy,
        path: path,
        queryParameters: queryParameters,
      );

  ///Returns a OFF-Events uri with the in the [OpenFoodAPIConfiguration] specified settings
  static Uri getEventsUri({
    required final String path,
    final Map<String, dynamic>? queryParameters,
    final QueryType? queryType,
  }) =>
      Uri(
        scheme: OpenFoodAPIConfiguration.uriScheme,
        host: OpenFoodAPIConfiguration.getQueryType(queryType) == QueryType.PROD
            ? OpenFoodAPIConfiguration.uriProdHostEvents
            : OpenFoodAPIConfiguration.uriTestHostEvents,
        path: path,
        queryParameters: queryParameters,
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
        countryCode: country?.iso2Code ??
            OpenFoodAPIConfiguration.globalCountry?.iso2Code,
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
