import 'package:json_annotation/json_annotation.dart';
import 'localized_tag.dart';
import 'product.dart';
import 'product_result_field_answer.dart';
import '../interface/json_object.dart';

part 'product_result_v3.g.dart';

/// API V3 answer from a call to /api/v3/product/$barcode.
///
/// Same /api/v3/product/$barcode URL can be used for GET (get that product)
/// and PATCH (upsert that product and return the modified version).
@JsonSerializable()
class ProductResultV3 extends JsonObject {
  ProductResultV3();

  /// Barcode of a GET operation.
  @JsonKey(name: 'code', includeIfNull: false)
  String? barcode;

  /// Result, e.g. "Product found".
  ///
  /// Does not seem to be populated for PATH=update.
  @JsonKey(includeIfNull: false)
  LocalizedTag? result;

  /// Status.
  ///
  /// Typical values: [statusFailure], [statusWarning] or [statusSuccess]
  @JsonKey(includeIfNull: false)
  String? status;

  /// Errors.
  ///
  /// Typically populated if [status] is [statusFailure].
  @JsonKey(includeIfNull: false, fromJson: _fromJsonListAnswerForField)
  List<ProductResultFieldAnswer>? errors;

  /// Warnings.
  ///
  /// Typically populated if [status] is [statusWarning].
  @JsonKey(includeIfNull: false, fromJson: _fromJsonListAnswerForField)
  List<ProductResultFieldAnswer>? warnings;

  @JsonKey(includeIfNull: false)
  Product? product;

  /// Possible value for [status]: the operation failed.
  static const String statusFailure = 'failure';

  /// Possible value for [status]: the operation succeeded with warnings.
  static const String statusWarning = 'success_with_warnings';

  /// Possible value for [status]: the operation succeeded.
  static const String statusSuccess = 'success';

  /// Possible value for `result.id`: product found.
  static const String resultProductFound = 'product_found';

  /// Possible value for `result.id`: product not found.
  static const String resultProductNotFound = 'product_not_found';

  factory ProductResultV3.fromJson(Map<String, dynamic> json) =>
      _$ProductResultV3FromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductResultV3ToJson(this);

  @override
  String toString() => toJson().toString();

  /// From a `List<AnswerForField>` in `dynamic`'s clothing (JsonKey)
  static List<ProductResultFieldAnswer>? _fromJsonListAnswerForField(
    dynamic list,
  ) {
    if (list == null) {
      return null;
    }
    if (list is! List<dynamic>) {
      throw Exception('Expected type: List<dynamic>, got ${list.runtimeType}');
    }
    final List<ProductResultFieldAnswer> result = <ProductResultFieldAnswer>[];
    for (final item in list) {
      result.add(ProductResultFieldAnswer.fromJson(item));
    }
    return result;
  }
}
