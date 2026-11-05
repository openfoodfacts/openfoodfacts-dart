import 'order_by.dart';

/// Field for the "order by" clause of "get price tags".
enum GetPriceTagsOrderField implements OrderByField {
  created(offTag: 'created'),
  id(offTag: 'id'),
  updated(offTag: 'updated'),
  predictionCount(offTag: 'prediction_count'),
  status(offTag: 'status');

  const GetPriceTagsOrderField({required this.offTag});

  @override
  final String offTag;
}
