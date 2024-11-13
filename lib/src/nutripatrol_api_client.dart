import 'package:http/http.dart';
import 'package:openfoodfacts/src/nutripatrol/get_tickets.dart';
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

  /// Get a ticket by its ID.
  ///
  /// [ticketId] is the ID of the ticket.
  static Future<MaybeError<Ticket>> getTicket({
    required final int ticketId,
    final UriProductHelper uriHelper = uriHelperFoodProd,
  }) async {
    assert(ticketId >= 0, "The id must be >= 0");
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
      } catch (_) {
        //
      }
    }
    return MaybeError<Ticket>.responseError(response);
  }

  /// Get all tickets.
  static Future<MaybeError<Tickets>> getTickets({
    final TicketStatus status = TicketStatus.open,
    final TicketType type_ = TicketType.image,
    final int? page,
    final int? pageSize,
    final UriProductHelper uriHelper = uriHelperFoodProd,
  }) async {
    final Map<String, String> queryParameters = <String, String>{};
    queryParameters['status'] = status.toString().split('.').last;
    queryParameters['type'] = type_.toString().split('.').last;
    if (page != null) queryParameters['page'] = page.toString();
    if (pageSize != null) queryParameters['page_size'] = pageSize.toString();

    final Uri uri = getUri(
      path: '/api/v1/tickets',
      queryParameters: queryParameters,
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
        return MaybeError<Tickets>.value(
          Tickets.fromJson(<String, dynamic>{
            'tickets': tickets,
            'max_page': decodedResponse['max_page'],
          }),
        );
      } catch (_) {
        //
      }
    }
    return MaybeError<Tickets>.responseError(response);
  }
}
