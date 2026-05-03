import 'ingredients_unwanted_parameter.dart';
import 'bool_map_parameter.dart';

/// List of ingredients tags to filter in and out.
///
/// When we have several items, the results returned use a logical AND.
/// This IS a filter, for products explicitly with (or without) those tags.
/// If you still want the products but with a "no matching" score instead, use
/// [IngredientsUnwantedParameter].
class IngredientsFilterParameter extends BoolMapParameter<String> {
  @override
  String getName() => 'ingredients_tags';

  @override
  String getTag(final String key, final bool value) => value ? key : '-$key';

  const IngredientsFilterParameter(final Map<String, bool> filters)
    : super(map: filters);
}
