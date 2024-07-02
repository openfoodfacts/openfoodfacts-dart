import '../interface/json_object.dart';
import 'currency.dart';
import 'get_parameters_helper.dart';
import 'price_per.dart';

/// Parameters for the "update price" API query.
///
/// cf. https://prices.openfoodfacts.org/api/docs
class UpdatePriceParameters extends JsonObject {
  /// Price of the product, without its currency, taxes included.
  num? price;

  /// True if the price is discounted.
  bool? priceIsDiscounted;

  /// Price of the product, without discount, taxes included.
  num? priceWithoutDiscount;

  /// Price per unit, kilogram, ..?
  PricePer? pricePer;

  /// Currency of the price.
  Currency? currency;

  /// Date when the product was bought.
  DateTime? date;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        if (pricePer != null) 'price_per': pricePer!.offTag,
        if (priceWithoutDiscount != null)
          'price_without_discount': priceWithoutDiscount,
        if (priceIsDiscounted != null) 'price_is_discounted': priceIsDiscounted,
        if (price != null) 'price': price,
        if (currency != null) 'currency': currency!.name,
        if (date != null) 'date': GetParametersHelper.formatDate(date!),
      };
}
