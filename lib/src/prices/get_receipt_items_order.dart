import 'order_by.dart';

/// Field for the "order by" clause of "get receipt items".
enum GetReceiptItemsOrderField implements OrderByField {
  created(offTag: 'created'),
  id(offTag: 'id'),
  updated(offTag: 'updated'),
  order(offTag: 'order'),
  status(offTag: 'status');

  const GetReceiptItemsOrderField({required this.offTag});

  @override
  final String offTag;
}
