import '../interface/json_object.dart';
import 'currency.dart';
import 'discount_type.dart';
import 'get_parameters_helper.dart';
import 'price_per.dart';

/// Parameters for the "update price" API query.
///
/// cf. https://prices.openfoodfacts.org/api/docs
class UpdatePriceParameters extends JsonObject {
  /// Barcode (EAN) of the product.
  String? productCode;

  /// ID of the OFF category of the product for products without barcode.
  String? categoryTag;

  /// Labels of the product, only for products without barcode.
  List<String>? labelsTags;

  /// Origins of the product, only for products without barcode.
  List<String>? originsTags;

  /// Price of the product, without its currency, taxes included.
  num? price;

  /// True if the price is discounted.
  bool? priceIsDiscounted;

  /// Price of the product, without discount, taxes included.
  num? priceWithoutDiscount;

  /// Discount Type.
  DiscountType? discountType;

  /// Price per unit, kilogram, ..?
  PricePer? pricePer;

  /// Currency of the price.
  Currency? currency;

  /// Date when the product was bought.
  DateTime? date;

  /// Receipt's price quantity.
  int? receiptQuantity;

  /// Owner comment.
  String? ownerComment;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
    if (productCode != null) 'product_code': productCode,
    if (categoryTag != null) 'category_tag': categoryTag,
    if (labelsTags != null) 'labels_tags': labelsTags,
    if (originsTags != null) 'origins_tags': originsTags,
    if (pricePer != null) 'price_per': pricePer!.offTag,
    if (priceIsDiscounted != null) 'price_is_discounted': priceIsDiscounted,
    if (priceIsDiscounted == false)
      'discount_type': null
    else if (discountType != null)
      'discount_type': discountType!.offTag,
    if (priceIsDiscounted == false)
      'price_without_discount': null
    else if (priceWithoutDiscount != null)
      'price_without_discount': priceWithoutDiscount,
    if (price != null) 'price': price,
    if (currency != null) 'currency': currency!.name,
    if (date != null) 'date': GetParametersHelper.formatDate(date!),
    if (receiptQuantity != null) 'receipt_quantity': receiptQuantity,
    if (ownerComment != null) 'owner_comment': ownerComment,
  };
}
