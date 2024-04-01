import 'order_by.dart';

/// Field for the "order by" clause of "get prices".
enum GetPricesOrderField implements OrderByField {
  created(offTag: 'created'),
  date(offTag: 'date'),
  price(offTag: 'price');

  const GetPricesOrderField({required this.offTag});

  @override
  final String offTag;
}
