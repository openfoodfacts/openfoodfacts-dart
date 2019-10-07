// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    barcode: json['code'] as String,
    productName: json['product_name'] as String,
    productNameDE: json['product_name_de'] as String,
    productNameEN: json['product_name_en'] as String,
    brands: json['brands'] as String,
    lang: json['lang'] as String,
    quantity: json['quantity'] as String,
    imgSmallUrl: json['image_small_url'] as String,
    ingredientsText: json['ingredients_text'] as String,
    ingredientsTextDE: json['ingredients_text_de'] as String,
    ingredientsTextEN: json['ingredients_text_en'] as String,
    categories: json['categories'] as String,
    nutrimentEnergyUnit: json['nutriment_energy_unit'] as String,
    nutrimentDataPer: json['nutrition_data_per'] as String,
    nutriscore: json['nutrition_grade_fr'] as String,
    nutriments: json['nutriments'] == null
        ? null
        : Nutriments.fromJson(json['nutriments'] as Map<String, dynamic>),
    additives: json['additives_tags'] == null
        ? null
        : Additives.fromJson((json['additives_tags'] as List)
            ?.map((e) => e as String)
            ?.toList()),
  )
    ..productNameFR = json['product_name_fr'] as String
    ..selectedImages = json['selected_images'] == null
        ? null
        : ImageList.fromJson(json['selected_images'] as Map<String, dynamic>)
    ..ingredients = (json['ingredients'] as List)
        ?.map((e) =>
            e == null ? null : Ingredient.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..ingredientsTextFR = json['ingredients_text_fr'] as String
    ..categoriesTags =
        (json['categories_tags'] as List)?.map((e) => e as String)?.toList()
    ..labelsTags =
        (json['labels_tags'] as List)?.map((e) => e as String)?.toList()
    ..miscTags = (json['misc'] as List)?.map((e) => e as String)?.toList()
    ..statesTags =
        (json['states_tags'] as List)?.map((e) => e as String)?.toList()
    ..tracesTags =
        (json['traces_tags'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$ProductToJson(Product instance) {
  final val = <String, dynamic>{
    'code': instance.barcode,
    'product_name': instance.productName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('product_name_de', instance.productNameDE);
  writeNotNull('product_name_en', instance.productNameEN);
  writeNotNull('product_name_fr', instance.productNameFR);
  val['brands'] = instance.brands;
  val['lang'] = instance.lang;
  val['quantity'] = instance.quantity;
  val['image_small_url'] = instance.imgSmallUrl;
  writeNotNull('selected_images', instance.selectedImages);
  writeNotNull('ingredients', instance.ingredients);
  writeNotNull('nutriments', instance.nutriments);
  writeNotNull('additives_tags', instance.additives);
  writeNotNull('ingredients_text', instance.ingredientsText);
  writeNotNull('ingredients_text_de', instance.ingredientsTextDE);
  writeNotNull('ingredients_text_en', instance.ingredientsTextEN);
  writeNotNull('ingredients_text_fr', instance.ingredientsTextFR);
  writeNotNull('nutriment_energy_unit', instance.nutrimentEnergyUnit);
  writeNotNull('nutrition_data_per', instance.nutrimentDataPer);
  writeNotNull('nutrition_grade_fr', instance.nutriscore);
  writeNotNull('categories', instance.categories);
  writeNotNull('categories_tags', instance.categoriesTags);
  writeNotNull('labels_tags', instance.labelsTags);
  writeNotNull('misc', instance.miscTags);
  writeNotNull('states_tags', instance.statesTags);
  writeNotNull('traces_tags', instance.tracesTags);
  return val;
}
