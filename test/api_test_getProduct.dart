import 'package:openfoodfacts/utils/HttpHelper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/ProductResult.dart';
import 'package:openfoodfacts/model/ProductImage.dart';
import 'package:openfoodfacts/model/User.dart';

import 'test_constants.dart';

void main() {

  setUpAll(() async {
    new HttpHelper().isTestMode = true;
    new HttpHelper().userAgent = TestConstants.USER_AGENT;
  });

  group('$OpenFoodAPIClient get products', ()  {
    test('get product Coca Cola Light', () async {
      String barcode = "5000112548167";
      ProductResult result = await OpenFoodAPIClient.getProduct(barcode, User.LANGUAGE_DE);

      expect(result != null, true);
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product.barcode, barcode);

      // only german ingredients
      expect(result.product.ingredientsText != null, true);
      expect(result.product.ingredientsTextDE == null, true);
      expect(result.product.ingredientsTextEN == null, true);
      expect(result.product.ingredientsTextFR == null, true);

      print(result.product.ingredientsText);
      expect(result.product.ingredients != null, true);
      expect(result.product.ingredients.length, 10);

      expect(result.product.ingredients.any((i) => i.text == "Wasser"), true);
      expect(result.product.ingredients.any((i) => i.text == "Kohlensäure"), true);
      expect(result.product.ingredients.any((i) => i.text == "Farbstoff E 150d"), true);
      expect(result.product.ingredients.any((i) => i.text == "Säuerungsmittel Phosphorsäure und Citronensäure"), true);
      expect(result.product.ingredients.any((i) => i.text == "Süßungsmittel"), true);

      expect(result.product.ingredients.any((i) => i.text == "Natriumcyclamat"), true);
      expect(result.product.ingredients.any((i) => i.text == "Acesulfam K"), true);
      expect(result.product.ingredients.any((i) => i.text == "Aspartam"), true);
      expect(result.product.ingredients.any((i) => i.text == "Aroma"), true);
      expect(result.product.ingredients.any((i) => i.text == "Aroma Koffein"), true);

      expect(result.product.selectedImages.list.length, 9);

      expect(result.product.nutriments != null, true);

      expect(result.product.nutriments.energyUnit, "kj");
      expect(result.product.nutriments.energy, 0.8);
      expect(result.product.nutriments.sugars, 0.0);
      expect(result.product.nutriments.salt, 0.02);
      expect(result.product.nutriments.fiber, null);
      expect(result.product.nutriments.fat, null);
      expect(result.product.nutriments.saturatedFat, null);
      expect(result.product.nutriments.proteins, null);
      expect(result.product.nutriments.novaGroup, 4);
    });

    test('get product Danish Butter Cookies & Chocolate Chip Cookies', () async {
      String barcode = "5701184005007";
      ProductResult result = await OpenFoodAPIClient.getProduct(barcode, User.LANGUAGE_DE);

      expect(result != null, true);
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product.barcode, barcode);

      // only german ingredients
      expect(result.product.ingredientsText != null, true);
      expect(result.product.ingredientsTextDE == null, true);
      expect(result.product.ingredientsTextEN == null, true);
      expect(result.product.ingredientsTextFR == null, true);
      print(result.product.ingredientsText);

      expect(result.product.ingredients != null, true);
      expect(result.product.ingredients.length, 18);

      expect(result.product.ingredients.any((i) => i.text == "Buttergebäck"), true);
      expect(result.product.ingredients.any((i) => i.text == "Weizenmehl"), true);
      expect(result.product.ingredients.any((i) => i.text == "Zucker"), true);
      expect(result.product.ingredients.any((i) => i.text == "Butter"), true);
      expect(result.product.ingredients.any((i) => i.text == "Speisesalz"), true);

      expect(result.product.ingredients.any((i) => i.text == "Backtriebmittel"), true);
      expect(result.product.ingredients.any((i) => i.text == "Ammouniumhydrogencarbonat"), true);
      expect(result.product.ingredients.any((i) => i.text == "Invertzuckersirup"), true);
      expect(result.product.ingredients.any((i) => i.text == "natürliches Aroma"), true);
      expect(result.product.ingredients.any((i) => i.text == "Schokolade Mürbegebäck"), true);

      expect(result.product.ingredients.any((i) => i.text == "Pflanzenfett"), true);
      expect(result.product.ingredients.any((i) => i.text == "Palm"), true);
      expect(result.product.ingredients.any((i) => i.text == "Schokoladenstückchen"), true);
      expect(result.product.ingredients.any((i) => i.text == "Kakaomasse"), true);
      expect(result.product.ingredients.any((i) => i.text == "Kakaobutter"), true);

      expect(result.product.ingredients.any((i) => i.text == "Emulgator"), true);
      expect(result.product.ingredients.any((i) => i.text == "Lecithin"), true);
      expect(result.product.ingredients.any((i) => i.text == "fettarmes Kakaopulver"), true);

      expect(result.product.selectedImages.list.length, 9);

      expect(result.product.nutriments != null, true);

      expect(result.product.nutriments.energyUnit, "kJ");
      expect(result.product.nutriments.energy, 2125.0);
      expect(result.product.nutriments.sugars, 28.0);
      expect(result.product.nutriments.salt, 0.31);
      expect(result.product.nutriments.fiber, null);
      expect(result.product.nutriments.fat, 25.0);
      expect(result.product.nutriments.saturatedFat, 15.0);
      expect(result.product.nutriments.proteins, 5.3);
      expect(result.product.nutriments.novaGroup, 4);
    });

    test('get product Pâte brisée', () async {
      String barcode = "20004361";
      ProductResult result = await OpenFoodAPIClient.getProduct(barcode, User.LANGUAGE_FR);

      expect(result != null, true);
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product.barcode, barcode);
      expect(result.product.productName, "Pâte brisée");

      // only france ingredients
      expect(result.product.ingredientsText != null, true);
      expect(result.product.ingredientsTextDE == null, true);
      expect(result.product.ingredientsTextEN == null, true);
      expect(result.product.ingredientsTextFR == null, true);
      print(result.product.ingredientsText);

      expect(result.product.ingredients != null, true);
      expect(result.product.ingredients.length, 12);

      expect(result.product.ingredients.any((i) => i.text == "Farine de blé"), true);
      expect(result.product.ingredients.any((i) => i.text == "matière grasse non hydrogénée"), true);
      expect(result.product.ingredients.any((i) => i.text == "graisse de palme"), true);
      expect(result.product.ingredients.any((i) => i.text == "huile de colza"), true);
      expect(result.product.ingredients.any((i) => i.text == "colorant"), true);

      expect(result.product.ingredients.any((i) => i.text == "carroténoïdes"), true);
      expect(result.product.ingredients.any((i) => i.text == "eau"), true);
      expect(result.product.ingredients.any((i) => i.text == "alcool éthylique"), true);
      expect(result.product.ingredients.any((i) => i.text == "sel"), true);
      expect(result.product.ingredients.any((i) => i.text == "jus de citron concentré"), true);

      expect(result.product.ingredients.any((i) => i.text == "agent de traitement de la farine"), true);
      expect(result.product.ingredients.any((i) => i.text == "L-cystéine"), true);

      expect(result.product.selectedImages.list.length, 9);
      expect(result.product.selectedImages.list.where((image) => image.language == User.LANGUAGE_FR).length, 6);
      expect(result.product.selectedImages.list.where((image) => image.field == ProductImage.FIELD_FRONT).length, 3);
      expect(result.product.selectedImages.list.where((image) => image.field == ProductImage.FIELD_INGREDIENTS).length, 3);
      expect(result.product.selectedImages.list.where((image) => image.field == ProductImage.FIELD_NUTRITION).length, 3);
      expect(result.product.selectedImages.list.where((image) => image.size == ProductImage.SIZE_THUMB).length, 3);
      expect(result.product.selectedImages.list.where((image) => image.size == ProductImage.SIZE_DISPLAY).length, 3);
      expect(result.product.selectedImages.list.where((image) => image.size == ProductImage.SIZE_SMALL).length, 3);

      expect(result.product.nutriments != null, true);

      expect(result.product.nutriments.energyUnit, "kcal");
      expect(result.product.nutriments.energy, 1736.0);
      expect(result.product.nutriments.sugars, 2.8);
      expect(result.product.nutriments.salt, 0.9);
      expect(result.product.nutriments.fiber, 1.1);
      expect(result.product.nutriments.fat, 23.3);
      expect(result.product.nutriments.saturatedFat, 10.7);
      expect(result.product.nutriments.proteins, 6.3);
      expect(result.product.nutriments.novaGroup, 4);
    });
  });

  test('product not available', () async {
    String barcode = "11111111111111111111111111";
    ProductResult result = await OpenFoodAPIClient.getProduct(
        barcode, User.LANGUAGE_DE);
    assert(result != null);
    assert(result.product == null);
  });
}