import 'order_by.dart';

/// Field for the "order by" clause of "get receipt items".
enum GetReceiptItemsOrderField implements OrderByField {
  created(offTag: 'created'),
  id(offTag: 'id'),
  order(offTag: 'order'),
  proofId(offTag: 'proof_id'),
  status(offTag: 'status');

  const GetReceiptItemsOrderField({required this.offTag});

  @override
  final String offTag;
}
