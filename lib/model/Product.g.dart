// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Product.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProductCWProxy {
  Product additives(Additives? additives);

  Product allergens(Allergens? allergens);

  Product attributeGroups(List<AttributeGroup>? attributeGroups);

  Product barcode(String? barcode);

  Product brands(String? brands);

  Product brandsTags(List<String>? brandsTags);

  Product categories(String? categories);

  Product categoriesTags(List<String>? categoriesTags);

  Product categoriesTagsInLanguages(
      Map<OpenFoodFactsLanguage, List<String>>? categoriesTagsInLanguages);

  Product countries(String? countries);

  Product countriesTags(List<String>? countriesTags);

  Product countriesTagsInLanguages(
      Map<OpenFoodFactsLanguage, List<String>>? countriesTagsInLanguages);

  Product ecoscoreData(EcoscoreData? ecoscoreData);

  Product ecoscoreGrade(String? ecoscoreGrade);

  Product ecoscoreScore(double? ecoscoreScore);

  Product environmentImpactLevels(
      EnvironmentImpactLevels? environmentImpactLevels);

  Product genericName(String? genericName);

  Product imageFrontSmallUrl(String? imageFrontSmallUrl);

  Product imageFrontUrl(String? imageFrontUrl);

  Product imageIngredientsSmallUrl(String? imageIngredientsSmallUrl);

  Product imageIngredientsUrl(String? imageIngredientsUrl);

  Product imageNutritionSmallUrl(String? imageNutritionSmallUrl);

  Product imageNutritionUrl(String? imageNutritionUrl);

  Product imagePackagingSmallUrl(String? imagePackagingSmallUrl);

  Product imagePackagingUrl(String? imagePackagingUrl);

  Product images(List<ProductImage>? images);

  Product ingredients(List<Ingredient>? ingredients);

  Product ingredientsAnalysisTags(
      IngredientsAnalysisTags? ingredientsAnalysisTags);

  Product ingredientsTags(List<String>? ingredientsTags);

  Product ingredientsTagsInLanguages(
      Map<OpenFoodFactsLanguage, List<String>>? ingredientsTagsInLanguages);

  Product ingredientsText(String? ingredientsText);

  Product ingredientsTextInLanguages(
      Map<OpenFoodFactsLanguage, String>? ingredientsTextInLanguages);

  Product labels(String? labels);

  Product labelsTags(List<String>? labelsTags);

  Product labelsTagsInLanguages(
      Map<OpenFoodFactsLanguage, List<String>>? labelsTagsInLanguages);

  Product lang(OpenFoodFactsLanguage? lang);

  Product lastModified(DateTime? lastModified);

  Product miscTags(List<String>? miscTags);

  Product noNutritionData(bool? noNutritionData);

  Product nutrientLevels(NutrientLevels? nutrientLevels);

  Product nutrimentDataPer(String? nutrimentDataPer);

  Product nutrimentEnergyUnit(String? nutrimentEnergyUnit);

  Product nutriments(Nutriments? nutriments);

  Product nutriscore(String? nutriscore);

  Product packaging(String? packaging);

  Product packagingQuantity(double? packagingQuantity);

  Product packagingTags(List<String>? packagingTags);

  Product productName(String? productName);

  Product productNameInLanguages(
      Map<OpenFoodFactsLanguage, String>? productNameInLanguages);

  Product quantity(String? quantity);

  Product selectedImages(List<ProductImage>? selectedImages);

  Product servingQuantity(double? servingQuantity);

  Product servingSize(String? servingSize);

  Product statesTags(List<String>? statesTags);

  Product stores(String? stores);

  Product storesTags(List<String>? storesTags);

  Product tracesTags(List<String>? tracesTags);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Product(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Product(...).copyWith(id: 12, name: "My name")
  /// ````
  Product call({
    Additives? additives,
    Allergens? allergens,
    List<AttributeGroup>? attributeGroups,
    String? barcode,
    String? brands,
    List<String>? brandsTags,
    String? categories,
    List<String>? categoriesTags,
    Map<OpenFoodFactsLanguage, List<String>>? categoriesTagsInLanguages,
    String? countries,
    List<String>? countriesTags,
    Map<OpenFoodFactsLanguage, List<String>>? countriesTagsInLanguages,
    EcoscoreData? ecoscoreData,
    String? ecoscoreGrade,
    double? ecoscoreScore,
    EnvironmentImpactLevels? environmentImpactLevels,
    String? genericName,
    String? imageFrontSmallUrl,
    String? imageFrontUrl,
    String? imageIngredientsSmallUrl,
    String? imageIngredientsUrl,
    String? imageNutritionSmallUrl,
    String? imageNutritionUrl,
    String? imagePackagingSmallUrl,
    String? imagePackagingUrl,
    List<ProductImage>? images,
    List<Ingredient>? ingredients,
    IngredientsAnalysisTags? ingredientsAnalysisTags,
    List<String>? ingredientsTags,
    Map<OpenFoodFactsLanguage, List<String>>? ingredientsTagsInLanguages,
    String? ingredientsText,
    Map<OpenFoodFactsLanguage, String>? ingredientsTextInLanguages,
    String? labels,
    List<String>? labelsTags,
    Map<OpenFoodFactsLanguage, List<String>>? labelsTagsInLanguages,
    OpenFoodFactsLanguage? lang,
    DateTime? lastModified,
    List<String>? miscTags,
    bool? noNutritionData,
    NutrientLevels? nutrientLevels,
    String? nutrimentDataPer,
    String? nutrimentEnergyUnit,
    Nutriments? nutriments,
    String? nutriscore,
    String? packaging,
    double? packagingQuantity,
    List<String>? packagingTags,
    String? productName,
    Map<OpenFoodFactsLanguage, String>? productNameInLanguages,
    String? quantity,
    List<ProductImage>? selectedImages,
    double? servingQuantity,
    String? servingSize,
    List<String>? statesTags,
    String? stores,
    List<String>? storesTags,
    List<String>? tracesTags,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProduct.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProduct.copyWith.fieldName(...)`
class _$ProductCWProxyImpl implements _$ProductCWProxy {
  final Product _value;

  const _$ProductCWProxyImpl(this._value);

  @override
  Product additives(Additives? additives) => this(additives: additives);

  @override
  Product allergens(Allergens? allergens) => this(allergens: allergens);

  @override
  Product attributeGroups(List<AttributeGroup>? attributeGroups) =>
      this(attributeGroups: attributeGroups);

  @override
  Product barcode(String? barcode) => this(barcode: barcode);

  @override
  Product brands(String? brands) => this(brands: brands);

  @override
  Product brandsTags(List<String>? brandsTags) => this(brandsTags: brandsTags);

  @override
  Product categories(String? categories) => this(categories: categories);

  @override
  Product categoriesTags(List<String>? categoriesTags) =>
      this(categoriesTags: categoriesTags);

  @override
  Product categoriesTagsInLanguages(
          Map<OpenFoodFactsLanguage, List<String>>?
              categoriesTagsInLanguages) =>
      this(categoriesTagsInLanguages: categoriesTagsInLanguages);

  @override
  Product countries(String? countries) => this(countries: countries);

  @override
  Product countriesTags(List<String>? countriesTags) =>
      this(countriesTags: countriesTags);

  @override
  Product countriesTagsInLanguages(
          Map<OpenFoodFactsLanguage, List<String>>? countriesTagsInLanguages) =>
      this(countriesTagsInLanguages: countriesTagsInLanguages);

  @override
  Product ecoscoreData(EcoscoreData? ecoscoreData) =>
      this(ecoscoreData: ecoscoreData);

  @override
  Product ecoscoreGrade(String? ecoscoreGrade) =>
      this(ecoscoreGrade: ecoscoreGrade);

  @override
  Product ecoscoreScore(double? ecoscoreScore) =>
      this(ecoscoreScore: ecoscoreScore);

  @override
  Product environmentImpactLevels(
          EnvironmentImpactLevels? environmentImpactLevels) =>
      this(environmentImpactLevels: environmentImpactLevels);

  @override
  Product genericName(String? genericName) => this(genericName: genericName);

  @override
  Product imageFrontSmallUrl(String? imageFrontSmallUrl) =>
      this(imageFrontSmallUrl: imageFrontSmallUrl);

  @override
  Product imageFrontUrl(String? imageFrontUrl) =>
      this(imageFrontUrl: imageFrontUrl);

  @override
  Product imageIngredientsSmallUrl(String? imageIngredientsSmallUrl) =>
      this(imageIngredientsSmallUrl: imageIngredientsSmallUrl);

  @override
  Product imageIngredientsUrl(String? imageIngredientsUrl) =>
      this(imageIngredientsUrl: imageIngredientsUrl);

  @override
  Product imageNutritionSmallUrl(String? imageNutritionSmallUrl) =>
      this(imageNutritionSmallUrl: imageNutritionSmallUrl);

  @override
  Product imageNutritionUrl(String? imageNutritionUrl) =>
      this(imageNutritionUrl: imageNutritionUrl);

  @override
  Product imagePackagingSmallUrl(String? imagePackagingSmallUrl) =>
      this(imagePackagingSmallUrl: imagePackagingSmallUrl);

  @override
  Product imagePackagingUrl(String? imagePackagingUrl) =>
      this(imagePackagingUrl: imagePackagingUrl);

  @override
  Product images(List<ProductImage>? images) => this(images: images);

  @override
  Product ingredients(List<Ingredient>? ingredients) =>
      this(ingredients: ingredients);

  @override
  Product ingredientsAnalysisTags(
          IngredientsAnalysisTags? ingredientsAnalysisTags) =>
      this(ingredientsAnalysisTags: ingredientsAnalysisTags);

  @override
  Product ingredientsTags(List<String>? ingredientsTags) =>
      this(ingredientsTags: ingredientsTags);

  @override
  Product ingredientsTagsInLanguages(
          Map<OpenFoodFactsLanguage, List<String>>?
              ingredientsTagsInLanguages) =>
      this(ingredientsTagsInLanguages: ingredientsTagsInLanguages);

  @override
  Product ingredientsText(String? ingredientsText) =>
      this(ingredientsText: ingredientsText);

  @override
  Product ingredientsTextInLanguages(
          Map<OpenFoodFactsLanguage, String>? ingredientsTextInLanguages) =>
      this(ingredientsTextInLanguages: ingredientsTextInLanguages);

  @override
  Product labels(String? labels) => this(labels: labels);

  @override
  Product labelsTags(List<String>? labelsTags) => this(labelsTags: labelsTags);

  @override
  Product labelsTagsInLanguages(
          Map<OpenFoodFactsLanguage, List<String>>? labelsTagsInLanguages) =>
      this(labelsTagsInLanguages: labelsTagsInLanguages);

  @override
  Product lang(OpenFoodFactsLanguage? lang) => this(lang: lang);

  @override
  Product lastModified(DateTime? lastModified) =>
      this(lastModified: lastModified);

  @override
  Product miscTags(List<String>? miscTags) => this(miscTags: miscTags);

  @override
  Product noNutritionData(bool? noNutritionData) =>
      this(noNutritionData: noNutritionData);

  @override
  Product nutrientLevels(NutrientLevels? nutrientLevels) =>
      this(nutrientLevels: nutrientLevels);

  @override
  Product nutrimentDataPer(String? nutrimentDataPer) =>
      this(nutrimentDataPer: nutrimentDataPer);

  @override
  Product nutrimentEnergyUnit(String? nutrimentEnergyUnit) =>
      this(nutrimentEnergyUnit: nutrimentEnergyUnit);

  @override
  Product nutriments(Nutriments? nutriments) => this(nutriments: nutriments);

  @override
  Product nutriscore(String? nutriscore) => this(nutriscore: nutriscore);

  @override
  Product packaging(String? packaging) => this(packaging: packaging);

  @override
  Product packagingQuantity(double? packagingQuantity) =>
      this(packagingQuantity: packagingQuantity);

  @override
  Product packagingTags(List<String>? packagingTags) =>
      this(packagingTags: packagingTags);

  @override
  Product productName(String? productName) => this(productName: productName);

  @override
  Product productNameInLanguages(
          Map<OpenFoodFactsLanguage, String>? productNameInLanguages) =>
      this(productNameInLanguages: productNameInLanguages);

  @override
  Product quantity(String? quantity) => this(quantity: quantity);

  @override
  Product selectedImages(List<ProductImage>? selectedImages) =>
      this(selectedImages: selectedImages);

  @override
  Product servingQuantity(double? servingQuantity) =>
      this(servingQuantity: servingQuantity);

  @override
  Product servingSize(String? servingSize) => this(servingSize: servingSize);

  @override
  Product statesTags(List<String>? statesTags) => this(statesTags: statesTags);

  @override
  Product stores(String? stores) => this(stores: stores);

  @override
  Product storesTags(List<String>? storesTags) => this(storesTags: storesTags);

  @override
  Product tracesTags(List<String>? tracesTags) => this(tracesTags: tracesTags);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Product(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Product(...).copyWith(id: 12, name: "My name")
  /// ````
  Product call({
    Object? additives = const $CopyWithPlaceholder(),
    Object? allergens = const $CopyWithPlaceholder(),
    Object? attributeGroups = const $CopyWithPlaceholder(),
    Object? barcode = const $CopyWithPlaceholder(),
    Object? brands = const $CopyWithPlaceholder(),
    Object? brandsTags = const $CopyWithPlaceholder(),
    Object? categories = const $CopyWithPlaceholder(),
    Object? categoriesTags = const $CopyWithPlaceholder(),
    Object? categoriesTagsInLanguages = const $CopyWithPlaceholder(),
    Object? countries = const $CopyWithPlaceholder(),
    Object? countriesTags = const $CopyWithPlaceholder(),
    Object? countriesTagsInLanguages = const $CopyWithPlaceholder(),
    Object? ecoscoreData = const $CopyWithPlaceholder(),
    Object? ecoscoreGrade = const $CopyWithPlaceholder(),
    Object? ecoscoreScore = const $CopyWithPlaceholder(),
    Object? environmentImpactLevels = const $CopyWithPlaceholder(),
    Object? genericName = const $CopyWithPlaceholder(),
    Object? imageFrontSmallUrl = const $CopyWithPlaceholder(),
    Object? imageFrontUrl = const $CopyWithPlaceholder(),
    Object? imageIngredientsSmallUrl = const $CopyWithPlaceholder(),
    Object? imageIngredientsUrl = const $CopyWithPlaceholder(),
    Object? imageNutritionSmallUrl = const $CopyWithPlaceholder(),
    Object? imageNutritionUrl = const $CopyWithPlaceholder(),
    Object? imagePackagingSmallUrl = const $CopyWithPlaceholder(),
    Object? imagePackagingUrl = const $CopyWithPlaceholder(),
    Object? images = const $CopyWithPlaceholder(),
    Object? ingredients = const $CopyWithPlaceholder(),
    Object? ingredientsAnalysisTags = const $CopyWithPlaceholder(),
    Object? ingredientsTags = const $CopyWithPlaceholder(),
    Object? ingredientsTagsInLanguages = const $CopyWithPlaceholder(),
    Object? ingredientsText = const $CopyWithPlaceholder(),
    Object? ingredientsTextInLanguages = const $CopyWithPlaceholder(),
    Object? labels = const $CopyWithPlaceholder(),
    Object? labelsTags = const $CopyWithPlaceholder(),
    Object? labelsTagsInLanguages = const $CopyWithPlaceholder(),
    Object? lang = const $CopyWithPlaceholder(),
    Object? lastModified = const $CopyWithPlaceholder(),
    Object? miscTags = const $CopyWithPlaceholder(),
    Object? noNutritionData = const $CopyWithPlaceholder(),
    Object? nutrientLevels = const $CopyWithPlaceholder(),
    Object? nutrimentDataPer = const $CopyWithPlaceholder(),
    Object? nutrimentEnergyUnit = const $CopyWithPlaceholder(),
    Object? nutriments = const $CopyWithPlaceholder(),
    Object? nutriscore = const $CopyWithPlaceholder(),
    Object? packaging = const $CopyWithPlaceholder(),
    Object? packagingQuantity = const $CopyWithPlaceholder(),
    Object? packagingTags = const $CopyWithPlaceholder(),
    Object? productName = const $CopyWithPlaceholder(),
    Object? productNameInLanguages = const $CopyWithPlaceholder(),
    Object? quantity = const $CopyWithPlaceholder(),
    Object? selectedImages = const $CopyWithPlaceholder(),
    Object? servingQuantity = const $CopyWithPlaceholder(),
    Object? servingSize = const $CopyWithPlaceholder(),
    Object? statesTags = const $CopyWithPlaceholder(),
    Object? stores = const $CopyWithPlaceholder(),
    Object? storesTags = const $CopyWithPlaceholder(),
    Object? tracesTags = const $CopyWithPlaceholder(),
  }) {
    return Product(
      additives: additives == const $CopyWithPlaceholder()
          ? _value.additives
          // ignore: cast_nullable_to_non_nullable
          : additives as Additives?,
      allergens: allergens == const $CopyWithPlaceholder()
          ? _value.allergens
          // ignore: cast_nullable_to_non_nullable
          : allergens as Allergens?,
      attributeGroups: attributeGroups == const $CopyWithPlaceholder()
          ? _value.attributeGroups
          // ignore: cast_nullable_to_non_nullable
          : attributeGroups as List<AttributeGroup>?,
      barcode: barcode == const $CopyWithPlaceholder()
          ? _value.barcode
          // ignore: cast_nullable_to_non_nullable
          : barcode as String?,
      brands: brands == const $CopyWithPlaceholder()
          ? _value.brands
          // ignore: cast_nullable_to_non_nullable
          : brands as String?,
      brandsTags: brandsTags == const $CopyWithPlaceholder()
          ? _value.brandsTags
          // ignore: cast_nullable_to_non_nullable
          : brandsTags as List<String>?,
      categories: categories == const $CopyWithPlaceholder()
          ? _value.categories
          // ignore: cast_nullable_to_non_nullable
          : categories as String?,
      categoriesTags: categoriesTags == const $CopyWithPlaceholder()
          ? _value.categoriesTags
          // ignore: cast_nullable_to_non_nullable
          : categoriesTags as List<String>?,
      categoriesTagsInLanguages:
          categoriesTagsInLanguages == const $CopyWithPlaceholder()
              ? _value.categoriesTagsInLanguages
              // ignore: cast_nullable_to_non_nullable
              : categoriesTagsInLanguages
                  as Map<OpenFoodFactsLanguage, List<String>>?,
      countries: countries == const $CopyWithPlaceholder()
          ? _value.countries
          // ignore: cast_nullable_to_non_nullable
          : countries as String?,
      countriesTags: countriesTags == const $CopyWithPlaceholder()
          ? _value.countriesTags
          // ignore: cast_nullable_to_non_nullable
          : countriesTags as List<String>?,
      countriesTagsInLanguages:
          countriesTagsInLanguages == const $CopyWithPlaceholder()
              ? _value.countriesTagsInLanguages
              // ignore: cast_nullable_to_non_nullable
              : countriesTagsInLanguages
                  as Map<OpenFoodFactsLanguage, List<String>>?,
      ecoscoreData: ecoscoreData == const $CopyWithPlaceholder()
          ? _value.ecoscoreData
          // ignore: cast_nullable_to_non_nullable
          : ecoscoreData as EcoscoreData?,
      ecoscoreGrade: ecoscoreGrade == const $CopyWithPlaceholder()
          ? _value.ecoscoreGrade
          // ignore: cast_nullable_to_non_nullable
          : ecoscoreGrade as String?,
      ecoscoreScore: ecoscoreScore == const $CopyWithPlaceholder()
          ? _value.ecoscoreScore
          // ignore: cast_nullable_to_non_nullable
          : ecoscoreScore as double?,
      environmentImpactLevels:
          environmentImpactLevels == const $CopyWithPlaceholder()
              ? _value.environmentImpactLevels
              // ignore: cast_nullable_to_non_nullable
              : environmentImpactLevels as EnvironmentImpactLevels?,
      genericName: genericName == const $CopyWithPlaceholder()
          ? _value.genericName
          // ignore: cast_nullable_to_non_nullable
          : genericName as String?,
      imageFrontSmallUrl: imageFrontSmallUrl == const $CopyWithPlaceholder()
          ? _value.imageFrontSmallUrl
          // ignore: cast_nullable_to_non_nullable
          : imageFrontSmallUrl as String?,
      imageFrontUrl: imageFrontUrl == const $CopyWithPlaceholder()
          ? _value.imageFrontUrl
          // ignore: cast_nullable_to_non_nullable
          : imageFrontUrl as String?,
      imageIngredientsSmallUrl:
          imageIngredientsSmallUrl == const $CopyWithPlaceholder()
              ? _value.imageIngredientsSmallUrl
              // ignore: cast_nullable_to_non_nullable
              : imageIngredientsSmallUrl as String?,
      imageIngredientsUrl: imageIngredientsUrl == const $CopyWithPlaceholder()
          ? _value.imageIngredientsUrl
          // ignore: cast_nullable_to_non_nullable
          : imageIngredientsUrl as String?,
      imageNutritionSmallUrl:
          imageNutritionSmallUrl == const $CopyWithPlaceholder()
              ? _value.imageNutritionSmallUrl
              // ignore: cast_nullable_to_non_nullable
              : imageNutritionSmallUrl as String?,
      imageNutritionUrl: imageNutritionUrl == const $CopyWithPlaceholder()
          ? _value.imageNutritionUrl
          // ignore: cast_nullable_to_non_nullable
          : imageNutritionUrl as String?,
      imagePackagingSmallUrl:
          imagePackagingSmallUrl == const $CopyWithPlaceholder()
              ? _value.imagePackagingSmallUrl
              // ignore: cast_nullable_to_non_nullable
              : imagePackagingSmallUrl as String?,
      imagePackagingUrl: imagePackagingUrl == const $CopyWithPlaceholder()
          ? _value.imagePackagingUrl
          // ignore: cast_nullable_to_non_nullable
          : imagePackagingUrl as String?,
      images: images == const $CopyWithPlaceholder()
          ? _value.images
          // ignore: cast_nullable_to_non_nullable
          : images as List<ProductImage>?,
      ingredients: ingredients == const $CopyWithPlaceholder()
          ? _value.ingredients
          // ignore: cast_nullable_to_non_nullable
          : ingredients as List<Ingredient>?,
      ingredientsAnalysisTags:
          ingredientsAnalysisTags == const $CopyWithPlaceholder()
              ? _value.ingredientsAnalysisTags
              // ignore: cast_nullable_to_non_nullable
              : ingredientsAnalysisTags as IngredientsAnalysisTags?,
      ingredientsTags: ingredientsTags == const $CopyWithPlaceholder()
          ? _value.ingredientsTags
          // ignore: cast_nullable_to_non_nullable
          : ingredientsTags as List<String>?,
      ingredientsTagsInLanguages:
          ingredientsTagsInLanguages == const $CopyWithPlaceholder()
              ? _value.ingredientsTagsInLanguages
              // ignore: cast_nullable_to_non_nullable
              : ingredientsTagsInLanguages
                  as Map<OpenFoodFactsLanguage, List<String>>?,
      ingredientsText: ingredientsText == const $CopyWithPlaceholder()
          ? _value.ingredientsText
          // ignore: cast_nullable_to_non_nullable
          : ingredientsText as String?,
      ingredientsTextInLanguages: ingredientsTextInLanguages ==
              const $CopyWithPlaceholder()
          ? _value.ingredientsTextInLanguages
          // ignore: cast_nullable_to_non_nullable
          : ingredientsTextInLanguages as Map<OpenFoodFactsLanguage, String>?,
      labels: labels == const $CopyWithPlaceholder()
          ? _value.labels
          // ignore: cast_nullable_to_non_nullable
          : labels as String?,
      labelsTags: labelsTags == const $CopyWithPlaceholder()
          ? _value.labelsTags
          // ignore: cast_nullable_to_non_nullable
          : labelsTags as List<String>?,
      labelsTagsInLanguages: labelsTagsInLanguages ==
              const $CopyWithPlaceholder()
          ? _value.labelsTagsInLanguages
          // ignore: cast_nullable_to_non_nullable
          : labelsTagsInLanguages as Map<OpenFoodFactsLanguage, List<String>>?,
      lang: lang == const $CopyWithPlaceholder()
          ? _value.lang
          // ignore: cast_nullable_to_non_nullable
          : lang as OpenFoodFactsLanguage?,
      lastModified: lastModified == const $CopyWithPlaceholder()
          ? _value.lastModified
          // ignore: cast_nullable_to_non_nullable
          : lastModified as DateTime?,
      miscTags: miscTags == const $CopyWithPlaceholder()
          ? _value.miscTags
          // ignore: cast_nullable_to_non_nullable
          : miscTags as List<String>?,
      noNutritionData: noNutritionData == const $CopyWithPlaceholder()
          ? _value.noNutritionData
          // ignore: cast_nullable_to_non_nullable
          : noNutritionData as bool?,
      nutrientLevels: nutrientLevels == const $CopyWithPlaceholder()
          ? _value.nutrientLevels
          // ignore: cast_nullable_to_non_nullable
          : nutrientLevels as NutrientLevels?,
      nutrimentDataPer: nutrimentDataPer == const $CopyWithPlaceholder()
          ? _value.nutrimentDataPer
          // ignore: cast_nullable_to_non_nullable
          : nutrimentDataPer as String?,
      nutrimentEnergyUnit: nutrimentEnergyUnit == const $CopyWithPlaceholder()
          ? _value.nutrimentEnergyUnit
          // ignore: cast_nullable_to_non_nullable
          : nutrimentEnergyUnit as String?,
      nutriments: nutriments == const $CopyWithPlaceholder()
          ? _value.nutriments
          // ignore: cast_nullable_to_non_nullable
          : nutriments as Nutriments?,
      nutriscore: nutriscore == const $CopyWithPlaceholder()
          ? _value.nutriscore
          // ignore: cast_nullable_to_non_nullable
          : nutriscore as String?,
      packaging: packaging == const $CopyWithPlaceholder()
          ? _value.packaging
          // ignore: cast_nullable_to_non_nullable
          : packaging as String?,
      packagingQuantity: packagingQuantity == const $CopyWithPlaceholder()
          ? _value.packagingQuantity
          // ignore: cast_nullable_to_non_nullable
          : packagingQuantity as double?,
      packagingTags: packagingTags == const $CopyWithPlaceholder()
          ? _value.packagingTags
          // ignore: cast_nullable_to_non_nullable
          : packagingTags as List<String>?,
      productName: productName == const $CopyWithPlaceholder()
          ? _value.productName
          // ignore: cast_nullable_to_non_nullable
          : productName as String?,
      productNameInLanguages:
          productNameInLanguages == const $CopyWithPlaceholder()
              ? _value.productNameInLanguages
              // ignore: cast_nullable_to_non_nullable
              : productNameInLanguages as Map<OpenFoodFactsLanguage, String>?,
      quantity: quantity == const $CopyWithPlaceholder()
          ? _value.quantity
          // ignore: cast_nullable_to_non_nullable
          : quantity as String?,
      selectedImages: selectedImages == const $CopyWithPlaceholder()
          ? _value.selectedImages
          // ignore: cast_nullable_to_non_nullable
          : selectedImages as List<ProductImage>?,
      servingQuantity: servingQuantity == const $CopyWithPlaceholder()
          ? _value.servingQuantity
          // ignore: cast_nullable_to_non_nullable
          : servingQuantity as double?,
      servingSize: servingSize == const $CopyWithPlaceholder()
          ? _value.servingSize
          // ignore: cast_nullable_to_non_nullable
          : servingSize as String?,
      statesTags: statesTags == const $CopyWithPlaceholder()
          ? _value.statesTags
          // ignore: cast_nullable_to_non_nullable
          : statesTags as List<String>?,
      stores: stores == const $CopyWithPlaceholder()
          ? _value.stores
          // ignore: cast_nullable_to_non_nullable
          : stores as String?,
      storesTags: storesTags == const $CopyWithPlaceholder()
          ? _value.storesTags
          // ignore: cast_nullable_to_non_nullable
          : storesTags as List<String>?,
      tracesTags: tracesTags == const $CopyWithPlaceholder()
          ? _value.tracesTags
          // ignore: cast_nullable_to_non_nullable
          : tracesTags as List<String>?,
    );
  }
}

extension $ProductCopyWith on Product {
  /// Returns a callable class that can be used as follows: `instanceOfProduct.copyWith(...)` or like so:`instanceOfProduct.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductCWProxy get copyWith => _$ProductCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      barcode: json['code'] as String?,
      productName: json['product_name'] as String?,
      productNameInLanguages:
          LanguageHelper.fromJsonStringMap(json['product_name_in_languages']),
      genericName: json['generic_name'] as String?,
      brands: json['brands'] as String?,
      brandsTags: (json['brands_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      countries: json['countries'] as String?,
      countriesTags: (json['countries_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      countriesTagsInLanguages: LanguageHelper.fromJsonStringsListMap(
          json['countries_tags_in_languages']),
      lang: LanguageHelper.fromJson(json['lang'] as String?),
      quantity: json['quantity'] as String?,
      imageFrontUrl: json['image_front_url'] as String?,
      imageFrontSmallUrl: json['image_front_small_url'] as String?,
      imageIngredientsUrl: json['image_ingredients_url'] as String?,
      imageIngredientsSmallUrl: json['image_ingredients_small_url'] as String?,
      imageNutritionUrl: json['image_nutrition_url'] as String?,
      imageNutritionSmallUrl: json['image_nutrition_small_url'] as String?,
      imagePackagingUrl: json['image_packaging_url'] as String?,
      imagePackagingSmallUrl: json['image_packaging_small_url'] as String?,
      servingSize: json['serving_size'] as String?,
      servingQuantity: JsonHelper.quantityFromJson(json['serving_quantity']),
      packagingQuantity: JsonHelper.quantityFromJson(json['product_quantity']),
      selectedImages:
          JsonHelper.selectedImagesFromJson(json['selected_images'] as Map?),
      images: JsonHelper.imagesFromJson(json['images'] as Map?),
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      ingredientsText: json['ingredients_text'] as String?,
      ingredientsTextInLanguages: LanguageHelper.fromJsonStringMap(
          json['ingredients_text_in_languages']),
      ingredientsTags: (json['ingredients_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      ingredientsTagsInLanguages: LanguageHelper.fromJsonStringsListMap(
          json['ingredients_tags_in_languages']),
      ingredientsAnalysisTags: IngredientsAnalysisTags.fromJson(
          json['ingredients_analysis_tags'] as List?),
      additives: Additives.additivesFromJson(json['additives_tags'] as List?),
      environmentImpactLevels: EnvironmentImpactLevels.fromJson(
          json['environment_impact_level_tags'] as List?),
      allergens: Allergens.allergensFromJson(json['allergens_tags'] as List?),
      nutrientLevels: NutrientLevels.fromJson(json['nutrient_levels'] as Map?),
      nutrimentEnergyUnit: json['nutriment_energy_unit'] as String?,
      nutrimentDataPer: json['nutrition_data_per'] as String?,
      nutriscore: json['nutrition_grade_fr'] as String?,
      categories: json['categories'] as String?,
      categoriesTags: (json['categories_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      categoriesTagsInLanguages: LanguageHelper.fromJsonStringsListMap(
          json['categories_tags_in_languages']),
      labels: json['labels'] as String?,
      labelsTags: (json['labels_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      labelsTagsInLanguages: LanguageHelper.fromJsonStringsListMap(
          json['labels_tags_in_languages']),
      packaging: json['packaging'] as String?,
      packagingTags: (json['packaging_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      miscTags:
          (json['misc'] as List<dynamic>?)?.map((e) => e as String).toList(),
      statesTags: (json['states_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tracesTags: (json['traces_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      storesTags: (json['stores_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      stores: json['stores'] as String?,
      attributeGroups: (json['attribute_groups'] as List<dynamic>?)
          ?.map((e) => AttributeGroup.fromJson(e))
          .toList(),
      lastModified: JsonHelper.timestampToDate(json['last_modified_t']),
      ecoscoreGrade: json['ecoscore_grade'] as String?,
      ecoscoreScore: JsonObject.parseDouble(json['ecoscore_score']),
      ecoscoreData: json['ecoscore_data'] == null
          ? null
          : EcoscoreData.fromJson(
              json['ecoscore_data'] as Map<String, dynamic>),
      nutriments: json['nutriments'] == null
          ? null
          : Nutriments.fromJson(json['nutriments'] as Map<String, dynamic>),
      noNutritionData: JsonHelper.checkboxFromJSON(json['no_nutrition_data']),
    )
      ..imagesFreshnessInLanguages =
          (json['imagesFreshnessInLanguages'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            $enumDecode(_$OpenFoodFactsLanguageEnumMap, k),
            (e as Map<String, dynamic>).map(
              (k, e) => MapEntry($enumDecode(_$ImageFieldEnumMap, k), e as int),
            )),
      )
      ..nutritionData = JsonHelper.checkboxFromJSON(json['nutrition_data'])
      ..comparedToCategory = json['compared_to_category'] as String?
      ..packagingTextInLanguages =
          LanguageHelper.fromJsonStringMap(json['packaging_text_in_languages'])
      ..knowledgePanels =
          KnowledgePanels.fromJsonHelper(json['knowledge_panels'] as Map?)
      ..environmentInfoCard = json['environment_infocard'] as String?
      ..embCodes = json['emb_codes'] as String?
      ..manufacturingPlaces = json['manufacturing_places'] as String?
      ..origins = json['origins'] as String?
      ..novaGroup = json['nova_group'] as int?
      ..website = json['link'] as String?;

Map<String, dynamic> _$ProductToJson(Product instance) {
  final val = <String, dynamic>{
    'code': instance.barcode,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('product_name', instance.productName);
  writeNotNull('product_name_in_languages',
      LanguageHelper.toJsonStringMap(instance.productNameInLanguages));
  writeNotNull('generic_name', instance.genericName);
  writeNotNull('brands', instance.brands);
  writeNotNull('brands_tags', instance.brandsTags);
  writeNotNull('countries', instance.countries);
  writeNotNull('countries_tags', instance.countriesTags);
  writeNotNull('countries_tags_in_languages',
      LanguageHelper.toJsonStringsListMap(instance.countriesTagsInLanguages));
  val['lang'] = LanguageHelper.toJson(instance.lang);
  writeNotNull('quantity', instance.quantity);
  writeNotNull('image_front_url', instance.imageFrontUrl);
  writeNotNull('image_front_small_url', instance.imageFrontSmallUrl);
  writeNotNull('image_ingredients_url', instance.imageIngredientsUrl);
  writeNotNull(
      'image_ingredients_small_url', instance.imageIngredientsSmallUrl);
  writeNotNull('image_nutrition_url', instance.imageNutritionUrl);
  writeNotNull('image_nutrition_small_url', instance.imageNutritionSmallUrl);
  writeNotNull('image_packaging_url', instance.imagePackagingUrl);
  writeNotNull('image_packaging_small_url', instance.imagePackagingSmallUrl);
  writeNotNull('serving_size', instance.servingSize);
  writeNotNull('serving_quantity', instance.servingQuantity);
  writeNotNull('product_quantity', instance.packagingQuantity);
  val['selected_images'] =
      JsonHelper.selectedImagesToJson(instance.selectedImages);
  val['images'] = JsonHelper.imagesToJson(instance.images);
  writeNotNull(
      'ingredients', JsonHelper.ingredientsToJson(instance.ingredients));
  writeNotNull('ingredients_text', instance.ingredientsText);
  writeNotNull('ingredients_text_in_languages',
      LanguageHelper.toJsonStringMap(instance.ingredientsTextInLanguages));
  writeNotNull('ingredients_tags', instance.ingredientsTags);
  writeNotNull('ingredients_tags_in_languages',
      LanguageHelper.toJsonStringsListMap(instance.ingredientsTagsInLanguages));
  val['imagesFreshnessInLanguages'] = instance.imagesFreshnessInLanguages?.map(
      (k, e) => MapEntry(_$OpenFoodFactsLanguageEnumMap[k]!,
          e.map((k, e) => MapEntry(_$ImageFieldEnumMap[k]!, e))));
  val['ingredients_analysis_tags'] =
      IngredientsAnalysisTags.toJson(instance.ingredientsAnalysisTags);
  writeNotNull('additives_tags', Additives.additivesToJson(instance.additives));
  writeNotNull('environment_impact_level_tags',
      EnvironmentImpactLevels.toJson(instance.environmentImpactLevels));
  writeNotNull('allergens_tags', Allergens.allergensToJson(instance.allergens));
  writeNotNull(
      'nutrient_levels', NutrientLevels.toJson(instance.nutrientLevels));
  writeNotNull('nutriment_energy_unit', instance.nutrimentEnergyUnit);
  val['nutrition_data'] = JsonHelper.checkboxToJSON(instance.nutritionData);
  writeNotNull('nutrition_data_per', instance.nutrimentDataPer);
  writeNotNull('nutrition_grade_fr', instance.nutriscore);
  writeNotNull('compared_to_category', instance.comparedToCategory);
  writeNotNull('categories', instance.categories);
  writeNotNull('categories_tags', instance.categoriesTags);
  writeNotNull('categories_tags_in_languages',
      LanguageHelper.toJsonStringsListMap(instance.categoriesTagsInLanguages));
  writeNotNull('labels', instance.labels);
  writeNotNull('labels_tags', instance.labelsTags);
  writeNotNull('labels_tags_in_languages',
      LanguageHelper.toJsonStringsListMap(instance.labelsTagsInLanguages));
  writeNotNull('packaging', instance.packaging);
  writeNotNull('packaging_tags', instance.packagingTags);
  writeNotNull('packaging_text_in_languages',
      LanguageHelper.toJsonStringMap(instance.packagingTextInLanguages));
  writeNotNull('misc', instance.miscTags);
  writeNotNull('states_tags', instance.statesTags);
  writeNotNull('traces_tags', instance.tracesTags);
  writeNotNull('stores_tags', instance.storesTags);
  writeNotNull('stores', instance.stores);
  writeNotNull('attribute_groups',
      JsonHelper.attributeGroupsToJson(instance.attributeGroups));
  writeNotNull(
      'last_modified_t', JsonHelper.dateToTimestamp(instance.lastModified));
  writeNotNull('ecoscore_grade', instance.ecoscoreGrade);
  writeNotNull('ecoscore_score', instance.ecoscoreScore);
  writeNotNull(
      'ecoscore_data', EcoscoreData.toJsonHelper(instance.ecoscoreData));
  writeNotNull('knowledge_panels',
      KnowledgePanels.toJsonHelper(instance.knowledgePanels));
  writeNotNull('environment_infocard', instance.environmentInfoCard);
  writeNotNull('emb_codes', instance.embCodes);
  writeNotNull('manufacturing_places', instance.manufacturingPlaces);
  writeNotNull('origins', instance.origins);
  writeNotNull('nova_group', instance.novaGroup);
  writeNotNull('link', instance.website);
  val['no_nutrition_data'] =
      JsonHelper.checkboxToJSON(instance.noNutritionData);
  val['nutriments'] = Nutriments.toJsonHelper(instance.nutriments);
  return val;
}

const _$ImageFieldEnumMap = {
  ImageField.FRONT: 'FRONT',
  ImageField.INGREDIENTS: 'INGREDIENTS',
  ImageField.NUTRITION: 'NUTRITION',
  ImageField.PACKAGING: 'PACKAGING',
  ImageField.OTHER: 'OTHER',
};

const _$OpenFoodFactsLanguageEnumMap = {
  OpenFoodFactsLanguage.ENGLISH: 'ENGLISH',
  OpenFoodFactsLanguage.OLD_CHURCH_SLAVONIC: 'OLD_CHURCH_SLAVONIC',
  OpenFoodFactsLanguage.DZONGKHA_LANGUAGE: 'DZONGKHA_LANGUAGE',
  OpenFoodFactsLanguage.JAPANESE: 'JAPANESE',
  OpenFoodFactsLanguage.MALAY: 'MALAY',
  OpenFoodFactsLanguage.TAGALOG: 'TAGALOG',
  OpenFoodFactsLanguage.MOLDOVAN: 'MOLDOVAN',
  OpenFoodFactsLanguage.MONGOLIAN: 'MONGOLIAN',
  OpenFoodFactsLanguage.KOREAN: 'KOREAN',
  OpenFoodFactsLanguage.LUBA_KATANGA_LANGUAGE: 'LUBA_KATANGA_LANGUAGE',
  OpenFoodFactsLanguage.KAZAKH: 'KAZAKH',
  OpenFoodFactsLanguage.QUECHUA_LANGUAGES: 'QUECHUA_LANGUAGES',
  OpenFoodFactsLanguage.UKRAINIAN: 'UKRAINIAN',
  OpenFoodFactsLanguage.OCCITAN: 'OCCITAN',
  OpenFoodFactsLanguage.BIHARI_LANGUAGES: 'BIHARI_LANGUAGES',
  OpenFoodFactsLanguage.SOUTHERN_NDEBELE: 'SOUTHERN_NDEBELE',
  OpenFoodFactsLanguage.BOKMAL: 'BOKMAL',
  OpenFoodFactsLanguage.KOMI: 'KOMI',
  OpenFoodFactsLanguage.MODERN_GREEK: 'MODERN_GREEK',
  OpenFoodFactsLanguage.FIJIAN_LANGUAGE: 'FIJIAN_LANGUAGE',
  OpenFoodFactsLanguage.ZULU: 'ZULU',
  OpenFoodFactsLanguage.IDO: 'IDO',
  OpenFoodFactsLanguage.KHMER: 'KHMER',
  OpenFoodFactsLanguage.SANSKRIT: 'SANSKRIT',
  OpenFoodFactsLanguage.MACEDONIAN: 'MACEDONIAN',
  OpenFoodFactsLanguage.SOTHO: 'SOTHO',
  OpenFoodFactsLanguage.SCOTTISH_GAELIC: 'SCOTTISH_GAELIC',
  OpenFoodFactsLanguage.MARATHI: 'MARATHI',
  OpenFoodFactsLanguage.NAURUAN: 'NAURUAN',
  OpenFoodFactsLanguage.OROMO: 'OROMO',
  OpenFoodFactsLanguage.WELSH: 'WELSH',
  OpenFoodFactsLanguage.VIETNAMESE: 'VIETNAMESE',
  OpenFoodFactsLanguage.BISLAMA: 'BISLAMA',
  OpenFoodFactsLanguage.SOMALI: 'SOMALI',
  OpenFoodFactsLanguage.LITHUANIAN: 'LITHUANIAN',
  OpenFoodFactsLanguage.HAITIAN_CREOLE: 'HAITIAN_CREOLE',
  OpenFoodFactsLanguage.MALAGASY: 'MALAGASY',
  OpenFoodFactsLanguage.SPANISH: 'SPANISH',
  OpenFoodFactsLanguage.DANISH: 'DANISH',
  OpenFoodFactsLanguage.SLOVENE: 'SLOVENE',
  OpenFoodFactsLanguage.ICELANDIC: 'ICELANDIC',
  OpenFoodFactsLanguage.ESTONIAN: 'ESTONIAN',
  OpenFoodFactsLanguage.WOLOF: 'WOLOF',
  OpenFoodFactsLanguage.HIRI_MOTU: 'HIRI_MOTU',
  OpenFoodFactsLanguage.TAMIL: 'TAMIL',
  OpenFoodFactsLanguage.SLOVAK: 'SLOVAK',
  OpenFoodFactsLanguage.HERERO: 'HERERO',
  OpenFoodFactsLanguage.ITALIAN: 'ITALIAN',
  OpenFoodFactsLanguage.IRISH: 'IRISH',
  OpenFoodFactsLanguage.SHONA: 'SHONA',
  OpenFoodFactsLanguage.MARSHALLESE: 'MARSHALLESE',
  OpenFoodFactsLanguage.FRENCH: 'FRENCH',
  OpenFoodFactsLanguage.AYMARA: 'AYMARA',
  OpenFoodFactsLanguage.HEBREW: 'HEBREW',
  OpenFoodFactsLanguage.NORTHERN_SAMI: 'NORTHERN_SAMI',
  OpenFoodFactsLanguage.BENGALI: 'BENGALI',
  OpenFoodFactsLanguage.ODIA: 'ODIA',
  OpenFoodFactsLanguage.MALAYALAM: 'MALAYALAM',
  OpenFoodFactsLanguage.DUTCH: 'DUTCH',
  OpenFoodFactsLanguage.UYGHUR: 'UYGHUR',
  OpenFoodFactsLanguage.SERBIAN: 'SERBIAN',
  OpenFoodFactsLanguage.TIBETAN_LANGUAGE: 'TIBETAN_LANGUAGE',
  OpenFoodFactsLanguage.BELARUSIAN: 'BELARUSIAN',
  OpenFoodFactsLanguage.SAMOAN: 'SAMOAN',
  OpenFoodFactsLanguage.PUNJABI: 'PUNJABI',
  OpenFoodFactsLanguage.RUSSIAN: 'RUSSIAN',
  OpenFoodFactsLanguage.TAHITIAN: 'TAHITIAN',
  OpenFoodFactsLanguage.INTERLINGUA: 'INTERLINGUA',
  OpenFoodFactsLanguage.AFAR: 'AFAR',
  OpenFoodFactsLanguage.GREENLANDIC: 'GREENLANDIC',
  OpenFoodFactsLanguage.LATIN: 'LATIN',
  OpenFoodFactsLanguage.CHINESE: 'CHINESE',
  OpenFoodFactsLanguage.TURKMEN: 'TURKMEN',
  OpenFoodFactsLanguage.WEST_FRISIAN: 'WEST_FRISIAN',
  OpenFoodFactsLanguage.TSONGA: 'TSONGA',
  OpenFoodFactsLanguage.ROMANSH: 'ROMANSH',
  OpenFoodFactsLanguage.INUPIAT_LANGUAGE: 'INUPIAT_LANGUAGE',
  OpenFoodFactsLanguage.TAJIK: 'TAJIK',
  OpenFoodFactsLanguage.BURMESE: 'BURMESE',
  OpenFoodFactsLanguage.JAVANESE: 'JAVANESE',
  OpenFoodFactsLanguage.CHECHEN: 'CHECHEN',
  OpenFoodFactsLanguage.ASSAMESE: 'ASSAMESE',
  OpenFoodFactsLanguage.UNKNOWN_LANGUAGE: 'UNKNOWN_LANGUAGE',
  OpenFoodFactsLanguage.ARABIC: 'ARABIC',
  OpenFoodFactsLanguage.KINYARWANDA: 'KINYARWANDA',
  OpenFoodFactsLanguage.TONGAN_LANGUAGE: 'TONGAN_LANGUAGE',
  OpenFoodFactsLanguage.CHURCH_SLAVONIC: 'CHURCH_SLAVONIC',
  OpenFoodFactsLanguage.SINHALA: 'SINHALA',
  OpenFoodFactsLanguage.ARMENIAN: 'ARMENIAN',
  OpenFoodFactsLanguage.KURDISH: 'KURDISH',
  OpenFoodFactsLanguage.THAI: 'THAI',
  OpenFoodFactsLanguage.CREE: 'CREE',
  OpenFoodFactsLanguage.SWAHILI: 'SWAHILI',
  OpenFoodFactsLanguage.GUJARATI: 'GUJARATI',
  OpenFoodFactsLanguage.PERSIAN: 'PERSIAN',
  OpenFoodFactsLanguage.BOSNIAN: 'BOSNIAN',
  OpenFoodFactsLanguage.AMHARIC: 'AMHARIC',
  OpenFoodFactsLanguage.ARAGONESE: 'ARAGONESE',
  OpenFoodFactsLanguage.CROATIAN: 'CROATIAN',
  OpenFoodFactsLanguage.CHEWA: 'CHEWA',
  OpenFoodFactsLanguage.ZHUANG_LANGUAGES: 'ZHUANG_LANGUAGES',
  OpenFoodFactsLanguage.LINGALA_LANGUAGE: 'LINGALA_LANGUAGE',
  OpenFoodFactsLanguage.BAMBARA: 'BAMBARA',
  OpenFoodFactsLanguage.LIMBURGISH_LANGUAGE: 'LIMBURGISH_LANGUAGE',
  OpenFoodFactsLanguage.NUOSU_LANGUAGE: 'NUOSU_LANGUAGE',
  OpenFoodFactsLanguage.KWANYAMA: 'KWANYAMA',
  OpenFoodFactsLanguage.KIRUNDI: 'KIRUNDI',
  OpenFoodFactsLanguage.EWE: 'EWE',
  OpenFoodFactsLanguage.FAROESE: 'FAROESE',
  OpenFoodFactsLanguage.SINDHI: 'SINDHI',
  OpenFoodFactsLanguage.CORSICAN: 'CORSICAN',
  OpenFoodFactsLanguage.KANNADA: 'KANNADA',
  OpenFoodFactsLanguage.NORWEGIAN: 'NORWEGIAN',
  OpenFoodFactsLanguage.SUNDANESE_LANGUAGE: 'SUNDANESE_LANGUAGE',
  OpenFoodFactsLanguage.GEORGIAN: 'GEORGIAN',
  OpenFoodFactsLanguage.HAUSA: 'HAUSA',
  OpenFoodFactsLanguage.TSWANA: 'TSWANA',
  OpenFoodFactsLanguage.CATALAN: 'CATALAN',
  OpenFoodFactsLanguage.NDONGA_DIALECT: 'NDONGA_DIALECT',
  OpenFoodFactsLanguage.IGBO_LANGUAGE: 'IGBO_LANGUAGE',
  OpenFoodFactsLanguage.AFRIKAANS: 'AFRIKAANS',
  OpenFoodFactsLanguage.POLISH: 'POLISH',
  OpenFoodFactsLanguage.KASHMIRI: 'KASHMIRI',
  OpenFoodFactsLanguage.MAORI: 'MAORI',
  OpenFoodFactsLanguage.HUNGARIAN: 'HUNGARIAN',
  OpenFoodFactsLanguage.BRETON: 'BRETON',
  OpenFoodFactsLanguage.PORTUGUESE: 'PORTUGUESE',
  OpenFoodFactsLanguage.BULGARIAN: 'BULGARIAN',
  OpenFoodFactsLanguage.AVESTAN: 'AVESTAN',
  OpenFoodFactsLanguage.NEPALI: 'NEPALI',
  OpenFoodFactsLanguage.TWI: 'TWI',
  OpenFoodFactsLanguage.UZBEK: 'UZBEK',
  OpenFoodFactsLanguage.CHAMORRO: 'CHAMORRO',
  OpenFoodFactsLanguage.GUARANI: 'GUARANI',
  OpenFoodFactsLanguage.NYNORSK: 'NYNORSK',
  OpenFoodFactsLanguage.AZERBAIJANI: 'AZERBAIJANI',
  OpenFoodFactsLanguage.CZECH: 'CZECH',
  OpenFoodFactsLanguage.NAVAJO: 'NAVAJO',
  OpenFoodFactsLanguage.FINNISH: 'FINNISH',
  OpenFoodFactsLanguage.LUXEMBOURGISH: 'LUXEMBOURGISH',
  OpenFoodFactsLanguage.SWEDISH: 'SWEDISH',
  OpenFoodFactsLanguage.YIDDISH: 'YIDDISH',
  OpenFoodFactsLanguage.INUKTITUT: 'INUKTITUT',
  OpenFoodFactsLanguage.LAO: 'LAO',
  OpenFoodFactsLanguage.CHUVASH: 'CHUVASH',
  OpenFoodFactsLanguage.MALTESE: 'MALTESE',
  OpenFoodFactsLanguage.MALDIVIAN_LANGUAGE: 'MALDIVIAN_LANGUAGE',
  OpenFoodFactsLanguage.INTERLINGUE: 'INTERLINGUE',
  OpenFoodFactsLanguage.OSSETIAN: 'OSSETIAN',
  OpenFoodFactsLanguage.BASHKIR: 'BASHKIR',
  OpenFoodFactsLanguage.OJIBWE: 'OJIBWE',
  OpenFoodFactsLanguage.KANURI: 'KANURI',
  OpenFoodFactsLanguage.INDONESIAN: 'INDONESIAN',
  OpenFoodFactsLanguage.SARDINIAN_LANGUAGE: 'SARDINIAN_LANGUAGE',
  OpenFoodFactsLanguage.AKAN: 'AKAN',
  OpenFoodFactsLanguage.MANX: 'MANX',
  OpenFoodFactsLanguage.TURKISH: 'TURKISH',
  OpenFoodFactsLanguage.ESPERANTO: 'ESPERANTO',
  OpenFoodFactsLanguage.PASHTO: 'PASHTO',
  OpenFoodFactsLanguage.KYRGYZ: 'KYRGYZ',
  OpenFoodFactsLanguage.VOLAPUK: 'VOLAPUK',
  OpenFoodFactsLanguage.AVAR: 'AVAR',
  OpenFoodFactsLanguage.SANGO: 'SANGO',
  OpenFoodFactsLanguage.VENDA: 'VENDA',
  OpenFoodFactsLanguage.ALBANIAN: 'ALBANIAN',
  OpenFoodFactsLanguage.BASQUE: 'BASQUE',
  OpenFoodFactsLanguage.FULA_LANGUAGE: 'FULA_LANGUAGE',
  OpenFoodFactsLanguage.GERMAN: 'GERMAN',
  OpenFoodFactsLanguage.LATVIAN: 'LATVIAN',
  OpenFoodFactsLanguage.CORNISH: 'CORNISH',
  OpenFoodFactsLanguage.PALI: 'PALI',
  OpenFoodFactsLanguage.TATAR: 'TATAR',
  OpenFoodFactsLanguage.ROMANIAN: 'ROMANIAN',
  OpenFoodFactsLanguage.GIKUYU: 'GIKUYU',
  OpenFoodFactsLanguage.TIGRINYA: 'TIGRINYA',
  OpenFoodFactsLanguage.GALICIAN: 'GALICIAN',
  OpenFoodFactsLanguage.TELUGU: 'TELUGU',
  OpenFoodFactsLanguage.HINDI: 'HINDI',
  OpenFoodFactsLanguage.KONGO_LANGUAGE: 'KONGO_LANGUAGE',
  OpenFoodFactsLanguage.XHOSA: 'XHOSA',
  OpenFoodFactsLanguage.SWAZI: 'SWAZI',
  OpenFoodFactsLanguage.LUGANDA: 'LUGANDA',
  OpenFoodFactsLanguage.URDU: 'URDU',
  OpenFoodFactsLanguage.NORTHERN_NDEBELE_LANGUAGE: 'NORTHERN_NDEBELE_LANGUAGE',
  OpenFoodFactsLanguage.YORUBA: 'YORUBA',
  OpenFoodFactsLanguage.WORLD: 'WORLD',
  OpenFoodFactsLanguage.UNDEFINED: 'UNDEFINED',
};
