import 'package:openfoodfacts/src/model/off_tagged.dart';

/// Field for the "order by" clause of "get prices".
enum GetPricesOrderField implements OffTagged {
  created(offTag: 'created'),
  date(offTag: 'date'),
  price(offTag: 'price');

  const GetPricesOrderField({required this.offTag});

  @override
  final String offTag;
}

/// Order clause for "get prices".
class GetPricesOrder implements OffTagged {
  const GetPricesOrder({
    required this.field,
    required this.ascending,
  });

  final GetPricesOrderField field;
  final bool ascending;

  @override
  String get offTag => '${ascending ? '' : '-'}${field.offTag}';
}
