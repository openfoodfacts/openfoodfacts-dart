import 'package:json_annotation/json_annotation.dart';
import '../model/off_tagged.dart';

/// Status of a receipt item.
///
/// cf. `ReceiptItemFullStatusEnum` in https://prices.openfoodfacts.org/api/docs
enum ReceiptItemStatus implements OffTagged {
  @JsonValue(0)
  deleted(code: 0, offTag: '0'),

  @JsonValue(1)
  linkedToPrice(code: 1, offTag: '1');

  const ReceiptItemStatus({required this.code, required this.offTag});

  final int code;

  @override
  final String offTag;

  /// Returns the first [ReceiptItemStatus] that matches the [offTag].
  static ReceiptItemStatus? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, ReceiptItemStatus.values)
          as ReceiptItemStatus?;
}
