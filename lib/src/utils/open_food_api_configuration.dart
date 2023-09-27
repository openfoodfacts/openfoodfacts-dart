import '../model/user.dart';
import '../model/user_agent.dart';
import 'country_helper.dart';
import 'http_helper.dart';
import 'language_helper.dart';
import 'uri_helper.dart';

/// Allows to configure the behavior of the package.
///
/// All of the values are static, they only need to be set once at the
/// beginning of the lifecycle of the app. They can be changed at any
/// point later. Some methods allow to pass configurations which can be
/// also set here, in these cases, the most local value is used.
/// E.g.
///
/// ```dart
///   OpenFoodAPIConfiguration.userAgent = UserAgent(
///     name: '<Name of your app>',
///   );
///
///   OpenFoodAPIConfiguration.globalLanguages = <OpenFoodFactsLanguage>[
///     OpenFoodFactsLanguage.ENGLISH,
///   ];
///
///   // Uses german
///   OpenFoodAPIClient.getProductUri(
///     '0000000',
///     language: OpenFoodFactsLanguage.GERMAN,
///     ....
///   );
///
///   // Uses english again
///   OpenFoodAPIClient.getProductUri(
///       '0000000',
///       ....
///   );
/// ```
///
class OpenFoodAPIConfiguration {
  OpenFoodAPIConfiguration._();

  ///Defines a global userAgent to tell the backend the source of the request.
  static UserAgent? userAgent;

  ///Defines a global uuid to tell the backend the source of the request.
  static String? uuid;

  ///Defines a global user to avoid adding it to every request
  static User? globalUser;

  ///A global way to specify the languages for queries, can be overwritten
  /// for each individual request by specifying the languages in the
  /// individual request configurations
  static List<OpenFoodFactsLanguage>? globalLanguages;

  ///A global way to specify the country code for queries, can be overwritten
  /// for each individual request by specifying the country code in the
  /// individual request configurations
  static OpenFoodFactsCountry? globalCountry;

  ///Returns the [User] to use, using a default value
  static User? getUser(final User? user) => user ?? globalUser;

  /// Returns the most relevant country code
  static String? computeCountryCode(
    final OpenFoodFactsCountry? country,
    final String? cc,
  ) {
    if (country != null) {
      return country.offTag;
    }
    if (globalCountry != null) {
      return globalCountry!.offTag;
    }
    if (cc != null) {
      return cc;
    }
    return null;
  }
}

/// Uri of the main requests to the backend (OFF).
const UriProductHelper uriHelperFoodProd = UriProductHelper(
  domain: 'openfoodfacts.org',
);

/// Uri of the test requests to the backend (OFF).
const UriProductHelper uriHelperFoodTest = UriProductHelper(
  domain: 'openfoodfacts.net',
  userInfoForPatch: HttpHelper.userInfoForTest,
  isTestMode: true,
);

/// Uri of the main requests to the backend (RobotOff).
const UriHelper uriHelperRobotoffProd = UriHelper(
  host: 'robotoff.openfoodfacts.org',
);

/// Uri of the test requests to the backend (RobotOff).
const UriHelper uriHelperRobotoffTest = UriHelper(
  host: 'robotoff.openfoodfacts.net',
  isTestMode: true,
);

/// Uri of the main requests to the backend (Folksonomy).
const UriHelper uriHelperFolksonomyProd = UriHelper(
  host: 'api.folksonomy.openfoodfacts.org',
);

/// Uri of the test requests to the backend (Folksonomy) - does not work :-(
const UriHelper uriHelperFolksonomyTest = UriHelper(
  host: 'api.folksonomy.openfoodfacts.net',
  isTestMode: true,
);

/// Uri of the main requests to the backend (Events).
const UriHelper uriHelperEventsProd = UriHelper(
  host: 'events.openfoodfacts.org',
);

/// Uri of the test requests to the backend (Events).
const UriHelper uriHelperEventsTest = UriHelper(
  host: 'events.openfoodfacts.net',
  isTestMode: true,
);
