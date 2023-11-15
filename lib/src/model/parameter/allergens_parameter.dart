import '../allergens.dart';
import 'bool_map_parameter.dart';

/// List of allergens to filter in and out.
///
/// When we have several items, the results returned use a logical AND.
class AllergensParameter extends BoolMapParameter<AllergensTag> {
  @override
  String getName() => 'allergens_tags';

  @override
  String getTag(final AllergensTag key, final bool value) =>
      value ? key.offTag : '-${key.offTag}';

  const AllergensParameter({required super.map});
}
