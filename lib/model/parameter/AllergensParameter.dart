import 'package:openfoodfacts/interface/Parameter.dart';
import 'package:openfoodfacts/model/Allergens.dart';

/// List of allergens to filter in and out. Filter combo mode is 'AND'.
class AllergensParameter extends Parameter {
  @override
  String getName() => 'allergens_tags';

  @override
  String getValue() {
    final List<String> result = <String>[];
    if (include != null) {
      for (final AllergensTag value in include!) {
        result.add(value.tag);
      }
    }
    if (exclude != null) {
      for (final AllergensTag value in exclude!) {
        result.add('-${value.tag}');
      }
    }
    return result.join(',');
  }

  final Iterable<AllergensTag>? include;
  final Iterable<AllergensTag>? exclude;

  const AllergensParameter({this.include, this.exclude});
}
