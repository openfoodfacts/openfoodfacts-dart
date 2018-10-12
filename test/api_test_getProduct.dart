import 'package:test/test.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/ProductResult.dart';
import 'package:openfoodfacts/model/Image.dart';

void main() {
  group('$OpenFoodAPIClient get products', ()  {

    test('get product test 1', () async {

      String barcode = "8008698011065";
      ProductResult result = await OpenFoodAPIClient.getProduct(barcode);

      expect(result != null, true);
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product.barcode, barcode);
      expect(result.product.quantity, "350g");
      expect(result.product.productNameDE, "Meisterbäckers Vital");
      expect(result.product.ingredientsTextDE.isNotEmpty, true);
      expect(result.product.ingredients != null, true);
      expect(result.product.ingredients.isNotEmpty, true);
      expect(result.product.ingredients.first.text, "Maisstärke");
      expect(result.product.selectedImages != null, true);
      expect(result.product.selectedImages.list.length, 15);
      expect(result.product.selectedImages.list.singleWhere((image) =>
        image.field == Image.FIELD_INGREDIENTS &&
        image.size == Image.SIZE_DISPLAY &&
        image.language == User.LANGUAGE_DE).url,
        "https://static.openfoodfacts.org/images/products/800/869/801/1065/ingredients_de.27.400.jpg");
      expect(result.product.labelsTags.contains("en:gluten-free"), true);
      expect(result.product.tracesTags != null, true);
      expect(result.product.tracesTags.contains("en:lupin"), true);
    });

  });
}
