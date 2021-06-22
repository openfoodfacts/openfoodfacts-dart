# Open Food Facts - Dart

Dart package for the Open Food Facts API. Free and Easy access to food products information from all around the world.

## Quick note on Open Food Facts

Open Food Facts is an open and crowdsourced database that contains various information about over a million food products. Data such as Ingredients, Additives, Brands, Nutritional intakes, Serving sizes, Nutriscore, NOVA group, and many more can be found in the Open Food Facts database.

You are free to use the API but also contribute to it, the products list is constantly growing thanks to the many awesome contributors we have, and your help is more than welcomed.

## How does it work ?

We use the ability of the Open Food Facts API to return products results in Json, we then generate easily understandable objects structures to make it simple for you to use.

This plugin also allows you to edit a product or upload a new one to Open Food Facts. Using the same simple product structure you can create a product object or edit an existing one and send it to the API using a single function.

## How do I use it ?

Jump to [**Object structures**](#objects-structures), [**Functions**](#functions) or [**Examples**](#examples).

### Objects Structures

This section details all the available fields in each class.

#### User
This class handles user identification when writing into the database.

```dart
String userId
String password
```

#### ProductResult
This class is the result of a product request.

```dart
int status
String barcode
String statusVerbose
Product product
```

#### Product
This class contains all the data regarding a specific product.

```dart
String barcode
String productName
OpenFoodFactsLanguage lang
String quantity
String servingSize

String brands
List<String> brandTags

String imgSmallUrl
ImageList selectedImages

List<Ingredient> ingredients
String ingredientsText

Nutriments nutriments
NutrimentLevels nutrimentLevels
String nutrimentEnergyUnit
String nutrimentDataPer

String nutriscore

Additives additives

String categories;
List<String> categoriesTags

List<String> labelsTags
List<String> miscTags
List<String> stateTags
List<String> tracesTags


---- Available for RAW products ----
String productNameDE
String productNameEN
String productNameFR

String ingredientsTextDE
String ingredientsTextEN
String ingredientsTextFR
```

#### ProductImage
This class handles the different types and sizes of the image, it also contains it's URL.

```dart
static const String FIELD_FRONT
static const String FIELD_INGREDIENTS
static const String FIELD_NUTRITION
static const String FIELD_OTHER

static const String SIZE_SMALL
static const String SIZE_THUMB
static const String SIZE_DISPLAY

String field
String size
OpenFoodFactsLanguage language
String url
```

#### Ingredient
This class contains essential data of an ingredient of the product.

```dart
int rank
String id
String text
int percent
bool bold
```

#### Nutriments
This class contains the nutrition facts of the product.

```dart
---- For a serving of 100g ----
double salt
double fiber
double sugars
double fat
double saturatedFat
double proteins
double carbohydrates
double energy

int novaGroup

---- Per recommanded serving ----
double saltServing
double saltServing
double sugarServing
double fatServing
double saturatedFatServing
double proteinsServing
double carbohydratesServing
double energyServing

int novaGroupServing
```

#### NutrimentsLevel
This class indicates the level of each nutrient from low to high.

Levels are classified in an enum.

```dart
enum Level { LOW, MODERATE, HIGH, UNDEFINED }
```

```dart
static const String NUTRIENT_SUGARS
static const String NUTRIENT_FAT
static const String NUTRIENT_SATURATED_FAT
static const String NUTRIENT_SALT

Map<String, Level> levels
```

#### Additives
This class contains a list in each format of the additives present in the product.

An **id** is formated as followed : 'en:e100i'

While a **name** is formated like this : 'E100i'

```dart
List<String> ids
List<String> names
```

#### Parameter
This abstract class is used to pass parameters to a product search query. At the moment 8 types of parameters are available.


OutputFormat :

 - OutputFormat(format: Format.JSON)
 - OutputFormat(format: Format.JQM)
 - OutputFormat(format: Format.XML)

ContainsAdditives :

 - ContainsAdditives(filter: true)
 - ContainsAdditives(filter: false)

Page :

 - Page(page: 0)
 - Page(page: 1)
 - Page(page: 2)
 - ...

PageSize :

 - PageSize(size: 1)
 - PageSize(size: 2)
 - PageSize(size: 3)
 - ...

SearchSimple :

 - SearchSimple(active: true)
 - SearchSimple(active: false)

SearchTerms :

 - SearchTerms(["Fruit", "Coques", ...])

SortBy :

 - SortBy(option: SortOption.PRODUCT_NAME)
 - SortBy(option: SortOption.CREATED)
 - SortBy(option: SortOption.EDIT)
 - SortBy(option: SortOption.POPULARITY)

TagFilter :

 - TagFilter(tagType: "categories",
            contains: true,
            tagName: "breakfast_cereals")
 - TagFilter(tagType: "nutrition_grades",
            contains: true,
            tagName: "A")
 - ...

#### SearchResult

This class contains the result of a product search query.

```dart
int page
int pageSize
int count
int skip
list<Product> products
```

#### SendImage
This class is the object template to be provided to the image upload function.

```dart
OpenFoodFactsLanguage lang
Uri imageUri
String barcode
String imageField
```

#### Status
This class handles the status of a call to the API.

```dart
final status // to be completed
String error
String statusVerbose
int imageId
```

#### ProductQueryConfigurations
This class allows you to configure a Product query by specifying the [language](#openfoodfactslanguage) and [fields](#productfield).
It is then passed to the [getProduct()](#get-a-productproduct-from-a-barcode) function.

```dart
String barcode;
OpenFoodFactsLanguage language;
List<ProductField> fields;
```

#### ProductSearchQueryConfigurations
This class allows you to configure a Product query by specifying the [language](#openfoodfactslanguage), [fields](#productfield) and [search parameters](#parameter).
It is then passed to the [searchProducts()](#search-products) function.

```dart
OpenFoodFactsLanguage language;
List<ProductField> fields;
List<Parameter> parametersList;
```

#### ProductField
This enum allows you to easily select product fields.
You can find the full list of available fields here : [Product Fields](https://github.com/openfoodfacts/openfoodfacts-dart/blob/master/lib/utils/ProductFields.dart).

#### OpenFoodFactsLanguage
This enum contains all the supported languages (180+) and allows an easy and reliable language selection.
You can find the full list of available languages here : [Open Food Facts Languages](https://github.com/openfoodfacts/openfoodfacts-dart/blob/master/lib/utils/LanguageHelper.dart).


### Functions

#### Get a [product](#product) from a barcode
This function retrieves the data of the product following the [ProductQueryConfigurations](#productqueryconfigurations) passed to it. The result is a [ProductResult](#productresult).

```dart
Parameters : ProductQueryConfiguration config
Optional : User user

ProductResult result = await OpenFoodAPIClient.getProduct(configurations, user: TestConstants.TEST_USER);
```
See the [example](#example-1--get-a-product-from-a-barcode)

#### Get a [product](#product) from a barcode (RAW)
This function retrieves the data of the product but returns it "as is". Fields are returned in the selected language if available. The result is a [ProductResult](#productresult).

```dart
Parameters : String barcode, OpenFoodFactsLanguage lang
Optional : User user

ProductResult result = await OpenFoodAPIClient.getProductRaw("yourbarcode", OpenFoodFactsLanguage.FRENCH);
```
See the [example](#example-2--get-a-raw-product-from-a-barcode)

#### Search products
This function allows you to get a list of products according to a list of [parameters](#parameter). The result is a [SearchResult](#searchresult).

```dart
Parameters : List<Parameter> parameterList
Optional : String lang

SearchResult result = await OpenFoodAPIClient.searchProducts(parameterList, lang: User.LANGUAGE_FR);
```
See the [example](#example-3--search-for-products)

#### Edit or Add a product to Open Food Facts
This functions sends a [product](#product) to the API in order to be written into the database. The result is a [Status](#status).

```dart
Parameters : User user, ProductSearchQueryConfigurations config

Status result = await OpenFoodAPIClient.searchProducts(TestConstants.TEST_USER, configuration);
```
See the [example](#example-4--send-a-product-to-open-food-facts)

#### Send a picture for an existing product to Open Food Facts
This function allows you to send a [picture](#productimage) linked to an existing [product](#product) in the database.

```dart
Parameters : User user, ProductImage image

Status result = await OpenFoodAPIClient.addProductImage(user, image);
```
See the [example](#example-5--upload-an-image-for-a-given-product)

#### Check login data

This function checks if the user_id and password of a provided user object are correct.

```dart
Parameters : User user

bool result = await OpenFoodAPIClient.login(user);
```



### Examples

#### Example 1 : Get a product from a barcode

```dart
String barcode = "0000000000000";

ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.NUTRIMENTS,
                   ProductField.INGREDIENTS_TEXT,
                   ProductField.INGREDIENTS,
                   ProductField.ADDITIVES
                   ProductField.NUTRIENT_LEVELS]);

ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
  user: TestConstants.TEST_USER);

if(result.status != 1) {
	print("Error retreiving the product : ${result.status.errorVerbose}");
    return;
}

String ingredientsT = result.product.ingredientsText;
List<Ingredient> ingredients = result.product.ingredients;

double energy_100g = result.product.nutriments.energy;
double fat_100g = result.product.nutriments.fat;

double salt_serving = result.product.nutriments.saltServing;
double fat_serving = result.product.nutriments.fatServing;

String firstAdditiveName = result.product.additives.names[0];

Level sugars_level = result.product.nutrientLevels.levels[NutrientLevels.NUTRIENT_SUGARS];
```

#### Example 2 : Get a RAW product from a barcode
Notice : You should use getProduct() as much as possible to filter the fields in the result and speed up the API answer
```dart
String barcode = "0000000000000";

ProductResult result = await OpenFoodAPIClient.getProductRaw(
          barcode, OpenFoodFactsLanguage.GERMAN,
          user: TestConstants.TEST_USER);

if(result.status != 1) {
	print("Error retreiving the product : ${result.status.errorVerbose}");
    return;
}

String ingredientsT = result.product.ingredientsTextFR; // It is necessary to specify the language as the we are using getProductRaw()
List<Ingredient> ingredients = result.product.ingredients;

double energy_100g = result.product.nutriments.energy;
double fat_100g = result.product.nutriments.fat;

double salt_serving = result.product.nutriments.saltServing;
double fat_serving = result.product.nutriments.fatServing;

String firstAdditiveName = result.product.additives.names[0];

Level sugars_level = result.product.nutrientLevels.levels[NutrientLevels.NUTRIENT_SUGARS];
```

#### Example 3 : Search for products

```dart
var parameters = <Parameter>[
    const OutputFormat(format: Format.JSON),
    const Page(page: 5),
    const PageSize(size: 10),
    const SearchSimple(active: true),
    const SortBy(option: SortOption.PRODUCT_NAME),
    const TagFilter(
        tagType: "categories",
        contains: true,
        tagName: "breakfast_cereals"),
    const TagFilter(
        tagType: "nutrition_grades", contains: true, tagName: "A")
];

ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
              parametersList: parameters,
              fields: [ProductField.NUTRISCORE],
              language: OpenFoodFactsLanguage.FRENCH);

      SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER, configuration);

String nutriscore_first_product = result.products[0].nutriscore;
```

#### Example 4 : Send a product to Open Food Facts

```dart
User myUser = User("Myself", "secret_password");

Product newProduct = Product(
    barcode: "0000000000000",
    productName: "Example Product",
    quantity: "200g",
    brands: "Example Brand",
    lang: "fr",
    ingredientsText: "Ingredient 1, Ingredient 2, Ingredient 3",
    categories: "Category 1, Category 2"
    ...
);

Status result = await OpenFoodAPIClient.saveProduct(myUser, newProduct);

if(result.status != 1) {
	print("An error occured while sending the product : ${result.statusVerbose}");
    return;
}

print("Upload was successful");
```

#### Example 5 : Upload an image for a given product

```dart
User myUser = User("Myself", "secret_password");

String barcode = "0000000000000";

SendImage image = new SendImage(
    lang: "fr",
    barcode: barcode,
    imageField: ProductImage.FIELD_FRONT,
    imageUri: Uri.parse("path_to_my_image"),
);


Status status = await OpenFoodAPIClient.addProductImage(myUser, image);

if(result.status != 1) {
	print("An error occured while sending the picture : ${result.statusVerbose}");
    return;
}

print("Upload was successful");
```

