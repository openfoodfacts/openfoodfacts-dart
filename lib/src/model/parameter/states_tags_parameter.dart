import '../product_state.dart';
import 'bool_map_parameter.dart';

/// States Tags as completed or to-be-completed.
class StatesTagsParameter extends BoolMapParameter<ProductState> {
  @override
  String getName() => 'states_tags';

  @override
  String getTag(final ProductState key, final bool value) =>
      value ? key.completedTag : key.toBeCompletedTag;

  const StatesTagsParameter({required super.map});
}
