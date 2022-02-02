import 'package:openfoodfacts/model/UserAgent.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:openfoodfacts/utils/UriHelper.dart';
import 'package:test/test.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;

  test('Get Uri', () {
    OpenFoodAPIConfiguration.userAgent = null;
    OpenFoodAPIConfiguration.uuid = null;
    Uri uri = UriHelper.getUri(
      path: '/test/test.pl',
    );
    expect(
      uri.toString(),
      'https://world.openfoodfacts.org/test/test.pl',
    );

    Uri uri1 = UriHelper.getUri(
      path: '/test/test.pl',
      queryParameters: <String, String>{'test': 'true', 'queryType': 'PROD'},
    );
    expect(
      uri1.toString(),
      'https://world.openfoodfacts.org/test/test.pl?test=true&queryType=PROD',
    );
  });

  test('Get Uri with user agent', () {
    const String name = 'UserAgentName';
    const String version = '12';
    OpenFoodAPIConfiguration.userAgent =
        UserAgent(name: name, version: version);
    OpenFoodAPIConfiguration.uuid = null;
    Uri uri;

    uri = UriHelper.getUri(
      path: '/test/test.pl',
    );
    expect(
      uri.toString(),
      'https://world.openfoodfacts.org/test/test.pl?app_name=$name&app_version=$version',
    );

    uri = UriHelper.getUri(
      path: '/test/test.pl',
      queryParameters: <String, String>{'test': 'true', 'queryType': 'PROD'},
    );
    expect(
      uri.toString(),
      'https://world.openfoodfacts.org/test/test.pl?test=true&queryType=PROD&app_name=$name&app_version=$version',
    );

    uri = UriHelper.getUri(
      path: '/test/test.pl',
      addUserAgentParameters: false,
    );
    expect(
      uri.toString(),
      'https://world.openfoodfacts.org/test/test.pl',
    );

    uri = UriHelper.getUri(
      path: '/test/test.pl',
      queryParameters: <String, String>{'test': 'true', 'queryType': 'PROD'},
      addUserAgentParameters: false,
    );
    expect(
      uri.toString(),
      'https://world.openfoodfacts.org/test/test.pl?test=true&queryType=PROD',
    );
  });

  test('Get Uri with uuid', () {
    const String uuid = 'uuidTest';
    OpenFoodAPIConfiguration.userAgent = null;
    OpenFoodAPIConfiguration.uuid = uuid;
    Uri uri;

    uri = UriHelper.getUri(
      path: '/test/test.pl',
    );
    expect(
      uri.toString(),
      'https://world.openfoodfacts.org/test/test.pl?app_uuid=$uuid',
    );

    uri = UriHelper.getUri(
      path: '/test/test.pl',
      queryParameters: <String, String>{'test': 'true', 'queryType': 'PROD'},
    );
    expect(
      uri.toString(),
      'https://world.openfoodfacts.org/test/test.pl?test=true&queryType=PROD&app_uuid=$uuid',
    );

    uri = UriHelper.getUri(
      path: '/test/test.pl',
      addUserAgentParameters: false,
    );
    expect(
      uri.toString(),
      'https://world.openfoodfacts.org/test/test.pl',
    );

    uri = UriHelper.getUri(
      path: '/test/test.pl',
      queryParameters: <String, String>{'test': 'true', 'queryType': 'PROD'},
      addUserAgentParameters: false,
    );
    expect(
      uri.toString(),
      'https://world.openfoodfacts.org/test/test.pl?test=true&queryType=PROD',
    );
  });

  test('Get Test Uri', () {
    OpenFoodAPIConfiguration.userAgent = null;
    OpenFoodAPIConfiguration.uuid = null;
    Uri uri = UriHelper.getUri(
      path: '/test/test.pl',
      queryType: QueryType.TEST,
    );
    expect(
      uri.toString(),
      'https://world.openfoodfacts.net/test/test.pl',
    );

    Uri uri1 = UriHelper.getUri(
      path: '/test/test.pl',
      queryType: QueryType.TEST,
      queryParameters: <String, String>{'test': 'true', 'queryType': 'PROD'},
    );
    expect(
      uri1.toString(),
      'https://world.openfoodfacts.net/test/test.pl?test=true&queryType=PROD',
    );
  });

  test('Get Robotoff Uri', () {
    OpenFoodAPIConfiguration.userAgent = null;
    OpenFoodAPIConfiguration.uuid = null;
    Uri uri = UriHelper.getRobotoffUri(
      path: '/test/test.pl',
    );
    expect(
      uri.toString(),
      'https://robotoff.openfoodfacts.org/test/test.pl',
    );

    Uri uri1 = UriHelper.getRobotoffUri(
      path: '/test/test.pl',
      queryParameters: <String, dynamic>{'test': 'true', 'queryType': 'PROD'},
    );
    expect(
      uri1.toString(),
      'https://robotoff.openfoodfacts.org/test/test.pl?test=true&queryType=PROD',
    );
  });

  test('Get Robotoff Test Uri', () {
    OpenFoodAPIConfiguration.userAgent = null;
    OpenFoodAPIConfiguration.uuid = null;
    Uri uri = UriHelper.getRobotoffUri(
      path: '/test/test.pl',
      queryType: QueryType.TEST,
    );
    expect(
      uri.toString(),
      'https://robotoff.openfoodfacts.net/test/test.pl',
    );

    Uri uri1 = UriHelper.getRobotoffUri(
      path: '/test/test.pl',
      queryType: QueryType.TEST,
      queryParameters: <String, String>{'test': 'true', 'queryType': 'PROD'},
    );
    expect(
      uri1.toString(),
      'https://robotoff.openfoodfacts.net/test/test.pl?test=true&queryType=PROD',
    );
  });

  test('Get Uri with different uriScheme', () {
    OpenFoodAPIConfiguration.userAgent = null;
    OpenFoodAPIConfiguration.uuid = null;
    OpenFoodAPIConfiguration.uriScheme = 'http';
    Uri uri = UriHelper.getUri(
      path: '/test/test.pl',
    );
    expect(
      uri.toString(),
      'http://world.openfoodfacts.org/test/test.pl',
    );

    Uri uri1 = UriHelper.getUri(
      path: '/test/test.pl',
      queryParameters: <String, String>{'test': 'true', 'queryType': 'PROD'},
    );
    expect(
      uri1.toString(),
      'http://world.openfoodfacts.org/test/test.pl?test=true&queryType=PROD',
    );
  });
}
