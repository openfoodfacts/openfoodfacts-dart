import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:openfoodfacts/utils/UriHelper.dart';
import 'package:test/test.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;

  test('Get Uri', () {
    Uri uri = UriHelper.getUri(
      path: '/test/test.pl',
    );
    expect('https://world.openfoodfacts.org/test/test.pl', uri.toString());

    Uri uri1 = UriHelper.getUri(
      path: '/test/test.pl',
      queryParameters: <String, dynamic>{'test': 'true', 'queryType': 'PROD'},
    );
    expect(
      'https://world.openfoodfacts.org/test/test.pl?test=true&queryType=PROD',
      uri1.toString(),
    );
  });

  test('Get Test Uri', () {
    Uri uri = UriHelper.getUri(
      path: '/test/test.pl',
      queryType: QueryType.TEST,
    );
    expect('https://world.openfoodfacts.net/test/test.pl', uri.toString());

    Uri uri1 = UriHelper.getUri(
      path: '/test/test.pl',
      queryType: QueryType.TEST,
      queryParameters: <String, dynamic>{'test': 'true', 'queryType': 'PROD'},
    );
    expect(
      'https://world.openfoodfacts.net/test/test.pl?test=true&queryType=PROD',
      uri1.toString(),
    );
  });

  test('Get Robotoff Uri', () {
    Uri uri = UriHelper.getRobotoffUri(
      path: '/test/test.pl',
    );
    expect('https://robotoff.openfoodfacts.org/test/test.pl', uri.toString());

    Uri uri1 = UriHelper.getRobotoffUri(
      path: '/test/test.pl',
      queryParameters: <String, dynamic>{'test': 'true', 'queryType': 'PROD'},
    );
    expect(
      'https://robotoff.openfoodfacts.org/test/test.pl?test=true&queryType=PROD',
      uri1.toString(),
    );
  });

  test('Get Robotoff Test Uri', () {
    Uri uri = UriHelper.getRobotoffUri(
      path: '/test/test.pl',
      queryType: QueryType.TEST,
    );
    expect('https://robotoff.openfoodfacts.net/test/test.pl', uri.toString());

    Uri uri1 = UriHelper.getRobotoffUri(
      path: '/test/test.pl',
      queryType: QueryType.TEST,
      queryParameters: <String, dynamic>{'test': 'true', 'queryType': 'PROD'},
    );
    expect(
      'https://robotoff.openfoodfacts.net/test/test.pl?test=true&queryType=PROD',
      uri1.toString(),
    );
  });

  test('Get Uri with different uriScheme', () {
    OpenFoodAPIConfiguration.uriScheme = 'http';
    Uri uri = UriHelper.getUri(
      path: '/test/test.pl',
    );
    expect('http://world.openfoodfacts.org/test/test.pl', uri.toString());

    Uri uri1 = UriHelper.getUri(
      path: '/test/test.pl',
      queryParameters: <String, dynamic>{'test': 'true', 'queryType': 'PROD'},
    );
    expect(
      'http://world.openfoodfacts.org/test/test.pl?test=true&queryType=PROD',
      uri1.toString(),
    );
  });

  test('Get Uri with different uriScheme', () {
    OpenFoodAPIConfiguration.uriScheme = 'http';
    Uri uri = UriHelper.getUri(
      path: '/test/test.pl',
    );
    expect('http://world.openfoodfacts.org/test/test.pl', uri.toString());

    Uri uri1 = UriHelper.getUri(
      path: '/test/test.pl',
      queryParameters: <String, dynamic>{'test': 'true', 'queryType': 'PROD'},
    );
    expect(
      'http://world.openfoodfacts.org/test/test.pl?test=true&queryType=PROD',
      uri1.toString(),
    );
  });
}
