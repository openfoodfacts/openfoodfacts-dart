# Open Food Facts - Dart

Dart package for the Open Food Facts API. Free and Easy access to food products information from all around the world.

## Quick note on Open Food Facts

Open Food Facts is an open and crowdsourced database that contains various information about over a million food products. Data such as Ingredients, Additives, Brands, Nutritional intakes, Serving sizes, Nutriscore, NOVA group, and many more can be found in the Open Food Facts database.

You are free to use the API but also contribute to it, the products list is constantly growing thanks to the many awesome contributors we have, and your help is more than welcomed.

## Notes on languages mechanics

TL;DR: use the "..InLanguages" fields if you intend to display products data in
specific language(s). You __must__ use the "..InLanguages" fields if you intend
to update products. Otherwise you might accidentally corrupt products by
overwriting proper-language data with improper-language data.

See detailed explanation and examples below.

### Detailed explanation of languages mechanics

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

```url
https://world.openfoodfacts.org/api/v2/product/3017620422003?lc=de&fields=product_name,product_name_de,countries_tags,countries_tags_de
```

As you can see, the multilingual values should be prefered in most cases
when product's data is displayed to a user.

#### Example: display a product in German language or rollback to default

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

#### Example: display a product in German language, or in Russian, or rollback to default

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

#### Example: display product categories in German language

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

#### Example: update German product categories

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
