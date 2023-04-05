import 'dart:convert';

import 'package:http/http.dart';

import 'model/insight.dart';
import 'model/robotoff_question.dart';
import 'model/status.dart';
import 'model/user.dart';
import 'utils/country_helper.dart';
import 'utils/http_helper.dart';
import 'utils/language_helper.dart';
import 'utils/query_type.dart';
import 'utils/uri_helper.dart';

class RobotOffAPIClient {
  RobotOffAPIClient._();

  static Future<InsightsResult> getRandomInsights({
    InsightType? type,
    OpenFoodFactsCountry? country,
    String? valueTag,
    String? serverDomain,
    QueryType? queryType,
  }) async {
    final Map<String, String> parameters = {};

    if (type != null && type.value != null) {
      parameters['type'] = type.value!;
    }
    if (country != null) {
      parameters['country'] = country.offTag;
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
      queryType: queryType,
    );
    var result = InsightsResult.fromJson(
      HttpHelper().jsonDecode(utf8.decode(response.bodyBytes)),
    );

    return result;
  }

  static Future<InsightsResult> getProductInsights(
    String barcode, {
    QueryType? queryType,
  }) async {
    var insightsUri = UriHelper.getRobotoffUri(
      path: 'api/v1/insights/$barcode',
      queryType: queryType,
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
    QueryType? queryType,
  }) async {
    if (count == null || count <= 0) {
      count = 1;
    }

    final Map<String, String> parameters = <String, String>{
      'lang': language.code,
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
}
