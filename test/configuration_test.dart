import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  const UriProductHelper uriHelper = uriHelperFoodProd;
  setUp(() {
    OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  });

  test('Get Uri with no user agent', () {
    OpenFoodAPIConfiguration.userAgent = null;

    expect(
      () => uriHelper.getUri(
        path: '/test/test.pl',
      ),
      throwsA(
        const TypeMatcher<Exception>(),
      ),
    );
  });

  test('Get Uri', () {
    OpenFoodAPIConfiguration.uuid = null;

    Uri uri = uriHelper.getUri(
      path: '/test/test.pl',
    );

    expect(
      uri.replace(query: '').toString(),
      'https://world.openfoodfacts.org/test/test.pl?',
    );
    expect(uri.queryParameters, HttpHelper.addUserAgentParameters(null));

    Uri uri1 = uriHelper.getUri(
      path: '/test/test.pl',
      queryParameters: <String, String>{'test': 'true', 'queryType': 'PROD'},
    );
    expect(
      uri1.toString(),
      'https://world.openfoodfacts.org/test/test.pl?test=true&queryType=PROD&$_appNameValue',
    );
  });

  test('Get Uri with user agent', () {
    const String name = 'UserAgentName';
    const String version = '12';
    OpenFoodAPIConfiguration.userAgent =
        UserAgent(name: name, version: version);
    OpenFoodAPIConfiguration.uuid = null;
    Uri uri;

    uri = uriHelper.getUri(
      path: '/test/test.pl',
    );
    expect(
      uri.toString(),
      'https://world.openfoodfacts.org/test/test.pl?app_name=$name&app_version=$version',
    );

    uri = uriHelper.getUri(
      path: '/test/test.pl',
      queryParameters: <String, String>{'test': 'true', 'queryType': 'PROD'},
    );
    expect(
      uri.toString(),
      'https://world.openfoodfacts.org/test/test.pl?test=true&queryType=PROD&app_name=$name&app_version=$version',
    );

    uri = uriHelper.getUri(
      path: '/test/test.pl',
      addUserAgentParameters: false,
    );
    expect(
      uri.toString(),
      'https://world.openfoodfacts.org/test/test.pl',
    );

    uri = uriHelper.getUri(
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
    OpenFoodAPIConfiguration.uuid = uuid;
    Uri uri;

    uri = uriHelper.getUri(
      path: '/test/test.pl',
    );
    expect(
      uri.toString(),
      'https://world.openfoodfacts.org/test/test.pl?$_appNameValue&app_uuid=$uuid',
    );

    uri = uriHelper.getUri(
      path: '/test/test.pl',
      queryParameters: <String, String>{'test': 'true', 'queryType': 'PROD'},
    );
    expect(
      uri.toString(),
      'https://world.openfoodfacts.org/test/test.pl?test=true&queryType=PROD&$_appNameValue&app_uuid=$uuid',
    );

    uri = uriHelper.getUri(
      path: '/test/test.pl',
      addUserAgentParameters: false,
    );
    expect(
      uri.toString(),
      'https://world.openfoodfacts.org/test/test.pl',
    );

    uri = uriHelper.getUri(
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
    OpenFoodAPIConfiguration.uuid = null;
    Uri uri = uriHelperFoodTest.getUri(
      path: '/test/test.pl',
    );
    expect(
      uri.toString(),
      'https://world.openfoodfacts.net/test/test.pl?$_appNameValue',
    );

    Uri uri1 = uriHelperFoodTest.getUri(
      path: '/test/test.pl',
      queryParameters: <String, String>{'test': 'true', 'queryType': 'PROD'},
    );
    expect(
      uri1.toString(),
      'https://world.openfoodfacts.net/test/test.pl?test=true&queryType=PROD&$_appNameValue',
    );
  });

  test('Get Robotoff Uri', () {
    OpenFoodAPIConfiguration.userAgent = null;
    OpenFoodAPIConfiguration.uuid = null;
    Uri uri = uriHelperRobotoffProd.getUri(
      path: '/test/test.pl',
    );
    expect(
      uri.toString(),
      'https://robotoff.openfoodfacts.org/test/test.pl',
    );

    Uri uri1 = uriHelperRobotoffProd.getUri(
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
    Uri uri = uriHelperRobotoffTest.getUri(
      path: '/test/test.pl',
    );
    expect(
      uri.toString(),
      'https://robotoff.openfoodfacts.net/test/test.pl',
    );

    Uri uri1 = uriHelperRobotoffTest.getUri(
      path: '/test/test.pl',
      queryParameters: <String, String>{'test': 'true', 'queryType': 'PROD'},
    );
    expect(
      uri1.toString(),
      'https://robotoff.openfoodfacts.net/test/test.pl?test=true&queryType=PROD',
    );
  });

  test('Get Uri with different uriScheme', () {
    OpenFoodAPIConfiguration.uuid = null;
    final UriProductHelper uriHelper = UriProductHelper(
      domain: 'openfoodfacts.org',
      scheme: 'http',
    );
    final Uri uri = uriHelper.getUri(
      path: '/test/test.pl',
    );
    expect(
      uri.toString(),
      'http://world.openfoodfacts.org/test/test.pl?$_appNameValue',
    );

    Uri uri1 = uriHelper.getUri(
      path: '/test/test.pl',
      queryParameters: <String, String>{'test': 'true', 'queryType': 'PROD'},
    );
    expect(
      uri1.toString(),
      'http://world.openfoodfacts.org/test/test.pl?test=true&queryType=PROD&$_appNameValue',
    );
  });
}

String get _appNameValue =>
    'app_name=${OpenFoodAPIConfiguration.userAgent!.name.replaceAll(
      ' ',
      '+',
    )}';
