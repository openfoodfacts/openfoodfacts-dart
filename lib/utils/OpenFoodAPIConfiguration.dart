import 'package:openfoodfacts/model/UserAgent.dart';

import 'QueryType.dart';

class OpenFoodAPIConfiguration {
  OpenFoodAPIConfiguration._();

  static UserAgent? userAgent;

  static String uriScheme = 'https';
  static String uriProdHost = 'world.openfoodfacts.org';
  static String uriTestHost = 'world.openfoodfacts.net';

  static String uriProdHostRobotoff = 'robotoff.openfoodfacts.org';
  static String uriTestHostRobotoff = 'robotoff.openfoodfacts.net';

  static QueryType globalQueryType = QueryType.PROD;
}
