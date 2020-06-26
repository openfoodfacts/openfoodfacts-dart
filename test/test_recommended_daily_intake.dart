
import 'package:flutter_test/flutter_test.dart';
import 'package:openfoodfacts/model/RecommendedDailyIntake.dart';
import 'package:openfoodfacts/utils/UnitHelper.dart';

void main() {

  TestWidgetsFlutterBinding.ensureInitialized();

  group('Get Recommendations', () {

    test('Get', () {
      RecommendedDailyIntake rdi = RecommendedDailyIntake.getRecommendedDailyIntakes();

      expect(rdi.energyKcal.value == 2000, true);
      expect(rdi.energyKcal.unit == Unit.KCAL, true);

      expect(rdi.energyKj.value == 8400, true);
      expect(rdi.energyKj.unit == Unit.KJ, true);

      expect(rdi.carbohydrates.value == 260, true);
      expect(rdi.carbohydrates.unit == Unit.G, true);

      expect(rdi.sodium.value == 6, true);
      expect(rdi.sodium.unit == Unit.G, true);

      expect(rdi.sugars.value == 90, true);
      expect(rdi.sugars.unit == Unit.G, true);

      expect(rdi.fluoride.value == 3.5, true);
      expect(rdi.fluoride.unit == Unit.MILLI_G, true);

      expect(rdi.chromium.value == 40, true);
      expect(rdi.chromium.unit == Unit.MICRO_G, true);

      expect(rdi.magnesium.value == 375, true);
      expect(rdi.magnesium.unit == Unit.MILLI_G, true);
    });

  });

}