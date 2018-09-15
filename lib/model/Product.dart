import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';
import 'ImageLocation.dart';
import 'Ingredient.dart';

part 'Product.g.dart';

@JsonSerializable()
class Product extends JsonObject {
  @JsonKey(name: 'code', nullable: false)
  String barcode;
  @JsonKey(name: 'product_name', nullable: false)
  String productName;
  @JsonKey(name: 'product_name_de', includeIfNull: false)
  String productNameDE;
  @JsonKey(name: 'product_name_en', includeIfNull: false)
  String productNameEN;
  String brands;
  String lang;
  String quantity;
  @JsonKey(name: 'image_small_url')
  String imgSmallUrl;

  /// cause nesting is sooo cool ;)
  @JsonKey(name: 'selected_images', includeIfNull: false)
  ImageLocation selectedImages;

  @JsonKey(includeIfNull: false)
  List<Ingredient> ingredients;

  @JsonKey(name: 'ingredients_text', includeIfNull: false)
  String ingredientsText;
  @JsonKey(name: 'ingredients_text_de', includeIfNull: false)
  String ingredientsTextDE;
  @JsonKey(name: 'ingredients_text_en', includeIfNull: false)
  String ingredientsTextEN;

  @JsonKey(name: 'nutriment_energy', includeIfNull: false)
  String nutrimentEnergy;
  @JsonKey(name: 'nutriment_energy_unit', includeIfNull: false)
  String nutrimentEnergyUnit;
  @JsonKey(name: 'nutrition_data_per', includeIfNull: false)
  String nutrimentDataPer;

  @JsonKey(includeIfNull: false)
  String categories;

  @JsonKey(name: 'categories_tags', includeIfNull: false)
  List<String> categoriesTags;
  @JsonKey(name: 'labels_tags', includeIfNull: false)
  List<String> labelsTags;
  @JsonKey(name: 'misc', includeIfNull: false)
  List<String> miscTags;
  @JsonKey(name: 'states_tags', includeIfNull: false)
  List<String> statesTags;

  Product({
    this.barcode,
    this.productName,
    this.productNameDE,
    this.productNameEN,
    this.brands,
    this.lang,
    this.quantity,
    this.imgSmallUrl,
    this.ingredientsText,
    this.ingredientsTextDE,
    this.ingredientsTextEN,
    this.categories,
    this.nutrimentEnergy,
    this.nutrimentEnergyUnit,
    this.nutrimentDataPer,
  });


  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductToJson(this);

}
