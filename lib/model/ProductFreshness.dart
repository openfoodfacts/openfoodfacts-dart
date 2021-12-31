import 'package:openfoodfacts/model/Product.dart';

/// Freshness of a [Product].
class ProductFreshness {
  ProductFreshness._({
    required this.isEcoscoreReady,
    required this.isNutriscoreReady,
    required this.isIngredientsReady,
  });

  final bool isEcoscoreReady;
  final bool isNutriscoreReady;
  final bool isIngredientsReady;

  factory ProductFreshness.fromProduct(final Product product) {
    return ProductFreshness._(
      isEcoscoreReady: product.ecoscoreScore != null,
      isNutriscoreReady: product.nutriscore != null,
      isIngredientsReady: product.ingredientsTags != null &&
          product.ingredientsTags!.isNotEmpty,
    );
  }

  @override
  String toString() => 'ProductFreshness('
      'ecoscore:$isEcoscoreReady'
      ','
      'nutriscore:$isNutriscoreReady'
      ','
      'ingredients:$isIngredientsReady'
      ')';
}
