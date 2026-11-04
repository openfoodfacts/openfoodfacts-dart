import 'package:json_annotation/json_annotation.dart';
import '../model/off_tagged.dart';

/// Status of a price tag annotation.
///
/// cf. `PriceTagStatusEnum` in https://prices.openfoodfacts.org/api/docs
enum PriceTagStatus implements OffTagged {
  @JsonValue(0)
  deleted(code: 0, offTag: '0'),

  @JsonValue(1)
  linkedToPrice(code: 1, offTag: '1'),

  @JsonValue(2)
  notReadable(code: 2, offTag: '2'),

  @JsonValue(3)
  truncated(code: 3, offTag: '3'),

  @JsonValue(4)
  notPriceTag(code: 4, offTag: '4'),

  @JsonValue(5)
  noBarcode(code: 5, offTag: '5'),

  @JsonValue(10)
  other(code: 10, offTag: '10');

  const PriceTagStatus({required this.code, required this.offTag});

  final int code;

  @override
  final String offTag;

  /// Returns the first [PriceTagStatus] that matches the [offTag].
  static PriceTagStatus? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, PriceTagStatus.values) as PriceTagStatus?;
}
