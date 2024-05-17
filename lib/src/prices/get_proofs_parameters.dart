import 'get_price_count_parameters_helper.dart';
import 'get_proofs_order.dart';
import 'proof_type.dart';

/// Parameters for the "get proofs" API query.
///
/// cf. https://prices.openfoodfacts.org/api/docs
class GetProofsParameters
    extends GetPriceCountParametersHelper<GetProofsOrderField> {
  String? owner;
  ProofType? type;

  /// Returns the parameters as a query parameter map.
  @override
  Map<String, String> getQueryParameters() {
    super.getQueryParameters();
    addNonNullString(owner, 'owner');
    addNonNullString(type?.offTag, 'type');
    return result;
  }
}
