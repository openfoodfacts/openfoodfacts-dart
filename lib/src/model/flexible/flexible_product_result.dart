import 'package:meta/meta.dart';

import 'flexible_map.dart';
import 'flexible_product.dart';
import '../localized_tag.dart';
import '../product_result_field_answer.dart';
import '../product_result_v3.dart';
import '../../utils/uri_helper.dart';

/// API answer from a call to /api/v???/product/$barcode, in a flexible manner.
@experimental
class FlexibleProductResult extends FlexibleMap {
  FlexibleProductResult(
    super.json, {
    required this.uriHelper,
  });

  final UriProductHelper uriHelper;

  String? get barcode => json['code'] as String?;

  LocalizedTag? get result => json['result'] == null
      ? null
      : LocalizedTag.fromJson(json['result'] as Map<String, dynamic>);

  String? get status => json['status'] as String?;

  List<ProductResultFieldAnswer>? get errors =>
      ProductResultV3.fromJsonListAnswerForField(json['errors']);

  List<ProductResultFieldAnswer>? get warnings =>
      ProductResultV3.fromJsonListAnswerForField(json['warnings']);

  FlexibleProduct? get product => json['product'] == null
      ? null
      : FlexibleProduct.fromServer(
          json['product'] as JsonMap,
          uriHelper: uriHelper,
        );
}
