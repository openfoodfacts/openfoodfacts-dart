import 'order_by.dart';

/// Field for the "order by" clause of "get price products".
enum GetPriceProductsOrderField implements OrderByField {
  priceCount(offTag: 'price_count'),
  created(offTag: 'created'),
  updated(offTag: 'updated');

  const GetPriceProductsOrderField({required this.offTag});

  @override
  final String offTag;
}
