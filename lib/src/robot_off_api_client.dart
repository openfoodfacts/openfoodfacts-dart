import 'dart:convert';

import 'package:http/http.dart';

import 'model/insight.dart';
import 'model/robotoff_question.dart';
import 'model/robotoff_question_order.dart';
import 'model/status.dart';
import 'model/user.dart';
import 'utils/country_helper.dart';
import 'utils/http_helper.dart';
import 'utils/language_helper.dart';
import 'utils/open_food_api_configuration.dart';
import 'utils/server_type.dart';
import 'utils/uri_helper.dart';

class RobotoffAPIClient {
  RobotoffAPIClient._();

  static Future<InsightsResult> getRandomInsights({
    InsightType? type,
    Iterable<OpenFoodFactsCountry>? countries,
    String? valueTag,
    ServerType? serverType,
    int? count,
    final UriHelper uriHelper = uriHelperRobotoffProd,
  }) async {
    final Map<String, String> parameters = {
      if (type != null) 'type': type.offTag,
      if (countries?.isNotEmpty == true)
        'countries': _getCountryList(countries!),
      if (valueTag != null) 'value_tag': valueTag,
      if (count != null) 'count': count.toString(),
      if (serverType != null) 'server_type': serverType.offTag,
    };

    var insightUri = uriHelper.getUri(
      path: 'api/v1/insights/random/',
      queryParameters: parameters,
    );

    Response response = await HttpHelper().doGetRequest(
      insightUri,
      uriHelper: uriHelper,
    );
    var result = InsightsResult.fromJson(
      HttpHelper().jsonDecode(utf8.decode(response.bodyBytes)),
    );

    return result;
  }

  static Future<InsightsResult> getProductInsights(
    String barcode, {
    ServerType? serverType,
    final UriHelper uriHelper = uriHelperRobotoffProd,
  }) async {
    final Map<String, String> parameters = <String, String>{
      if (serverType != null) 'server_type': serverType.offTag,
    };

    var insightsUri = uriHelper.getUri(
      path: 'api/v1/insights/$barcode',
      queryParameters: parameters,
    );

    Response response = await HttpHelper().doGetRequest(
      insightsUri,
      uriHelper: uriHelper,
    );

    return InsightsResult.fromJson(
      HttpHelper().jsonDecode(utf8.decode(response.bodyBytes)),
    );
  }

  static Future<RobotoffQuestionResult> getProductQuestions(
    String barcode,
    OpenFoodFactsLanguage language, {
    User? user,
    int? count,
    ServerType? serverType,
    final UriHelper uriHelper = uriHelperRobotoffProd,
    List<InsightType>? insightTypes,
  }) async {
    final Map<String, String> parameters = <String, String>{
      'lang': language.code,
      if (count != null) 'count': count.toString(),
      if (serverType != null) 'server_type': serverType.offTag,
      if (insightTypes != null)
        'insight_types':
            insightTypes.map((InsightType type) => type.offTag).join(','),
    };

    var robotoffQuestionUri = uriHelper.getUri(
      path: 'api/v1/questions/$barcode',
      queryParameters: parameters,
    );

    Response response = await HttpHelper().doGetRequest(
      robotoffQuestionUri,
      user: user,
      uriHelper: uriHelper,
    );
    var result = RobotoffQuestionResult.fromJson(
      HttpHelper().jsonDecode(utf8.decode(response.bodyBytes)),
    );

    return result;
  }

  /// cf. https://openfoodfacts.github.io/robotoff/references/api/#tag/Questions/paths/~1questions/get
  static Future<RobotoffQuestionResult> getQuestions(
    OpenFoodFactsLanguage language, {
    User? user,
    int? count,
    int? page,
    List<InsightType>? insightTypes,
    Iterable<OpenFoodFactsCountry>? countries,
    List<String>? brands,
    RobotoffQuestionOrder? questionOrder,
    ServerType? serverType,
    String? valueTag,
    final UriHelper uriHelper = uriHelperRobotoffProd,
  }) async {
    final List<String> insightValues = [];
    if (insightTypes != null) {
      for (final InsightType insightType in insightTypes) {
        insightValues.add(insightType.offTag);
      }
    }

    final Map<String, String> parameters = <String, String>{
      'lang': language.code,
      if (count != null) 'count': count.toString(),
      if (page != null) 'page': page.toString(),
      if (serverType != null) 'server_type': serverType.offTag,
      if (insightValues.isNotEmpty) 'insight_types': insightValues.join(','),
      if (brands?.isNotEmpty == true) 'brands': brands!.join(','),
      if (questionOrder != null) 'order_by': questionOrder.offTag,
      if (countries?.isNotEmpty == true)
        'countries': _getCountryList(countries!),
      if (valueTag != null) 'value_tag': valueTag,
    };

    var robotoffQuestionUri = uriHelper.getUri(
      path: 'api/v1/questions',
      queryParameters: parameters,
    );

    final Response response = await HttpHelper().doGetRequest(
      robotoffQuestionUri,
      user: user,
      uriHelper: uriHelper,
    );
    return RobotoffQuestionResult.fromJson(
      HttpHelper().jsonDecode(utf8.decode(response.bodyBytes)),
    );
  }

  static Future<Status> postInsightAnnotation(
    String? insightId,
    InsightAnnotation annotation, {
    String? deviceId,
    bool update = true,
    final UriHelper uriHelper = uriHelperRobotoffProd,
  }) async {
    var insightUri = uriHelper.getUri(
      path: 'api/v1/insights/annotate',
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
      null,
      uriHelper: uriHelper,
      addCredentialsToBody: false,
      addCredentialsToHeader: true,
    );
    return Status.fromApiResponse(response.body);
  }

  /// Returns a list of country as comma-separated 2-letter codes
  static String _getCountryList(
    final Iterable<OpenFoodFactsCountry> countries,
  ) {
    final List<String> result = <String>[];
    for (final OpenFoodFactsCountry country in countries) {
      result.add(country.offTag);
    }
    return result.join(',');
  }
}
