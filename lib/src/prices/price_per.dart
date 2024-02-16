import 'package:json_annotation/json_annotation.dart';
import '../model/off_tagged.dart';

/// Price Per.
///
/// cf. PricePerEnum in https://prices.openfoodfacts.org/api/docs
enum PricePer implements OffTagged {
  @JsonValue('UNIT')
  unit(offTag: 'UNIT'),

  @JsonValue('KILOGRAM')
  kilogram(offTag: 'KILOGRAM');

  const PricePer({
    required this.offTag,
  });

  @override
  final String offTag;
}
