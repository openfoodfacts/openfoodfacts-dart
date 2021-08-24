import 'package:openfoodfacts/utils/QueryType.dart';

class OpenFoodAPISettings {
  static OpenFoodAPISettings? instance;

  OpenFoodAPISettings({
    this.scheme,
    this.host,
    this.robotoffHost,
  });

  OpenFoodAPISettings.fromQueryType(final QueryType? queryType)
      : this(
          scheme: _URI_SCHEME_HTTPS,
          host: queryType == QueryType.PROD ? _URI_HOST_PROD : _URI_HOST_TEST,
          robotoffHost: queryType == QueryType.PROD
              ? _URI_ROBOTOFF_HOST_PROD
              : _URI_ROBOTOFF_HOST_TEST,
        );

  final String? scheme;
  final String? host;
  final String? robotoffHost;

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
