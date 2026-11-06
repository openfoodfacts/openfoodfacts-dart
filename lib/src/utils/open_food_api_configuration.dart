import '../model/user.dart';
import '../model/user_agent.dart';
import 'country_helper.dart';
import 'http_helper.dart';
import 'language_helper.dart';
import 'uri_helper.dart';

/// Returns a bearer (OIDC/Keycloak) token for ProductOpener requests.
///
/// The app is responsible for obtaining and refreshing the token
/// (e.g. with the `openidconnect` package in smooth-app) and exposing it here.
/// Returning null means "unauthenticated".
typedef BearerTokenProvider = Future<String?> Function();

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

  ///Defines a global bearer token (OIDC/Keycloak) to avoid adding it to
  /// every ProductOpener request.
  ///
  /// ProductOpener-scoped only: Folksonomy and Open Prices use their own
  /// distinct bearer tokens, passed explicitly per request, and never read
  /// this value. [HttpHelper] performs no global bearer fallback.
  ///
  /// When both [globalUser] (user/password) and a bearer token are available,
  /// the bearer token takes precedence for ProductOpener requests.
  /// Required scopes are `products:read` and/or `products:write`.
  static String? globalBearerToken;

  ///Optional provider that returns a ProductOpener bearer token on demand.
  ///
  /// This is the recommended injection point for apps that manage OIDC tokens
  /// themselves (e.g. smooth-app with the `openidconnect` package):
  /// the package stays dependency-free, the app supplies (and refreshes)
  /// the token through this callback.
  /// An explicit per-request `bearerToken` parameter always wins over
  /// [globalBearerToken], which itself wins over this provider.
  /// ProductOpener-scoped only, like [globalBearerToken].
  static BearerTokenProvider? bearerTokenProvider;

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

  /// Resolves the bearer token to use for a request.
  ///
  /// Precedence: explicit [bearerToken] parameter, then [globalBearerToken],
  /// then [bearerTokenProvider].
  /// Returns null when unauthenticated.
  /// Empty strings are treated like null (absent).
  static Future<String?> getBearerToken(final String? bearerToken) async {
    if (bearerToken != null && bearerToken.isNotEmpty) {
      return bearerToken;
    }
    if (globalBearerToken != null && globalBearerToken!.isNotEmpty) {
      return globalBearerToken;
    }
    final BearerTokenProvider? provider = bearerTokenProvider;
    if (provider != null) {
      final String? provided = await provider();
      if (provided != null && provided.isNotEmpty) {
        return provided;
      }
    }
    return null;
  }

  /// Synchronous version of [getBearerToken], without calling
  /// [bearerTokenProvider] (which is async).
  ///
  /// Useful in synchronous contexts like HTTP header building; async
  /// callers that need provider support should use [getBearerToken].
  /// Empty strings are treated like null (absent).
  static String? getBearerTokenSync(final String? bearerToken) {
    if (bearerToken != null && bearerToken.isNotEmpty) {
      return bearerToken;
    }
    if (globalBearerToken != null && globalBearerToken!.isNotEmpty) {
      return globalBearerToken;
    }
    return null;
  }

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

const UriProductHelper uriHelperProductsProd = UriProductHelper(
  domain: 'openproductsfacts.org',
);

const UriProductHelper uriHelperBeautyProd = UriProductHelper(
  domain: 'openbeautyfacts.org',
);

const UriProductHelper uriHelperPetFoodProd = UriProductHelper(
  domain: 'openpetfoodfacts.org',
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
