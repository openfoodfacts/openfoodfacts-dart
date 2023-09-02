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
import 'utils/query_type.dart';
import 'utils/server_type.dart';
import 'utils/uri_helper.dart';

class RobotoffAPIClient {
  RobotoffAPIClient._();

  static Future<InsightsResult> getRandomInsights({
    InsightType? type,
    Iterable<OpenFoodFactsCountry>? countries,
    String? valueTag,
    // TODO: deprecated from 2023-06-13; remove when old enough
    @Deprecated('Not used anymore') String? serverDomain,
    ServerType? serverType,
    int? count,
    QueryType? queryType,
  }) async {
    final Map<String, String> parameters = {
      if (type != null) 'type': type.offTag,
      if (countries?.isNotEmpty == true)
        'countries': _getCountryList(countries!),
      if (valueTag != null) 'value_tag': valueTag,
      if (count != null) 'count': count.toString(),
      if (serverType != null) 'server_type': serverType.offTag,
    };

    var insightUri = UriHelper.getRobotoffUri(
      path: 'api/v1/insights/random/',
      queryType: queryType,
      queryParameters: parameters,
    );

    Response response = await HttpHelper().doGetRequest(
      insightUri,
      queryType: queryType,
    );
    var result = InsightsResult.fromJson(
      HttpHelper().jsonDecode(utf8.decode(response.bodyBytes)),
    );

    return result;
  }

  static Future<InsightsResult> getProductInsights(
    String barcode, {
    ServerType? serverType,
    QueryType? queryType,
  }) async {
    final Map<String, String> parameters = <String, String>{
      if (serverType != null) 'server_type': serverType.offTag,
    };

    var insightsUri = UriHelper.getRobotoffUri(
      path: 'api/v1/insights/$barcode',
      queryType: queryType,
      queryParameters: parameters,
    );

    Response response = await HttpHelper().doGetRequest(
      insightsUri,
      queryType: queryType,
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
    QueryType? queryType,
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

  // TODO: deprecated from 2023-06-13; remove when old enough
  @Deprecated('Use getQuestions instead')
  static Future<RobotoffQuestionResult> getRandomQuestions(
    OpenFoodFactsLanguage language,
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
      'lang': language.code,
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
    QueryType? queryType,
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

    var robotoffQuestionUri = UriHelper.getRobotoffUri(
      path: 'api/v1/questions',
      queryParameters: parameters,
      queryType: queryType,
    );

    final Response response = await HttpHelper().doGetRequest(
      robotoffQuestionUri,
      user: user,
      queryType: queryType,
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
      null,
      queryType: queryType,
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
