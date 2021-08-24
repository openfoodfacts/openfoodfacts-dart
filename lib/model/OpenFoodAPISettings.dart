import 'package:openfoodfacts/utils/QueryType.dart';

class OpenFoodAPISettings {
  OpenFoodAPISettings._();

  static String uriScheme = 'https';
  static String uriProdHost = 'world.openfoodfacts.org';
  static String uriTestHost = 'world.openfoodfacts.net';

  static String uriProdHostRobotoff = 'robotoff.openfoodfacts.org';
  static String uriTestHostRobotoff = 'robotoff.openfoodfacts.net';

  static QueryType globalQueryType = QueryType.PROD;

  static Uri getUri({
    String? path,
    Map<String, dynamic>? queryParameters,
    QueryType? queryType,
  }) {
    return Uri(
      scheme: uriScheme,
      host: (queryType ?? globalQueryType) == QueryType.PROD
          ? uriProdHost
          : uriTestHost,
      path: path,
      queryParameters: queryParameters,
    );
  }

  static Uri getRobotoffUri({
    String? path,
    Map<String, dynamic>? queryParameters,
    QueryType? queryType,
  }) {
    return Uri(
      scheme: uriScheme,
      host: (queryType ?? globalQueryType) == QueryType.PROD
          ? uriProdHostRobotoff
          : uriTestHostRobotoff,
      path: path,
      queryParameters: queryParameters,
    );
  }
}
