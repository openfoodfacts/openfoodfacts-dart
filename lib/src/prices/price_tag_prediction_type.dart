import 'package:json_annotation/json_annotation.dart';
import '../model/off_tagged.dart';

/// Type of a price tag prediction.
///
/// cf. `PriceTagPredictionTypeEnum` in https://prices.openfoodfacts.org/api/docs
enum PriceTagPredictionType implements OffTagged {
  @JsonValue('PRICE_TAG_EXTRACTION')
  priceTagExtraction(offTag: 'PRICE_TAG_EXTRACTION'),

  @JsonValue('PRICE_TAG_CLF')
  priceTagClf(offTag: 'PRICE_TAG_CLF');

  const PriceTagPredictionType({required this.offTag});

  @override
  final String offTag;

  /// Returns the first [PriceTagPredictionType] that matches the [offTag].
  static PriceTagPredictionType? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, PriceTagPredictionType.values)
          as PriceTagPredictionType?;
}
