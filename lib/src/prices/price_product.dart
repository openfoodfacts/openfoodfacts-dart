import 'flavor.dart';
import '../interface/json_map.dart';
import '../utils/json_helper.dart';

/// Product object in the Prices API.
///
/// cf. `ProductFull` in https://prices.openfoodfacts.org/api/docs
/// Read-only - we retrieve the data from the Prices API.
class PriceProduct extends JsonMap {
  /// Barcode (EAN) of the product, as a string.
  String get code => jsonMap['code'] as String;

  /// Number of prices for this product.
  int? get priceCount => (jsonMap['price_count'] as num?)?.toInt();

  /// Number of locations for this product.
  int? get locationCount => (jsonMap['location_count'] as num?)?.toInt();

  /// Number of users for this product.
  int? get userCount => (jsonMap['user_count'] as num?)?.toInt();

  /// Number of proofs for this product.
  int? get proofCount => (jsonMap['proof_count'] as num?)?.toInt();

  int get productId => (jsonMap['id'] as num).toInt();

  /// Source of data.
  Flavor? get source => Flavor.fromOffTag(jsonMap['source'] as String?);

  String? get name => jsonMap['product_name'] as String?;

  num? get quantity => jsonMap['product_quantity'] as num?;

  String? get quantityUnit => jsonMap['product_quantity_unit'] as String?;

  String? get quantityString => jsonMap['quantity'] as String?;

  List<String> get categoriesTags =>
      (jsonMap['categories_tags'] as List<dynamic>)
          .map((e) => e as String)
          .toList();

  String? get brands => jsonMap['brands'] as String?;

  List<String> get brandsTags => (jsonMap['brands_tags'] as List<dynamic>)
      .map((e) => e as String)
      .toList();

  List<String> get labelsTags => (jsonMap['labels_tags'] as List<dynamic>)
      .map((e) => e as String)
      .toList();

  String? get imageURL => jsonMap['image_url'] as String?;

  String? get nutriscoreGrade => jsonMap['nutriscore_grade'] as String?;

  String? get ecoscoreGrade => jsonMap['ecoscore_grade'] as String?;

  int? get novaGroup => (jsonMap['nova_group'] as num?)?.toInt();

  int get uniqueScansNumber => (jsonMap['unique_scans_n'] as num).toInt();

  DateTime get created => JsonHelper.stringTimestampToDate(jsonMap['created']);

  DateTime? get updated =>
      JsonHelper.nullableStringTimestampToDate(jsonMap['updated']);

  PriceProduct(super.jsonMap);

  factory PriceProduct.fromJson(Map<String, dynamic> jsonMap) =>
      PriceProduct(jsonMap);
}
