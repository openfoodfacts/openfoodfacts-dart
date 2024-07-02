import '../interface/json_object.dart';
import 'currency.dart';
import 'get_parameters_helper.dart';
import 'proof_type.dart';

/// Parameters for the "update proof" API query.
///
/// cf. https://prices.openfoodfacts.org/api/docs
class UpdateProofParameters extends JsonObject {
  /// Proof type.
  ProofType? type;

  /// Date when the product was bought.
  DateTime? date;

  /// Currency of the price.
  Currency? currency;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        if (type != null) 'type': type!.offTag,
        if (date != null) 'date': GetParametersHelper.formatDate(date!),
        if (currency != null) 'currency': currency!.name,
      };
}
