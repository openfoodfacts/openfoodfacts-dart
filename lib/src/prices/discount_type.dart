import 'package:json_annotation/json_annotation.dart';
import '../model/off_tagged.dart';

/// Discount Type, for Prices.
///
/// cf. DiscountTypeEnum in https://prices.openfoodfacts.org/api/docs
enum DiscountType implements OffTagged {
  @JsonValue('QUANTITY')
  quantity(offTag: 'QUANTITY'),
  @JsonValue('SALE')
  sale(offTag: 'SALE'),
  @JsonValue('SEASONAL')
  seasonal(offTag: 'SEASONAL'),
  @JsonValue('LOYALTY_PROGRAM')
  loyaltyProgram(offTag: 'LOYALTY_PROGRAM'),
  @JsonValue('EXPIRES_SOON')
  expiresSoon(offTag: 'EXPIRES_SOON'),
  @JsonValue('PICK_IT_YOURSELF')
  pickItYourself(offTag: 'PICK_IT_YOURSELF'),
  @JsonValue('SECOND_HAND')
  secondHand(offTag: 'SECOND_HAND'),
  @JsonValue('OTHER')
  other(offTag: 'OTHER');

  const DiscountType({required this.offTag});

  @override
  final String offTag;

  /// Returns the first [DiscountType] that matches the [offTag].
  static DiscountType? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, DiscountType.values) as DiscountType?;
}
