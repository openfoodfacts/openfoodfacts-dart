import 'package:openfoodfacts/model/State.dart';
import 'package:openfoodfacts/model/parameter/BoolMapParameter.dart';

/// States Tags as completed or to-be-completed.
class StatesTagsParameter extends BoolMapParameter<State> {
  @override
  String getName() => 'states_tags';

  @override
  String getTag(final State key, final bool value) =>
      value ? key.completedTag : key.toBeCompletedTag;

  StatesTagsParameter({required final Map<State, bool> map}) : super(map: map);
}
