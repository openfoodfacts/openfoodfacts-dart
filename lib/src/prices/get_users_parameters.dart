import 'get_price_count_parameters_helper.dart';
import 'get_users_order.dart';

/// Parameters for the "get users" API query.
///
/// cf. https://prices.openfoodfacts.org/api/docs
class GetUsersParameters
    extends GetPriceCountParametersHelper<GetUsersOrderField> {}
