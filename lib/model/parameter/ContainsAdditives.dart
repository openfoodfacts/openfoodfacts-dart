import 'package:openfoodfacts/interface/Parameter.dart';

// TODO: deprecated from 2021-07-21 (#194); remove when old enough
/// "Contains additives?" search API parameter
@Deprecated('Use WithoutAdditives instead')
class ContainsAdditives extends Parameter {
  @override
  String getName() => 'additives';

  @override
  String getValue() => filter ? 'without' : '';

  // TODO: find a less misleading parameter name than "filter"
  // it looks like the filter is:
  // * `ContainsAdditives(filter: true)` means "without additives"
  // * `ContainsAdditives(filter: false)` means "no additive filter at all"
  final bool filter;

  const ContainsAdditives({required this.filter});
}
