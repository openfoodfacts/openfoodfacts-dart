import 'package:openfoodfacts/interface/Parameter.dart';
import 'package:openfoodfacts/model/State.dart';

/// States Tags as completed or to-be-completed.
class StatesTagsParameter extends Parameter {
  @override
  String getName() => 'states_tags';

  @override
  String getValue() {
    final List<String> result = <String>[];
    for (final MapEntry<State, bool> item in completed.entries) {
      result.add(
        item.value ? item.key.completedTag : item.key.toBeCompletedTag,
      );
    }
    return result.join(',');
  }

  /// [State]s to be considered as completed (true) or to-be-completed (false).
  ///
  /// When we have several items, the results returned use a logical AND.
  final Map<State, bool> completed;

  StatesTagsParameter({required this.completed});
}
