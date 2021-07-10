/// Abstract search API parameter, to be used in the search URI
abstract class Parameter {
  /// URI parameter name
  String getName();

  /// URI parameter value
  String getValue();

  @override
  String toString() => '&${getName()}=${getValue()}';

  const Parameter();

  /// Adds this parameter to [uriParameters] for the search API URI
  ///
  /// Only for [TagFilter]s it's not a simple 'X=Y' URI parameter;
  /// int that case we need 3 URI parameters, linked by the same [index] value.
  /// And then we return an incremented value of this index.
  ///
  /// But in most cases we don't use [index], and just return it untouched.
  int addToMap(
    final Map<String, String> uriParameters,
    final int index,
  ) {
    uriParameters.putIfAbsent(getName(), () => getValue());
    return index;
  }
}
