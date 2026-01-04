import 'ingredients_filter_parameter.dart';
import '../../interface/parameter.dart';

/// "Unwanted Ingredients" search API parameter.
///
/// If you put an ingredient tag here and if you ask for the attribute_group
/// field, you'll get a new attribute group stating if the ingredient tag is
/// there (or no), with the specific 100 (or 0) match value in order to
/// compute the score.
/// This is NOT a filter, it only helps computing the score.
/// If you want a filter, use [IngredientsFilterParameter] instead.
class IngredientsUnwantedParameter extends Parameter {
  @override
  String getName() => 'attribute_unwanted_ingredients_tags';

  @override
  String getValue() => tags.join(',');

  final List<String> tags;

  const IngredientsUnwantedParameter(this.tags);
}
