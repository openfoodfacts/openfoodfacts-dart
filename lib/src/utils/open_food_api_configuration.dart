import 'country_helper.dart';
import 'language_helper.dart';
import 'query_type.dart';
import '../model/user.dart';
import '../model/user_agent.dart';

///Allows to configure the behavior of the package,
///for example to set a global [UserAgent]
///or to point the url to a self hosted instance of the backend.
class OpenFoodAPIConfiguration {
  OpenFoodAPIConfiguration._();

  ///Defines a global userAgent to tell the backend the source of the request.
  static UserAgent? userAgent;

  ///Defines a global uuid to tell the backend the source of the request.
  static String? uuid;

  ///Defines a global user to avoid adding it to every request
  static User? globalUser;

  ///change the uriScheme of the requests
  static String uriScheme = 'https';

  ///Uri host of the main requests to the backend, modify this to direct the request to a self-hosted instance.
  static String uriProdHost = 'world.openfoodfacts.org';

  ///Uri host of the test requests to the backend
  static String uriTestHost = 'world.openfoodfacts.net';

  ///Url base for images in prod: needs to match the domain of uriProdHost
  static String imageProdUrlBase =
      'https://static.openfoodfacts.org/images/products/';

  ///Url base for images in test: needs to match the domain of uriTestHost
  static String imageTestUrlBase =
      'https://static.openfoodfacts.net/images/products/';

  ///Uri host of the Robotoff requests to the backend, modify this to direct the request to a self-hosted instance.
  static String uriProdHostRobotoff = 'robotoff.openfoodfacts.org';

  ///Uri host of the test requests to Robotoff
  static String uriTestHostRobotoff = 'robotoff.openfoodfacts.net';

  ///Uri host of the Folksonomy requests to the backend, modify this to direct the request to a self-hosted instance.
  static String uriProdHostFolksonomy = 'api.folksonomy.openfoodfacts.org';

  ///Uri host of the test requests to Folksonomy
  static String uriTestHostFolksonomy =
      'api.folksonomy.openfoodfacts.net'; // TODO does not work

  ///Uri host of the Events requests to the backend, modify this to direct the request to a self-hosted instance.
  static String uriProdHostEvents = 'events.openfoodfacts.org';

  ///Uri host of the test requests to Events
  static String uriTestHostEvents = 'events.openfoodfacts.net';

  ///Changes whether the requests sent by this package to the test or main server.
  static QueryType globalQueryType = QueryType.PROD;

  ///A global way to specify the languages for queries, can be overwritten
  /// for each individual request by specifying the languages in the
  /// individual request configurations
  static List<OpenFoodFactsLanguage>? globalLanguages;

  ///A global way to specify the country code for queries, can be overwritten
  /// for each individual request by specifying the country code in the
  /// individual request configurations
  static OpenFoodFactsCountry? globalCountry;

  ///Returns the [QueryType] to use, using a default value
  static QueryType getQueryType(final QueryType? queryType) =>
      queryType ?? globalQueryType;

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
