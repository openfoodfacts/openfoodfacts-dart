import 'dart:math';

import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/src/utils/nutripatrol_types.dart';
import 'package:test/test.dart';

void main() {
  setUpAll(() {
    OpenFoodAPIConfiguration.userAgent = UserAgent(
      name: 'openfoodfacts-dart',
      version: '1.0.0',
      url: '',
    );
  });
  group('$OpenFoodAPIClient create Nutripatrol flag', () {
    test('Create a valid Nutripatrol flag', () async {
      final random = Random();
      final String randomNumber = random.nextInt(1000000).toString();
      final String barcode = 'sdk_dart_test_$randomNumber';
      final String userId = 'sdk_dart_test_$randomNumber';

      final MaybeError<CreateNutripatrolFlag> response =
          await NutripatrolApiClient.createFlag(
        barcode: barcode,
        comment: 'test_comment',
        confidence: 0.5,
        imageId: 'test_image_id',
        reason: NutripatrolFlagReason.inappropriate,
        type: NutripatrolType.image,
        url: 'https://example.com/product/$barcode',
        userId: userId,
        deviceId: 'test_device',
        source: NutripatrolSource.web,
        flavor: Flavor.openFoodFacts,
      );

      expect(response.isError, isFalse);
      expect(response.value, isNotNull);
      expect(response.value.id, isNotNull);
      expect(response.value.ticket, isNotNull);
      expect(response.value.ticket.barcode, barcode);
      expect(response.value.ticket.flavor, Flavor.openFoodFacts);
      expect(response.value.ticket.type, NutripatrolType.image);
      expect(response.value.ticket.url, 'https://example.com/product/$barcode');
      expect(response.value.ticket.imageId, 'test_image_id');
    });
  });
}
