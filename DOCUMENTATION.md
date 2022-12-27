# Open Food Facts - Dart

Dart package for the Open Food Facts API. Free and Easy access to food products information from all around the world.

## Quick note on Open Food Facts

Open Food Facts is an open and crowdsourced database that contains various information about over a million food products. Data such as Ingredients, Additives, Brands, Nutritional intakes, Serving sizes, Nutriscore, NOVA group, and many more can be found in the Open Food Facts database.

You are free to use the API but also contribute to it, the products list is constantly growing thanks to the many awesome contributors we have, and your help is more than welcomed.

## How does it work ?

We use the ability of the Open Food Facts API to return products results in Json, we then generate easily understandable objects structures to make it simple for you to use.

This plugin also allows you to edit a product or upload a new one to Open Food Facts. Using the same simple product structure you can create a product object or edit an existing one and send it to the API using a single function.

#### OpenFoodFactsLanguage
This enum contains all the supported languages (180+) and allows an easy and reliable language selection.
You can find the full list of available languages here : [Open Food Facts Languages](https://github.com/openfoodfacts/openfoodfacts-dart/blob/master/lib/utils/LanguageHelper.dart).


### Functions




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



When creating a [producer account](https://world.pro.openfoodfacts.org/) use `requested_org` to name the Producer or brand

Possible `status.status` responses:

| Code                   | Meaning       |
| :--------------------- | ------------- |
| 201                    | User created  |
| 400 (+ `status.error`) | Request error |
| 500                    | Server error  |

### Examples


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

## Notes on languages mechanics.

TL;DR: use the "..InLanguages" fields if you intend to display products data in
specific language(s). You __must__ use the "..InLanguages" fields if you intend
to update products. Otherwise you might accidentally corrupt products by
overwriting proper-language data with improper-language data.

See detailed explanation and examples below.

### Detailed explanation of languages mechanics.

Most of end-user facing apps want to display products data to a user in
the language(s) the user understands.
In order for a developer to properly implement multilingual Open Food Facts
usage, the developer might want to understand how Open Food Facts works with
languages.

Here are main concepts.

Products in Open Food Facts can have some of their fields in multiple
languages. Such fields are of 2 types:
1. Text fields with info taken directly from product packaging
   (like product name and ingredients list). Such fields generally are
   not touched by the backend and are stored in the DB exactly as they
   were sent.
2. Lists of tags with meta-information (like list countries where the product is
   being sold, or like product's categories). Such fields are processed
   by the backend in different ways and often shouldn't be displayed to
   the user as-is.

In addition to that, fields of the [Product] class with multilingual
support also are of 2 types:
1. Fields with simple value (e.g. [Product.productName]).
2. Fields with multilingual values (e.g. [Product.productNameInLanguages]).

Lastly, products in Open Food Facts have a main language. That's the
language which will be used to fill fields of [Product] when no specific
language settings were provided.
Most likely you don't want to show the data to your users in the product's
main language. Most likely you want to prefer data in some specific
language.

Let's say you want a product to be displayed in German and
so you've set the value of [AbstractQueryConfiguration.language] to German.
Here's how the described above types of fields work in combinations:
1. 1-1 (packaging info + simple value).
   Fields like [Product.productName] will be in German if the German
   versions of them are available in OFF.
   If the German version is not available, the fields will be in the main
   product's language.
2. 1-2 (packaging info + multilingual value).
   Fields like [Product.productNameInLanguages] will have the German value
   inside if it's available.
   If it's not available, `product.productNameInLanguages[GERMAN]`
   will be `null`.
3. 2-1 (meta info + simple value).
   Fields like [Product.countriesTags] __will not be in German__, ever.
   They will have values like `["en:austria", "en:belgium", "en:canada"]`.
4. 2-2 (meta info + multilingual value).
   Fields like [Product.countriesTagsInLanguages] will have German values
   when available, if some of the values is not available in German it
   will have a language prefix: `["Österreich ", "Belgien", "en:canada"]`.

Those 4 combinations can be observed "in the wild" by
executing next request:
https://world.openfoodfacts.org/api/v2/product/3017620422003?lc=de&fields=product_name,product_name_de,countries_tags,countries_tags_de

As you can see, the multilingual values should be prefered in most cases
when product's data is displayed to a user.

#### Example: display a product in German language or rollback to default.

```dart
final conf = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.NAME]);
final product = await OpenFoodAPIClient.getProduct(conf);
// The requested language is German, so `product.productName`
// either is in German, or in main product's language, or null.
var name = product.productName ?? 'No name';
_displayProductName(name);
```

#### Example: display a product in German language, or in Russian, or rollback to default.

```dart
final conf = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          languages: [OpenFoodFactsLanguage.RUSSIAN],
          fields: [ProductField.NAME, ProductField.NAME_IN_LANGUAGES]);
final product = await OpenFoodAPIClient.getProduct(conf);
var name = product.productNameInLanguages[OpenFoodFactsLanguage.GERMAN];
name ??= product.productNameInLanguages[OpenFoodFactsLanguage.RUSSIAN];
name ??= product.productName;
name ??= 'No name';
_displayProductName(name);
```

#### Example: display product categories in German language.

```dart
final conf = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.CATEGORIES_TAGS_IN_LANGUAGES]);
final product = await OpenFoodAPIClient.getProduct(conf);
var categories = product.categoriesTagsInLanguages[OpenFoodFactsLanguage.GERMAN];

// Erase not translated categories (e.g. "en:cake").
categories = categories.where((c) => !c.startsWith(RegExp('\w+:')));

_displayProductCategories(categories);
```

#### Example: update German product categories.

```dart
final conf = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.CATEGORIES_TAGS_IN_LANGUAGES]);
final product = await OpenFoodAPIClient.getProduct(conf);
var categories = product.categoriesTagsInLanguages[OpenFoodFactsLanguage.GERMAN];

// Will have only categories which start with
// lang prefixes (e.g. "en:cake").
final notTranslatedCategories = categories.where((c) => c.startsWith(RegExp('\w+:')));
// Translated categories only.
final translatedCategories = categories.where((c) => !c.startsWith(RegExp('\w+:')));

final updatedCategories = await _askUserToUpdateCategories(
  translatedCategories);
// Set updated German categories AND avoid
// erasure of the not translated ones.
product.categoriesTagsInLanguages[OpenFoodFactsLanguage.GERMAN] =
  updatedCategories + notTranslatedCategories;

await OpenFoodAPIClient.saveProduct(_user, product);
```