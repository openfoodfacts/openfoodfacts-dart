import 'dart:convert';

import 'package:http/http.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class RobotoffApiClient {
  RobotoffApiClient._();

  //TODO(x): Add comments for robotoff APIs

  static Future<InsightsResult> getRandomInsights(
    User user, {
    InsightType? type,
    String? country,
    String? valueTag,
    String? serverDomain,
    QueryType? queryType,
  }) async {
    final Map<String, String> parameters = {};

    if (type != null && type.value != null) {
      parameters['type'] = type.value!;
    }
    if (country != null) {
      parameters['country'] = country;
    }
    if (valueTag != null) {
      parameters['value_tag'] = valueTag;
    }
    if (serverDomain != null) {
      parameters['server_domain'] = serverDomain;
    }

    var insightUri = UriHelper.getRobotoffUri(
      path: 'api/v1/insights/random/',
      queryType: queryType,
      queryParameters: parameters,
    );

    Response response = await HttpHelper().doGetRequest(
      insightUri,
      user: user,
      queryType: queryType,
    );
    var result = InsightsResult.fromJson(
      HttpHelper().jsonDecode(utf8.decode(response.bodyBytes)),
    );

    return result;
  }

  static Future<InsightsResult> getProductInsights(
    String barcode,
    User user, {
    QueryType? queryType,
  }) async {
    var insightsUri = UriHelper.getRobotoffUri(
      path: 'api/v1/insights/$barcode',
      queryType: queryType,
    );

    Response response = await HttpHelper().doGetRequest(
      insightsUri,
      user: user,
      queryType: queryType,
    );

    return InsightsResult.fromJson(
      HttpHelper().jsonDecode(utf8.decode(response.bodyBytes)),
    );
  }

  static Future<RobotoffQuestionResult> getProductQuestions(
    String barcode,
    String lang, {
    User? user,
    int? count,
    QueryType? queryType,
  }) async {
    if (count == null || count <= 0) {
      count = 1;
    }

    final Map<String, String> parameters = <String, String>{
      'lang': lang,
      'count': count.toString()
    };

    var robotoffQuestionUri = UriHelper.getRobotoffUri(
      path: 'api/v1/questions/$barcode',
      queryParameters: parameters,
      queryType: queryType,
    );

    Response response = await HttpHelper().doGetRequest(
      robotoffQuestionUri,
      user: user,
      queryType: queryType,
    );
    var result = RobotoffQuestionResult.fromJson(
      HttpHelper().jsonDecode(utf8.decode(response.bodyBytes)),
    );

    return result;
  }

  static Future<RobotoffQuestionResult> getRandomQuestions(
    String lang,
    User? user, {
    int? count,
    List<InsightType>? types,
    QueryType? queryType,
  }) async {
    if (count == null || count <= 0) {
      count = 1;
    }

    final List<String> typesValues = [];
    if (types != null) {
      for (final InsightType t in types) {
        final String? value = t.value;
        if (value != null) {
          typesValues.add(value);
        }
      }
    }

    final Map<String, String> parameters = <String, String>{
      'lang': lang,
      'count': count.toString(),
      if (typesValues.isNotEmpty) 'insight_types': typesValues.join(',')
    };

    var robotoffQuestionUri = UriHelper.getRobotoffUri(
      path: 'api/v1/questions/random',
      queryParameters: parameters,
      queryType: queryType,
    );

    Response response = await HttpHelper().doGetRequest(
      robotoffQuestionUri,
      user: user,
      queryType: queryType,
    );
    var result = RobotoffQuestionResult.fromJson(
      HttpHelper().jsonDecode(utf8.decode(response.bodyBytes)),
    );

    return result;
  }

  static Future<Status> postInsightAnnotation(
    String? insightId,
    InsightAnnotation annotation, {
    User? user,
    String? deviceId,
    bool update = true,
    final QueryType? queryType,
  }) async {
    var insightUri = UriHelper.getRobotoffUri(
      path: 'api/v1/insights/annotate',
      queryType: queryType,
    );

    final Map<String, String> annotationData = {
      'annotation': annotation.value.toString(),
      'update': update ? '1' : '0'
    };
    if (insightId != null) {
      annotationData['insight_id'] = insightId;
    }

    if (deviceId != null) {
      annotationData['device_id'] = deviceId;
    }

    Response response = await HttpHelper().doPostRequest(
      insightUri,
      annotationData,
      user,
      queryType: queryType,
      addCredentialsToBody: false,
      addCredentialsToHeader: true,
    );
    return Status.fromApiResponse(response.body);
  }

  // TODO: deprecated from 2022-11-22; remove when old enough
  @Deprecated('Unstable version, do not use and wait for the next version')
  static Future<SpellingCorrection?> getIngredientSpellingCorrection({
    String? ingredientName,
    Product? product,
    User? user,
    QueryType? queryType,
  }) async {
    Map<String, String> spellingCorrectionParam;

    if (ingredientName != null) {
      spellingCorrectionParam = {
        'text': ingredientName,
      };
    } else if (product != null && product.barcode != null) {
      spellingCorrectionParam = {
        'barcode': product.barcode!,
      };
    } else {
      return null;
    }

    var spellingCorrectionUri = UriHelper.getRobotoffUri(
      path: 'api/v1/predict/ingredients/spellcheck',
      queryType: queryType,
    );

    Response response = await HttpHelper().doPostRequest(
      spellingCorrectionUri,
      spellingCorrectionParam,
      user,
      queryType: queryType,
      addCredentialsToBody: false,
      addCredentialsToHeader: true,
    );
    SpellingCorrection result = SpellingCorrection.fromJson(
      HttpHelper().jsonDecode(utf8.decode(response.bodyBytes)),
    );

    return result;
  }
}
