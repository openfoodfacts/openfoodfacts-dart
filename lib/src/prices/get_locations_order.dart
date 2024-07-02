import 'order_by.dart';

/// Field for the "order by" clause of "get locations".
enum GetLocationsOrderField implements OrderByField {
  priceCount(offTag: 'price_count'),
  created(offTag: 'created'),
  updated(offTag: 'updated');

  const GetLocationsOrderField({required this.offTag});

  @override
  final String offTag;
}
