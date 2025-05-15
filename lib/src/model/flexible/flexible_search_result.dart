import 'package:meta/meta.dart';

import 'flexible_map.dart';
import 'flexible_product.dart';
import '../../interface/json_object.dart';
import '../../utils/uri_helper.dart';

/// API answer from a call product search, in a flexible manner.
@experimental
class FlexibleSearchResult extends FlexibleMap {
  FlexibleSearchResult(
    super.json, {
    required this.uriHelper,
  });

  final UriProductHelper uriHelper;

  int? get page => JsonObject.parseInt(json['page']);

  int? get pageSize => JsonObject.parseInt(json['page_size']);

  int? get count => JsonObject.parseInt(json['count']);

  int? get pageCount => JsonObject.parseInt(json['page_count']);

  int? get skip => JsonObject.parseInt(json['skip']);

  Iterable<FlexibleProduct>? get products =>
      (json['products'] as List<dynamic>?)?.map(
        (toElement) => FlexibleProduct.fromServer(
          toElement,
          uriHelper: uriHelper,
        ),
      );
}
