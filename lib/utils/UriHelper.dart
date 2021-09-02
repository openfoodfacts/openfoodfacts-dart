import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';

import 'QueryType.dart';

class UriHelper {
  UriHelper._();

  static Uri getUri({
    String? path,
    Map<String, dynamic>? queryParameters,
    QueryType? queryType,
  }) {
    return Uri(
      scheme: OpenFoodAPIConfiguration.uriScheme,
      host: (queryType ?? OpenFoodAPIConfiguration.globalQueryType) ==
              QueryType.PROD
          ? OpenFoodAPIConfiguration.uriProdHost
          : OpenFoodAPIConfiguration.uriTestHost,
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
      scheme: OpenFoodAPIConfiguration.uriScheme,
      host: (queryType ?? OpenFoodAPIConfiguration.globalQueryType) ==
              QueryType.PROD
          ? OpenFoodAPIConfiguration.uriProdHostRobotoff
          : OpenFoodAPIConfiguration.uriTestHostRobotoff,
      path: path,
      queryParameters: queryParameters,
    );
  }
}
