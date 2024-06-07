import 'package:json_annotation/json_annotation.dart';
import '../model/off_tagged.dart';

/// Type of a Proof.
///
/// cf. ProofTypeEnum in https://prices.openfoodfacts.org/api/docs
enum ProofType implements OffTagged {
  @JsonValue('PRICE_TAG')
  priceTag(offTag: 'PRICE_TAG'),

  @JsonValue('RECEIPT')
  receipt(offTag: 'RECEIPT'),

  @JsonValue('GDPR_REQUEST')
  gdprRequest(offTag: 'GDPR_REQUEST');

  const ProofType({
    required this.offTag,
  });

  @override
  final String offTag;

  /// Returns the first [ProofType] that matches the [offTag].
  static ProofType? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, ProofType.values) as ProofType?;
}
