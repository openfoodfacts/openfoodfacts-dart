import 'order_by.dart';

/// Field for the "order by" clause of "get locations".
enum GetLocationsOrderField implements OrderByField {
  created(offTag: 'created'),
  updated(offTag: 'updated');

  const GetLocationsOrderField({required this.offTag});

  @override
  final String offTag;
}
