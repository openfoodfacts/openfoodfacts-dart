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
      nutrimentEnergy: json['nutriment_energy'] as String,
      nutrimentEnergyUnit: json['nutriment_energy_unit'] as String,
      nutrimentDataPer: json['nutrition_data_per'] as String)
    ..selectedImages = json['selected_images'] == null
        ? null
        : ImageLocation.fromJson(
            json['selected_images'] as Map<String, dynamic>)
    ..ingredients = (json['ingredients'] as List)
        ?.map((e) =>
            e == null ? null : Ingredient.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..categoriesTags =
        (json['categories_tags'] as List)?.map((e) => e as String)?.toList()
    ..labelsTags =
        (json['labels_tags'] as List)?.map((e) => e as String)?.toList()
    ..miscTags = (json['misc'] as List)?.map((e) => e as String)?.toList()
    ..statesTags =
        (json['states_tags'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$ProductToJson(Product instance) {
  var val = <String, dynamic>{
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
  val['brands'] = instance.brands;
  val['lang'] = instance.lang;
  val['quantity'] = instance.quantity;
  val['image_small_url'] = instance.imgSmallUrl;
  writeNotNull('selected_images', instance.selectedImages);
  writeNotNull('ingredients', instance.ingredients);
  writeNotNull('ingredients_text', instance.ingredientsText);
  writeNotNull('ingredients_text_de', instance.ingredientsTextDE);
  writeNotNull('ingredients_text_en', instance.ingredientsTextEN);
  writeNotNull('nutriment_energy', instance.nutrimentEnergy);
  writeNotNull('nutriment_energy_unit', instance.nutrimentEnergyUnit);
  writeNotNull('nutrition_data_per', instance.nutrimentDataPer);
  writeNotNull('categories', instance.categories);
  writeNotNull('categories_tags', instance.categoriesTags);
  writeNotNull('labels_tags', instance.labelsTags);
  writeNotNull('misc', instance.miscTags);
  writeNotNull('states_tags', instance.statesTags);
  return val;
}
