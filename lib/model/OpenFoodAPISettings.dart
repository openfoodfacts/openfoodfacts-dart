import 'package:openfoodfacts/utils/QueryType.dart';

class OpenFoodAPISettings {
  static OpenFoodAPISettings instance = OpenFoodAPISettings();

  OpenFoodAPISettings({
    this.scheme,
    this.host,
    this.robotoffHost,
    this.globalQueryType = QueryType.PROD,
  });

  OpenFoodAPISettings.fromQueryType(final QueryType? queryType)
      : this(
          scheme: instance.scheme ?? _URI_SCHEME_HTTPS,
          host: (queryType ?? instance.globalQueryType) == QueryType.PROD
              ? instance.host ?? _URI_HOST_PROD
              : instance.host ?? _URI_HOST_TEST,
          robotoffHost:
              (queryType ?? instance.globalQueryType) == QueryType.PROD
                  ? instance.robotoffHost ?? _URI_ROBOTOFF_HOST_PROD
                  : instance.robotoffHost ?? _URI_ROBOTOFF_HOST_TEST,
        );

  final String? scheme;
  final String? host;
  final String? robotoffHost;
  final QueryType globalQueryType;

  static const String _URI_SCHEME_HTTPS = 'https';
  static const String _URI_HOST_PROD = 'world.openfoodfacts.org';
  static const String _URI_HOST_TEST = 'world.openfoodfacts.net';

  static const String _URI_ROBOTOFF_HOST_PROD = 'robotoff.openfoodfacts.org';
  static const String _URI_ROBOTOFF_HOST_TEST = 'robotoff.openfoodfacts.net';

  Uri _getUri({
    required String path,
    required bool isRobotoff,
    Map<String, dynamic>? queryParameters,
  }) =>
      Uri(
        scheme: scheme,
        host: isRobotoff ? robotoffHost : host,
        path: path,
        queryParameters: queryParameters,
      );

  Uri getUri({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) =>
      _getUri(
        path: path,
        queryParameters: queryParameters,
        isRobotoff: false,
      );

  Uri getRobotoffUri({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) =>
      _getUri(
        path: path,
        queryParameters: queryParameters,
        isRobotoff: true,
      );
}
