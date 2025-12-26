import 'order_by.dart';

/// Field for the "order by" clause of "get challenges".
enum GetChallengesOrderField implements OrderByField {
  created(offTag: 'created'),
  updated(offTag: 'updated');

  const GetChallengesOrderField({required this.offTag});

  @override
  final String offTag;
}
