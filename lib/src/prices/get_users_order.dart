import 'order_by.dart';

/// Field for the "order by" clause of "get users".
enum GetUsersOrderField implements OrderByField {
  priceCount(offTag: 'price_count'),
  userId(offTag: 'user_id');

  const GetUsersOrderField({required this.offTag});

  @override
  final String offTag;
}
