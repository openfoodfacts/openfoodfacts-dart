import '../model/off_tagged.dart';

/// "Order by" field for "get list" methods (e.g. "get prices")
abstract class OrderByField implements OffTagged {}

/// "Order by" clause for "get list" methods (e.g. "get prices")
class OrderBy<T extends OrderByField> implements OffTagged {
  const OrderBy({required this.field, required this.ascending});

  final T field;
  final bool ascending;

  @override
  String get offTag => '${ascending ? '' : '-'}${field.offTag}';
}
