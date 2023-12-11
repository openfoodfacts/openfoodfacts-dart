import 'product.dart';

/// Freshness of a [Product].
class ProductFreshness {
  ProductFreshness._({
    required this.isEcoscoreReady,
    required this.isNutriscoreReady,
    required this.isIngredientsReady,
    required this.lastModified,
    required this.improvements,
  });

  final bool isEcoscoreReady;
  final bool isNutriscoreReady;
  final bool isIngredientsReady;
  final DateTime? lastModified;
  final Set<ProductImprovement> improvements;

  factory ProductFreshness.fromProduct(final Product product) =>
      ProductFreshness._(
        isEcoscoreReady: product.ecoscoreScore != null,
        isNutriscoreReady: product.nutriscore != null,
        isIngredientsReady: product.ingredientsTags != null &&
            product.ingredientsTags!.isNotEmpty,
        lastModified: product.lastModified,
        improvements: product.getProductImprovements(),
      );

  @override
  String toString() => 'ProductFreshness('
      'ecoscore:$isEcoscoreReady'
      ','
      'nutriscore:$isNutriscoreReady'
      ','
      'ingredients:$isIngredientsReady'
      ','
      'lastModified:$lastModified'
      ','
      'improvements:$improvements'
      ')';

  ProductFreshness copyWith({
    bool? isEcoscoreReady,
    bool? isNutriscoreReady,
    bool? isIngredientsReady,
    DateTime? lastModified,
    Set<ProductImprovement>? improvements,
  }) {
    return ProductFreshness._(
      isEcoscoreReady: isEcoscoreReady ?? this.isEcoscoreReady,
      isNutriscoreReady: isNutriscoreReady ?? this.isNutriscoreReady,
      isIngredientsReady: isIngredientsReady ?? this.isIngredientsReady,
      lastModified: lastModified ?? this.lastModified,
      improvements: improvements ?? this.improvements,
    );
  }
}
