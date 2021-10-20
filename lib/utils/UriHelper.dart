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
}
