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
    OpenFoodFactsCountry? country,
    String? valueTag,
    ServerType? serverType,
    int? count,
    QueryType? queryType,
  }) async {
    final Map<String, String> parameters = {
      if (type != null) 'type': type.offTag,
      if (country != null) 'country': _getLousyCountryTag(country),
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

  /// cf. https://openfoodfacts.github.io/robotoff/references/api/#tag/Questions/paths/~1questions/get
  static Future<RobotoffQuestionResult> getQuestions(
    OpenFoodFactsLanguage language, {
    User? user,
    int? count,
    int? page,
    List<InsightType>? insightTypes,
    OpenFoodFactsCountry? country,
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
      if (country != null) 'country': _getLousyCountryTag(country),
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

  /// Lousy conversion from a country to a country tag.
  ///
  /// In a near future, we should be able to get rid of this method, and pass
  /// directly the country (offTag).
  /// There are some countries for which I don't know if the country tag is
  /// misspelled or just if there are no data for this country.
  static String _getLousyCountryTag(final OpenFoodFactsCountry country) {
    switch (country) {
      case OpenFoodFactsCountry.BRUNEI_DARUSSALAM:
        return 'en:brunei';
      case OpenFoodFactsCountry.CZECHIA:
        return 'en:czech-republic';
      case OpenFoodFactsCountry.USA:
        return 'en:united-states';
      case OpenFoodFactsCountry.VIET_NAM:
        return 'en:vietnam';
      // from there I cannot say if the spelling is correct...
      case OpenFoodFactsCountry.ANTARCTICA:
      case OpenFoodFactsCountry.SAINT_BARTHELEMY:
      case OpenFoodFactsCountry.BAHAMAS:
      case OpenFoodFactsCountry.BHUTAN:
      case OpenFoodFactsCountry.BOUVET_ISLAND:
      case OpenFoodFactsCountry.COCOS_ISLANDS:
      case OpenFoodFactsCountry.CONGO:
      case OpenFoodFactsCountry.CABO_VERDE:
      case OpenFoodFactsCountry.CHRISTMAS_ISLAND:
      case OpenFoodFactsCountry.WESTERN_SAHARA:
      case OpenFoodFactsCountry.FALKLAND_ISLANDS:
      case OpenFoodFactsCountry.MICRONESIA:
      case OpenFoodFactsCountry.SOUTH_GEORGIA:
      case OpenFoodFactsCountry.GUINEA_BISSAU:
      case OpenFoodFactsCountry.HEARD_ISLAND:
      case OpenFoodFactsCountry.BRITISH_INDIAN_OCEAN_TERRITORY:
      case OpenFoodFactsCountry.KIRIBATI:
      case OpenFoodFactsCountry.NORTH_KOREA:
      case OpenFoodFactsCountry.LAOS:
      case OpenFoodFactsCountry.LESOTHO:
      case OpenFoodFactsCountry.MACAO:
      case OpenFoodFactsCountry.NORFOLK_ISLAND:
      case OpenFoodFactsCountry.NAURU:
      case OpenFoodFactsCountry.NIUE:
      case OpenFoodFactsCountry.PITCAIRN:
      case OpenFoodFactsCountry.PALESTINE:
      case OpenFoodFactsCountry.SUDAN:
      case OpenFoodFactsCountry.SAINT_HELENA:
      case OpenFoodFactsCountry.SVALBARD_AND_JAN_MAYEN:
      case OpenFoodFactsCountry.SAO_TOME_AND_PRINCIPE:
      case OpenFoodFactsCountry.ESWATINI:
      case OpenFoodFactsCountry.FRENCH_SOUTHERN_TERRITORIES:
      case OpenFoodFactsCountry.TAJIKISTAN:
      case OpenFoodFactsCountry.TOKELAU:
      case OpenFoodFactsCountry.TIMOR_LESTE:
      case OpenFoodFactsCountry.TURKMENISTAN:
      case OpenFoodFactsCountry.TONGA:
      case OpenFoodFactsCountry.TUVALU:
      case OpenFoodFactsCountry.UNITED_STATES_MINOR_OUTLYING_ISLANDS:
      case OpenFoodFactsCountry.HOLY_SEE:
      case OpenFoodFactsCountry.US_VIRGIN_ISLANDS:
      case OpenFoodFactsCountry.SAMOA:
      default:
        // works in most cases
        return 'en:${country.name.toLowerCase().replaceAll('_', '-')}';
    }
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
