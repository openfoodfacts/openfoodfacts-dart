import 'dart:convert';

import 'package:http/http.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'nutripatrol/create_flag.dart';
import 'nutripatrol/get_tickets.dart';
import 'prices/maybe_error.dart';
import 'utils/nutripatrol_types.dart';
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
  static Future<MaybeError<NutripatrolTicket>> getTicket({
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
        return MaybeError<NutripatrolTicket>.value(
            NutripatrolTicket.fromJson(decodedResponse));
      } catch (_) {
        //
      }
    }
    return MaybeError<NutripatrolTicket>.responseError(response);
  }

  /// Get all tickets.
  static Future<MaybeError<NutripatrolTickets>> getTickets({
    final NutripatrolTicketStatus status = NutripatrolTicketStatus.open,
    final NutripatrolType type = NutripatrolType.image,
    final int? page,
    final int? pageSize,
    final UriProductHelper uriHelper = uriHelperFoodProd,
  }) async {
    final Map<String, String> queryParameters = <String, String>{};
    queryParameters['status'] = status.toString().split('.').last;
    queryParameters['type_'] = type.toString().split('.').last;
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
        return MaybeError<NutripatrolTickets>.value(
          NutripatrolTickets.fromJson(<String, dynamic>{
            'tickets': tickets,
            'max_page': decodedResponse['max_page'],
          }),
        );
      } catch (_) {
        //
      }
    }
    return MaybeError<NutripatrolTickets>.responseError(response);
  }

  /// Create a Flag for a product.
  ///
  /// [flag] is the flag to create.
  static Future<MaybeError<CreateNutripatrolFlag>> createFlag({
    final String? barcode,
    final String? comment,
    final double? confidence,
    final String? imageId,
    final NutripatrolFlagReason? reason,
    required final NutripatrolType type,
    required final String url,
    required final String userId,
    required final String deviceId,
    required final NutripatrolSource source,
    required final Flavor flavor,
    final UriProductHelper uriHelper = uriHelperFoodProd,
  }) async {
    final Uri uri = getUri(
      path: '/api/v1/flags',
      uriHelper: uriHelper,
    );
    final Response response = await HttpHelper().doPostJsonRequest(
        uri,
        jsonEncode(<String, dynamic>{
          'barcode': barcode,
          'comment': comment,
          'confidence': confidence,
          'image_id': imageId,
          'reason': reason.toString().split('.').last,
          'type': type.toString().split('.').last,
          'url': url,
          'user_id': userId,
          'device_id': deviceId,
          'source': source.toString().split('.').last,
          'flavor': flavor.offTag,
        }),
        uriHelper: uriHelper,
        bearerToken: "");
    if (response.statusCode == 200) {
      final dynamic decodedResponse = HttpHelper().jsonDecodeUtf8(response);
      return MaybeError<CreateNutripatrolFlag>.value(
          CreateNutripatrolFlag.fromJson(decodedResponse));
    }
    return MaybeError<CreateNutripatrolFlag>.responseError(response);
  }
}
