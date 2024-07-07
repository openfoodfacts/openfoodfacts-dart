import 'order_by.dart';

/// Field for the "order by" clause of "get proofs".
enum GetProofsOrderField implements OrderByField {
  priceCount(offTag: 'price_count'),
  created(offTag: 'created');

  const GetProofsOrderField({required this.offTag});

  @override
  final String offTag;
}
