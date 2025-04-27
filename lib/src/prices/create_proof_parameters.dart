import 'common_proof_parameters.dart';
import 'proof_type.dart';

/// Parameters for the "upload proof" API query.
///
/// cf. https://prices.openfoodfacts.org/api/docs
class CreateProofParameters extends CommonProofParameters {
  CreateProofParameters(this.type);

  @override
  final ProofType type;
}
