import 'package:openfoodfacts/model/Allergens.dart';
import 'package:openfoodfacts/model/parameter/BoolMapParameter.dart';

/// List of allergens to filter in and out.
///
/// When we have several items, the results returned use a logical AND.
class AllergensParameter extends BoolMapParameter<AllergensTag> {
  @override
  String getName() => 'allergens_tags';

  @override
  String getTag(final AllergensTag key, final bool value) =>
      value ? key.tag : '-${key.tag}';

  const AllergensParameter({required final Map<AllergensTag, bool> map})
      : super(map: map);
}
