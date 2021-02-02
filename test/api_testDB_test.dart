import 'package:flutter_test/flutter_test.dart';
import 'package:openfoodfacts/model/Additives.dart';
import 'package:openfoodfacts/model/Nutriments.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/Status.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/PnnsGroupQueryConfiguration.dart';
import 'package:openfoodfacts/utils/PnnsGroups.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'test_constants.dart';

void main() {
  group('$OpenFoodAPIClient add new products', () {
    String barcode_1 = "0048151620000";
    String quantity_1 = "230g";
    String servingSize_1 = "100g";
    double servingQuantity_1 = 100;

    void testProductResult1(ProductResult result) {
      print("test product result");
      expect(result != null, true);
      expect(result.status, 1);
      print("barcode: " + result.barcode);
      expect(result.barcode, barcode_1);
      expect(result.product != null, true);
      expect(result.product.barcode, barcode_1);

      expect(result.product.quantity != null, true);
      print("quantity: " + result.product.quantity);
      expect(result.product.quantity, quantity_1);

      expect(result.product.servingQuantity != null, true);
      print("servingQuantity: " + result.product.servingQuantity.toString());
      expect(result.product.servingQuantity, servingQuantity_1);

      expect(result.product.servingSize != null, true);
      print("servingSize: " + result.product.servingSize);
      expect(result.product.servingSize, servingSize_1);
    }

    test('save product test, set serving-size', () async {
      Product product = Product(
          barcode: barcode_1,
          productName: "This is only a test",
          quantity: quantity_1,
          servingSize: servingSize_1,
          servingQuantity: servingQuantity_1,
          lang: OpenFoodFactsLanguage.ENGLISH,
          brands: "Golden Cookies",
          nutrimentEnergyUnit: "kJ",
          nutrimentDataPer: "serving",
          ingredientsText:
              "fortified wheat flour, chocolate chips (25%), sugar, palm oil,  golden syrup, whey and whey derivatives (milk), raising agents, salt, flavouring",
          nutriments: Nutriments(novaGroup: 4),
          additives: Additives(["en:e150d"], ["E150d"]));
      Status status = await OpenFoodAPIClient.saveProduct(
          TestConstants.TEST_USER, product,
          queryType: QueryType.TEST);

      expect(status != null, true);
      expect(status.status, 1);
      expect(status.statusVerbose, "fields saved");

      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode_1,
          language: OpenFoodFactsLanguage.ENGLISH,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);

      testProductResult1(result);
    });

    test('add front image test', () async {
      SendImage image = new SendImage(
        lang: OpenFoodFactsLanguage.GERMAN,
        barcode: barcode_1,
        imageField: ImageField.FRONT,
        imageUrl: Uri.parse("assets/front_de.jpg"),
      );
      Status status = await OpenFoodAPIClient.addProductImage(
          TestConstants.TEST_USER, image, queryType: QueryType.TEST);

      expect(status != null, true);
      expect(status.status, "status not ok");
      expect(status.error, "This picture has already been sent.");
    });
  });

  test('get product test 2', () async {
    String barcode = "4388810057787";

    ProductResult result = await OpenFoodAPIClient.getProductRaw(
        barcode, OpenFoodFactsLanguage.GERMAN,
        user: TestConstants.TEST_USER, queryType: QueryType.TEST);

    expect(result != null, true);
    expect(result.status, 1);
    expect(result.barcode, barcode);
    expect(result.product != null, true);
    expect(result.product.barcode, barcode);

    expect(result.product.productName,
        "Natürliches Mineralwasser, Marinus-Quelle, still");
    expect(result.product.productNameDE,
        "Natürliches Mineralwasser, Marinus-Quelle, still");

    expect(result.product.nutriments != null, true);

    expect(result.product.nutriments.energy, null);
    expect(result.product.nutriments.sugars, null);
    expect(result.product.nutriments.salt, 0.0019558);
    expect(result.product.nutriments.fiber, null);
    expect(result.product.nutriments.fat, null);
    expect(result.product.nutriments.saturatedFat, null);
    expect(result.product.nutriments.proteins, null);
    expect(result.product.nutriments.novaGroup, 1);
    expect(result.product.nutriments.fatServing == null, true);
  });

  test('search favorite products', () async {
    var parameters = <Parameter>[
      const OutputFormat(format: Format.JSON),
      const Page(page: 1),
      const PageSize(size: 10),
      const SearchSimple(active: true),
      const SortBy(option: SortOption.POPULARITY)
    ];

    ProductSearchQueryConfiguration configuration =
    ProductSearchQueryConfiguration(
        parametersList: parameters,
        fields: [ProductField.ALL],
        language: OpenFoodFactsLanguage.GERMAN);

    SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.TEST_USER, configuration, queryType: QueryType.TEST);

    expect(result != null, true);
    expect(result.page, 1);
    expect(result.pageSize, 10);
    expect(result.products != null, true);
    expect(result.products.length, 10);
    expect(result.products[0].runtimeType, Product);
    expect(result.count > 30000, true);

    print(result.products[2].toData().toString());
    result.products[3].ingredients.forEach((i) => print(i.text));
  });

  test('query potatoes products', () async {

    PnnsGroupQueryConfiguration configuration = PnnsGroupQueryConfiguration(
      PnnsGroup2.POTATOES,
      page: 3,
      language: OpenFoodFactsLanguage.ENGLISH,
      fields: [ProductField.ALL],
    );

    SearchResult result = await OpenFoodAPIClient.queryPnnsGroup(
        TestConstants.TEST_USER, configuration, queryType: QueryType.TEST);

    expect(result != null, true);
    expect(result.page, 3);
    expect(result.pageSize, 24);
    expect(result.products != null, true);
    expect(result.products.length, 24);
    expect(result.products[0].runtimeType, Product);
    expect(result.count > 1500, true);

    print(result.products[2].toData().toString());
  });

  test('get random insight', () async {
    InsightsResult result = await OpenFoodAPIClient.getRandomInsight(
        TestConstants.TEST_USER,
        type: InsightType.CATEGORY,
    queryType: QueryType.TEST);

    expect(result != null, true);
    expect(result.status == null, true);
    expect(result.insights[0].type, InsightType.CATEGORY);
    expect(result.insights[0].id != null, true);
    expect(result.insights[0].barcode != null, true);
    expect(result.insights[0].countries != null, true);
    expect(result.insights[0].lang != null, true);
    expect(result.insights[0].model != null, true);
    // Actually, I stumbled across insights without confidence field...
    //expect(result.insight.confidence != null, true);
  });

  test('get product insights', () async {
    InsightsResult result = await OpenFoodAPIClient.getProductInsights(
        "8025386005564", TestConstants.TEST_USER, queryType: QueryType.TEST);

    expect(result != null, true);
    expect(result.status != null, true);
    expect(result.status, "found");
    expect(result.insights.length > 0, true);
    expect(result.insights[0].id != null, true);
    expect(result.insights[0].barcode != null, true);
    expect(result.insights[0].countries != null, true);
    expect(result.insights[0].lang != null, true);
    expect(result.insights[0].model != null, true);
    // Actually, I stumbled across insights without confidence field...
    //expect(result.insight.confidence != null, true);
  });

  test('get questions for Noix de Saint-Jacques EN', () async {
    RobotoffQuestionResult result =
    await OpenFoodAPIClient.getRobotoffQuestionsForProduct(
        "3274570800026", "en", TestConstants.TEST_USER,
        count: 1, queryType: QueryType.TEST);

    if(result.status == "no_questions") {
      print("No question found for this product, please try with another barcode");
    } else {
      expect(result != null, true);
      expect(result.status != null, true);
      expect(result.status, "found");
      expect(result.questions.length, 1);
      expect(result.questions[0].barcode, "3274570800026");
      expect(result.questions[0].type, "add-binary");
      expect(result.questions[0].value, "Scallop");
      expect(result.questions[0].question,
          "Does the product belong to this category?");
      expect(result.questions[0].insightId,
          "5cac03bc-a5a7-4ec2-a548-17fd9319fee7");
      expect(result.questions[0].insightType, InsightType.CATEGORY);
      expect(result.questions[0].imageUrl,
          "https://static.openfoodfacts.org/images/products/327/457/080/0026/front_en.4.400.jpg");
    }
  });

  test('get 2 random questions', () async {
    RobotoffQuestionResult result =
    await OpenFoodAPIClient.getRandomRobotoffQuestion(
        "fr", TestConstants.TEST_USER,
        types: [InsightType.CATEGORY], count: 2, queryType: QueryType.TEST);

    expect(result != null, true);
    expect(result.status != null, true);
    expect(result.status, "found");
    expect(result.questions.length, 2);
    expect(result.questions[0].insightType, InsightType.CATEGORY);
    expect(result.questions[1].insightType, InsightType.CATEGORY);
  });

  test('get questions for Noix de Saint-Jacques EN and answer', () async {
    RobotoffQuestionResult result =
    await OpenFoodAPIClient.getRobotoffQuestionsForProduct(
        "0080868000633", "en", TestConstants.TEST_USER,
        count: 1);

    if (result.status == "found") {
      Status postResult = await OpenFoodAPIClient.postInsightAnnotation(
          result.questions[0].insightId,
          InsightAnnotation.YES,
          TestConstants.TEST_USER, queryType: QueryType.TEST);
      expect(postResult.status, "saved");
    } else if (result.status == "no_questions") {
      print("No question found for this product");
      expect(result.status, "no_questions");
    } else {
      print("An error occurred while fetching questions");
    }
  });

  test('get farine de blé spelling corrections', () async {
    SpellingCorrection result =
    await OpenFoodAPIClient.getIngredientSpellingCorrection(
        ingredientName: "fqrine de blé", queryType: QueryType.TEST);

    expect(result != null, true);
    expect(result.corrected, "farine de blé");
    expect(result.input, "fqrine de blé");
    expect(result.termCorrections.length, 1);
    expect(result.termCorrections[0].corrections, null);
  });
}
