import 'order_by.dart';

/// Field for the "order by" clause of "get price tags".
enum GetPriceTagsOrderField implements OrderByField {
  created(offTag: 'created'),
  id(offTag: 'id'),
  proofId(offTag: 'proof_id'),
  status(offTag: 'status');

  const GetPriceTagsOrderField({required this.offTag});

  @override
  final String offTag;
}
