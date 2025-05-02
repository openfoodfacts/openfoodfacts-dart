import 'common_proof_parameters.dart';
import 'proof_type.dart';

/// Parameters for the "update proof" API query.
///
/// cf. https://prices.openfoodfacts.org/api/docs
class UpdateProofParameters extends CommonProofParameters {
  @override
  ProofType? type;
}
