/// Abstract search API parameter, to be used in the search URI
///
/// Typical use will be 'name=value'
abstract class Parameter {
  /// URI parameter name
  String getName();

  /// URI parameter value
  String getValue();

  @override
  String toString() => '&${getName()}=${getValue()}';

  const Parameter();
}
