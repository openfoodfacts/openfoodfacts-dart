import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
    OpenFoodAPIConfiguration.globalBearerToken = null;
    OpenFoodAPIConfiguration.bearerTokenProvider = null;
    OpenFoodAPIConfiguration.globalUser = null;
  });

  tearDown(() {
    OpenFoodAPIConfiguration.globalBearerToken = null;
    OpenFoodAPIConfiguration.bearerTokenProvider = null;
    OpenFoodAPIConfiguration.globalUser = null;
  });

  group('Bearer token resolution', () {
    test('returns null when nothing is set', () async {
      expect(await OpenFoodAPIConfiguration.getBearerToken(null), isNull);
      expect(OpenFoodAPIConfiguration.getBearerTokenSync(null), isNull);
    });

    test('explicit token wins over global and provider', () async {
      OpenFoodAPIConfiguration.globalBearerToken = 'global';
      OpenFoodAPIConfiguration.bearerTokenProvider = () async => 'provider';
      expect(
        await OpenFoodAPIConfiguration.getBearerToken('explicit'),
        'explicit',
      );
      expect(
        OpenFoodAPIConfiguration.getBearerTokenSync('explicit'),
        'explicit',
      );
    });

    test('global token wins over provider', () async {
      OpenFoodAPIConfiguration.globalBearerToken = 'global';
      OpenFoodAPIConfiguration.bearerTokenProvider = () async => 'provider';
      expect(await OpenFoodAPIConfiguration.getBearerToken(null), 'global');
      expect(OpenFoodAPIConfiguration.getBearerTokenSync(null), 'global');
    });

    test('provider is used as fallback', () async {
      OpenFoodAPIConfiguration.bearerTokenProvider = () async => 'provider';
      expect(await OpenFoodAPIConfiguration.getBearerToken(null), 'provider');
      // Sync version cannot call the async provider.
      expect(OpenFoodAPIConfiguration.getBearerTokenSync(null), isNull);
    });

    test('provider returning null means unauthenticated', () async {
      OpenFoodAPIConfiguration.bearerTokenProvider = () async => null;
      expect(await OpenFoodAPIConfiguration.getBearerToken(null), isNull);
    });
  });
}
