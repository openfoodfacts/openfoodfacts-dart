import 'package:openfoodfacts/interface/parameter.dart';
import 'package:meta/meta.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

/// Abstract map of [bool] as [Parameter].
///
/// Typical use-case with objects that have an on/off quality,
/// like "with/without gluten".
/// A query like "I want the products with eggs but without gluten" would be
/// something like "{'eggs': true, 'gluten': false}".
abstract class BoolMapParameter<T> extends Parameter {
  const BoolMapParameter({required this.map});

  final Map<T, bool> map;

  @override
  String getValue() {
    final List<String> result = <String>[];
    for (final MapEntry<T, bool> item in map.entries) {
      result.add(getTag(item.key, item.value));
    }
    return result.join(',');
  }

  /// Returns the tag as on or off, like "gluten:with" or "gluten:without"
  @protected
  String getTag(final T key, final bool value);
}
