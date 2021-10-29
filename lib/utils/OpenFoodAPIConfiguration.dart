import 'package:openfoodfacts/model/UserAgent.dart';

import 'LanguageHelper.dart';
import 'QueryType.dart';

///Allows to configure the behavior of the package,
///for example to set a global [UserAgent]
///or to point the url to a self hosted instance of the backend.
class OpenFoodAPIConfiguration {
  OpenFoodAPIConfiguration._();

  ///Defines a global userAgent to tell the backend the source of the request.
  static UserAgent? userAgent;

  ///change the uriScheme of the requests
  static String uriScheme = 'https';

  ///Uri host of the main requests to the backend, modify this to direct the request to a self-hosted instance.
  static String uriProdHost = 'world.openfoodfacts.org';

  ///Uri host of the test requests to the backend
  static String uriTestHost = 'world.openfoodfacts.net';

  ///Uri host of the Robotoff requests to the backend, modify this to direct the request to a self-hosted instance.
  static String uriProdHostRobotoff = 'robotoff.openfoodfacts.org';

  ///Uri host of the test requests to Robotoff
  static String uriTestHostRobotoff = 'robotoff.openfoodfacts.net';

  ///Changes whether the requests sent by this package to the test or main server.
  static QueryType globalQueryType = QueryType.PROD;

  ///A global way to specify the languages for queries, can be overwritten
  /// for each individual request by specifying the languages in the
  /// individual request configurations
  static List<OpenFoodFactsLanguage>? globalLanguages;

  ///A global way to specify the country code for queries, can be overwritten
  /// for each individual request by specifying the country code in the
  /// individual request configurations
  static String? globalCC;

  ///Returns the [QueryType] to use, using a default value
  static QueryType getQueryType(final QueryType? queryType) =>
      queryType ?? globalQueryType;
}
