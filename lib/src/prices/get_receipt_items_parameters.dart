import 'get_parameters_helper.dart';
import 'get_receipt_items_order.dart';
import 'receipt_item_status.dart';

/// Parameters for the "get receipt items" API query.
///
/// cf. https://prices.openfoodfacts.org/api/docs
class GetReceiptItemsParameters
    extends GetParametersHelper<GetReceiptItemsOrderField> {
  DateTime? createdGte;
  DateTime? createdLte;
  String? proofOwner;
  int? proofId;
  ReceiptItemStatus? status;
  bool? statusIsNull;

  /// Returns the parameters as a query parameter map.
  @override
  Map<String, String> getQueryParameters() {
    super.getQueryParameters();
    addNonNullDate(createdGte, 'created__gte', dayOnly: false);
    addNonNullDate(createdLte, 'created__lte', dayOnly: false);
    addNonNullString(proofOwner, 'proof__owner');
    addNonNullInt(proofId, 'proof_id');
    addNonNullString(status?.offTag, 'status');
    addNonNullBool(statusIsNull, 'status__isnull');
    return result;
  }
}
