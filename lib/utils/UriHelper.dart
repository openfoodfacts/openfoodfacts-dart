import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';

import 'QueryType.dart';

///Helper class for constructing urls with the in the [OpenFoodAPIConfiguration] specified settings
class UriHelper {
  UriHelper._();

  ///Returns a OFF uri with the in the [OpenFoodAPIConfiguration] specified settings
  static Uri getUri({
    String? path,
    Map<String, dynamic>? queryParameters,
    QueryType? queryType,
  }) {
    return Uri(
      scheme: OpenFoodAPIConfiguration.uriScheme,
      host: OpenFoodAPIConfiguration.getQueryType(queryType) == QueryType.PROD
          ? OpenFoodAPIConfiguration.uriProdHost
          : OpenFoodAPIConfiguration.uriTestHost,
      path: path,
      queryParameters: queryParameters,
    );
  }

  ///Returns a OFF-Robotoff uri with the in the [OpenFoodAPIConfiguration] specified settings
  static Uri getRobotoffUri({
    String? path,
    Map<String, dynamic>? queryParameters,
    QueryType? queryType,
  }) {
    return Uri(
      scheme: OpenFoodAPIConfiguration.uriScheme,
      host: OpenFoodAPIConfiguration.getQueryType(queryType) == QueryType.PROD
          ? OpenFoodAPIConfiguration.uriProdHostRobotoff
          : OpenFoodAPIConfiguration.uriTestHostRobotoff,
      path: path,
      queryParameters: queryParameters,
    );
  }

  /// Replaces the subdomain of an URI with specific country and language
  ///
  /// For instance
  /// * https://world.xxx... would be standard
  /// * https://world-fr.xxx... would be "standard country" in French
  /// * https://fr.xxx... would be France
  /// * https://fr-es.xxx... would be France in Spanish
  static Uri replaceSubdomain(
    final Uri uri, {
    OpenFoodFactsLanguage? language,
    OpenFoodFactsCountry? country,
  }) {
    final String initialSubdomain = uri.host.split('.')[0];
    final String countryCode = country?.iso2Code ??
        OpenFoodAPIConfiguration.globalCountry?.iso2Code ??
        initialSubdomain;
    final String? languageCode = language?.code ??
        (OpenFoodAPIConfiguration.globalLanguages != null &&
                OpenFoodAPIConfiguration.globalLanguages!.isNotEmpty
            ? OpenFoodAPIConfiguration.globalLanguages![0].code
            : null);
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
