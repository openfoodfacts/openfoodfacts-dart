import 'dart:convert';

import 'package:http/http.dart';
import 'package:openfoodfacts/src/prices/maybe_error.dart';
import 'utils/http_helper.dart';
import 'utils/open_food_api_configuration.dart';
import 'utils/uri_helper.dart';

import 'nutripatrol/get_ticket.dart';

/// Client calls of the Nutripatrol API.
///
/// cf. [Nutripatrol](https://nutripatrol.openfoodfacts.org/api/docs)
class NutripatrolApiClient {
  NutripatrolApiClient._();

  /// Subdomain of the Nutripatrol API.
  static const String _subdomain = 'nutripatrol';
  
  /// Host of the Elastic Search API.
  static String _getHost(final UriProductHelper uriHelper) =>
      uriHelper.getHost(_subdomain);

  static Uri getUri({
    required final String path,
    final Map<String, dynamic>? queryParameters,
    final UriProductHelper uriHelper = uriHelperFoodProd,
    final bool? addUserAgentParameters,
  }) =>
      uriHelper.getUri(
        path: path,
        queryParameters: queryParameters,
        forcedHost: _getHost(uriHelper),
        addUserAgentParameters: addUserAgentParameters,
      );

  static Future<MaybeError<Ticket>> getTicket({
    required final int ticketId,
    final UriProductHelper uriHelper = uriHelperFoodProd,
  }) async {
    final Uri uri = getUri(
      path: '/api/v1/tickets/$ticketId',
      uriHelper: uriHelper,
    );
    final Response response = await HttpHelper().doGetRequest(
      uri,
      uriHelper: uriHelper,
    );
    if (response.statusCode == 200) {
      try {
        final dynamic decodedResponse = HttpHelper().jsonDecodeUtf8(response);
        return MaybeError<Ticket>.value(Ticket.fromJson(decodedResponse));
      } catch (e) {
        //
      }
    }
    return MaybeError<Ticket>.responseError(response);
  }

  static Future<MaybeError<List<Ticket>>> getTickets({
    required final String barcode,
    final UriProductHelper uriHelper = uriHelperFoodProd,
  }) async {
    final Uri uri = getUri(
      path: '/api/v1/tickets',
      uriHelper: uriHelper,
    );
    final Response response = await HttpHelper().doGetRequest(
      uri,
      uriHelper: uriHelper,
    );
    if (response.statusCode == 200) {
      try {
        final dynamic decodedResponse = HttpHelper().jsonDecodeUtf8(response);
        final List<dynamic> tickets = decodedResponse['tickets'];
        return MaybeError<List<Ticket>>.value(
          tickets.map((dynamic ticket) => Ticket.fromJson(ticket)).toList(),
        );
      } catch (e) {
        //
      }
    }
    return MaybeError<List<Ticket>>.responseError(response);
  }
}