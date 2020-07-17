library openfoodfacts;

import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart';
import 'package:openfoodfacts/utils/PnnsGroupQueryConfiguration.dart';
import 'package:openfoodfacts/utils/PnnsGroups.dart';

import 'model/Insight.dart';
import 'model/RobotoffQuestion.dart';
import 'model/SendImage.dart';
import 'model/Product.dart';
import 'model/ProductResult.dart';
import 'model/SearchResult.dart';
import 'model/SpellingCorrections.dart';
import 'model/Status.dart';
import 'model/User.dart';

import 'model/parameter/OutputFormat.dart';
import 'utils/HttpHelper.dart';
import 'utils/LanguageHelper.dart';
import 'utils/ProductHelper.dart';
import 'utils/ProductQueryConfigurations.dart';
import 'utils/ProductSearchQueryConfiguration.dart';

export 'interface/Parameter.dart';
export 'model/Additives.dart';
export 'model/Ingredient.dart';
export 'model/Insight.dart';
export 'model/Product.dart';
export 'model/ProductImage.dart';
export 'model/ProductResult.dart';
export 'model/RobotoffQuestion.dart';
export 'model/SearchResult.dart';
export 'model/SendImage.dart';
export 'model/SpellingCorrections.dart';
export 'model/Status.dart';
export 'model/TagI18N.dart';
export 'model/User.dart';
export 'model/parameter/OutputFormat.dart';
export 'model/parameter/Page.dart';
export 'model/parameter/PageSize.dart';
export 'model/parameter/SearchSimple.dart';
export 'model/parameter/SortBy.dart';

export 'utils/HttpHelper.dart';
export 'utils/ImageHelper.dart';
export 'utils/JsonHelper.dart';
export 'utils/LanguageHelper.dart';
export 'utils/NutrimentsHelper.dart';
export 'utils/ProductFields.dart';
export 'utils/ProductHelper.dart';
export 'utils/ProductQueryConfigurations.dart';
export 'utils/ProductSearchQueryConfiguration.dart';

/// Client calls of the Open Food Facts API
class OpenFoodAPIClient {
  static const String URI_SCHEME = "https";
  static const String URI_HOST = "world.openfoodfacts.org";

  static const String URI_HOST_ROBOTOFF = "robotoff.openfoodfacts.org";

  /// Add the given product to the database.
  /// Returns a Status object as result.
  static Future<Status> saveProduct(User user, Product product) async {
    var parameterMap = new Map<String, String>();
    parameterMap.addAll(user.toData());
    parameterMap.addAll(product.toData());

    var productUri =
        Uri(scheme: URI_SCHEME, host: URI_HOST, path: '/cgi/product_jqm2.pl');

    Response response =
        await HttpHelper().doPostRequest(productUri, parameterMap, user);
    print(response);
    var status = Status.fromJson(json.decode(response.body));
    return status;
  }

  /// Send one image to the server.
  /// The image will be added to the product specified in the SendImage
  /// Returns a Status object as result.
  static Future<Status> addProductImage(User user, SendImage image) async {
    var dataMap = new Map<String, String>();
    var fileMap = new Map<String, Uri>();

    dataMap.addAll(user.toData());
    dataMap.addAll(image.toData());
    fileMap.putIfAbsent(image.getImageDataKey(), () => image.imageUrl);

    var imageUri = Uri(
        scheme: URI_SCHEME,
        host: URI_HOST,
        path: '/cgi/product_image_upload.pl');

    return await HttpHelper()
        .doMultipartRequest(imageUri, dataMap, fileMap, user);
  }

  /// Returns the product for the given barcode.
  /// The ProductResult does not contain a product, if the product is not available.
  /// No parsing of ingredients.
  /// No adjustment by language.
  static Future<ProductResult> getProductRaw(
      String barcode, OpenFoodFactsLanguage language,
      {User user}) async {
    if (barcode == null || barcode.isEmpty) {
      return new ProductResult();
    }

    var productUri = Uri(
        scheme: URI_SCHEME,
        host: URI_HOST,
        path: 'api/v0/product/' + barcode + '.json',
        queryParameters: {"lc": language.code});

    Response response = await HttpHelper().doGetRequest(productUri, user: user);
    var result = ProductResult.fromJson(json.decode(response.body));
    return result;
  }

  /// Returns the product for the given barcode.
  /// The ProductResult does not contain a product, if the product is not available.
  /// ingredients, images and product name will be prepared for the given language.
  static Future<ProductResult> getProduct(
      ProductQueryConfiguration configuration,
      {User user}) async {
    if (configuration.barcode == null || configuration.barcode.isEmpty) {
      return new ProductResult();
    }

    var productUri = Uri(
        scheme: URI_SCHEME,
        host: URI_HOST,
        path: 'api/v0/product/${configuration.barcode}.json',
        queryParameters: configuration.getParametersMap());

    print(productUri.toString());

    Response response = await HttpHelper().doGetRequest(productUri, user: user);
    ProductResult result = ProductResult.fromJson(json.decode(response.body));

    if (result.product != null) {
      ProductHelper.removeImages(result.product, configuration.language);
      ProductHelper.createImageUrls(result.product);
    }

    return result;
  }

  /// Search the OpenFoodFacts product database with the given parameters.
  /// Returns the list of products as SearchResult.
  /// Query the language specific host from OpenFoodFacts.
  static Future<SearchResult> searchProducts(
      User user, ProductSearchQueryConfiguration configuration) async {
    const outputFormat = OutputFormat(format: Format.JSON);
    var queryParameters = configuration.getParametersMap();
    queryParameters[outputFormat.getName()] = outputFormat.getValue();

    var searchUri = Uri(
        scheme: URI_SCHEME,
        host: URI_HOST,
        path: '/cgi/search.pl',
        queryParameters: queryParameters);

    print("URI: " + searchUri.toString());

    Response response = await HttpHelper().doGetRequest(searchUri, user: user);
    var result = SearchResult.fromJson(json.decode(response.body));

    for (Product product in result.products) {
      ProductHelper.removeImages(product, configuration.language);
    }

    return result;
  }

  static Future<SearchResult> queryPnnsGroup(
      User user, PnnsGroupQueryConfiguration configuration) async {
    const outputFormat = OutputFormat(format: Format.JSON);
    var queryParameters = configuration.getParametersMap();
    queryParameters[outputFormat.getName()] = outputFormat.getValue();

    var searchUri = Uri(
        scheme: URI_SCHEME,
        host: URI_HOST,
        path: '/pnns-group-2/${configuration.group.id}/${configuration.page}',
        queryParameters: queryParameters);

    print("URI: " + searchUri.toString());

    Response response = await HttpHelper().doGetRequest(searchUri, user: user);
    var result = SearchResult.fromJson(json.decode(response.body));

    for (Product product in result.products) {
      ProductHelper.removeImages(product, configuration.language);
    }

    return result;
  }

  static Future<InsightsResult> getRandomInsight(User user,
      {InsightType type,
      String country,
      String valueTag,
      String serverDomain}) async {
    final Map<String, String> parameters = Map<String, String>();

    if (type != null) {
      parameters["type"] = type.value;
    }
    if (country != null) {
      parameters["country"] = country;
    }
    if (valueTag != null) {
      parameters["value_tag"] = valueTag;
    }
    if (serverDomain != null) {
      parameters["server_domain"] = serverDomain;
    }

    var insightUri = Uri(
      scheme: URI_SCHEME,
      host: URI_HOST_ROBOTOFF,
      path: 'api/v1/insights/random/',
      queryParameters: parameters,
    );

    print(insightUri);

    Response response = await HttpHelper().doGetRequest(insightUri, user: user);
    var result =
        InsightsResult.fromJson(json.decode(utf8.decode(response.bodyBytes)));

    return result;
  }

  static Future<InsightsResult> getProductInsights(
      String barcode, User user) async {
    var insightsUri = Uri(
      scheme: URI_SCHEME,
      host: URI_HOST_ROBOTOFF,
      path: 'api/v1/insights/$barcode',
    );

    print(insightsUri);

    Response response =
        await HttpHelper().doGetRequest(insightsUri, user: user);

    return InsightsResult.fromJson(
        json.decode(utf8.decode(response.bodyBytes)));
  }

  static Future<RobotoffQuestionResult> getRobotoffQuestionsForProduct(
      String barcode, String lang, User user,
      {int count}) async {
    if (barcode == null || barcode.isEmpty) {
      return RobotoffQuestionResult();
    }

    if (count == null || count <= 0) {
      count = 1;
    }

    final Map<String, String> parameters = <String, String>{
      'lang': lang,
      'count': count.toString()
    };

    var robotoffQuestionUri = Uri(
      scheme: URI_SCHEME,
      host: URI_HOST_ROBOTOFF,
      path: 'api/v1/questions/$barcode',
      queryParameters: parameters,
    );

    Response response =
        await HttpHelper().doGetRequest(robotoffQuestionUri, user: user);
    var result = RobotoffQuestionResult.fromJson(
        json.decode(utf8.decode(response.bodyBytes)));

    return result;
  }

  static Future<RobotoffQuestionResult> getRandomRobotoffQuestion(
      String lang, User user,
      {int count, List<InsightType> types}) async {
    if (count == null || count <= 0) {
      count = 1;
    }

    List<String> typesValues = List<String>();
    types.forEach((t) {
      typesValues.add(t.value);
    });

    String parsedTypes = typesValues.join(',');

    final Map<String, String> parameters = <String, String>{
      'lang': lang,
      'count': count.toString(),
      'insight_types': parsedTypes.toString()
    };

    var robotoffQuestionUri = Uri(
      scheme: URI_SCHEME,
      host: URI_HOST_ROBOTOFF,
      path: 'api/v1/questions/random',
      queryParameters: parameters,
    );

    print(robotoffQuestionUri);

    Response response =
        await HttpHelper().doGetRequest(robotoffQuestionUri, user: user);
    var result = RobotoffQuestionResult.fromJson(
        json.decode(utf8.decode(response.bodyBytes)));

    return result;
  }

  static Future<Status> postInsightAnnotation(
      String insightId, InsightAnnotation annotation, User user,
      {bool update = false}) async {
    var insightUri = Uri(
        scheme: URI_SCHEME,
        host: URI_HOST_ROBOTOFF,
        path: 'api/v1/insights/annotate');

    Map<String, String> annotationData = {
      "insight_id": insightId,
      "annotation": annotation.value.toString(),
      "update": update ? "1" : "0"
    };

    Response response =
        await HttpHelper().doPostRequest(insightUri, annotationData, user);
    var status = Status.fromJson(json.decode(response.body));
    return status;
  }

  static Future<SpellingCorrection> getIngredientSpellingCorrection(
      {String ingredientName, Product product, User user}) async {
    Map<String, String> spellingCorrectionParam;

    if (ingredientName != null) {
      spellingCorrectionParam = {
        "text": ingredientName,
      };
    } else if (product != null) {
      spellingCorrectionParam = {
        "barcode": product.barcode,
      };
    } else {
      return null;
    }

    var spellingCorrectionUri = Uri(
        scheme: URI_SCHEME,
        host: URI_HOST_ROBOTOFF,
        path: 'api/v1/predict/ingredients/spellcheck',
        queryParameters: spellingCorrectionParam);

    Response response =
        await HttpHelper().doGetRequest(spellingCorrectionUri, user: user);
    SpellingCorrection result = SpellingCorrection.fromJson(
        json.decode(utf8.decode(response.bodyBytes)));

    return result;
  }

  /// login on the main page - not used
  static Future<String> login(User user) async {
    var loginUri = new Uri(scheme: URI_SCHEME, host: URI_HOST);
    Response response =
        await HttpHelper().doPostRequest(loginUri, user.toData(), user);
    return response.body;
  }
}
