# Open Food Facts - Dart
The Open Food Facts Dart SDK allows you to access and contribute to a vast open and crowdsourced database that includes **food**, **beauty products**, **pet food**, and other **products**. This SDK provides easy access to information from Open Food Facts, Open Beauty Facts, Open Pet Food Facts, and Open Products Facts.

-----

## What is Open Food Facts?

Open Food Facts is a collaborative, open-source project that collects data on millions of products worldwide. Contributors add and update information such as:

  * **Ingredients**
  * **Additives**
  * **Brands**
  * **Nutrition facts**
  * **Serving sizes**
  * **Nutri-Score** (for food products)
  * **NOVA group** (for food products, concerning ultra-processing)
  * **Green-Score** (for food products, regarding environmental impact)
  * **Packaging details**
  * **Certifications and labels**

The database is constantly growing thanks to contributions from users like you, and all data is available under an open license.

-----

## How it Works

The SDK leverages the Open\*Facts APIs, which return product data in JSON format. These JSON responses are then converted into easy-to-understand Dart objects, simplifying their use in your applications. The SDK also enables you to edit existing products or upload new ones to the databases using the same straightforward product structures.

-----

## Understanding Language Mechanics

When displaying or updating product data in specific languages, it's crucial to understand how the Open\*Facts APIs handle multilingual information. It is **highly recommended** to use the `..InLanguages` fields for both displaying and updating data to prevent accidental overwrites of existing language-specific data.

### Detailed Explanation

Products in the Open\*Facts databases can have various fields available in multiple languages. These fields fall into two main categories:

1.  **Direct Packaging Information**: Text fields like `productName` and `ingredientsText` are often stored exactly as they appear on the product packaging, without significant backend processing.
2.  **Meta-Information Tags**: Fields like `countriesTags` (countries where sold) or `categoriesTags` (product categories) contain meta-information. These are processed by the backend and may not always be suitable for direct display without further formatting.

Additionally, product fields in the Dart `Product` class with multilingual support are structured as:

1.  **Simple Value Fields**: E.g., `Product.productName`.
2.  **Multilingual Value Fields**: E.g., `Product.productNameInLanguages`.

Each product also has a main language, which is used to populate simple value fields when no specific language settings are provided in a query. For accurate display, you will likely want to prioritize data in your user's preferred language rather than the product's main language.

**Example**: If you set `AbstractQueryConfiguration.language` to German, here's how different field types behave:

  * **Packaging Info (Simple Value)**: `Product.productName` will return the German product name if available. If not, it will default to the product's main language.
  * **Packaging Info (Multilingual Value)**: `Product.productNameInLanguages` will contain the German value if available. If not, `product.productNameInLanguages[OpenFoodFactsLanguage.GERMAN]` will be `null`.
  * **Meta Info (Simple Value)**: `Product.countriesTags` will **not** be in German. It will contain tags like `["en:austria", "en:belgium", "en:canada"]`.
  * **Meta Info (Multilingual Value)**: `Product.countriesTagsInLanguages` will contain German values when available. If some values are not available in German, they might retain a language prefix (e.g., `["Österreich ", "Belgien", "en:canada"]`).

You can observe these combinations by executing a request like:
`https://world.openfoodfacts.org/api/v2/product/3017620422003?lc=de&fields=product_name,product_name_de,countries_tags,countries_tags_de`

It's evident that multilingual value fields are generally preferred for displaying product data to users.

-----

### Code Examples for Language Handling

#### Displaying a Product in German (with fallback)

```dart
final conf = ProductQueryConfiguration(
  barcode,
  language: OpenFoodFactsLanguage.GERMAN,
  fields: [ProductField.NAME]
);
final product = await OpenFoodAPIClient.getProductV3(conf);
// The requested language is German, so `product.productName`
// either is in German, or in main product's language, or null.
var name = product.product?.productName ?? 'No name';
_displayProductName(name);
```

#### Displaying a Product in German, then Russian (with fallback)

```dart
final conf = ProductQueryConfiguration(
  barcode,
  language: OpenFoodFactsLanguage.GERMAN,
  languages: [OpenFoodFactsLanguage.RUSSIAN],
  fields: [ProductField.NAME, ProductField.NAME_IN_LANGUAGES]
);
final product = await OpenFoodAPIClient.getProductV3(conf);
var name = product.product?.productNameInLanguages?[OpenFoodFactsLanguage.GERMAN];
name ??= product.product?.productNameInLanguages?[OpenFoodFactsLanguage.RUSSIAN];
name ??= product.product?.productName;
name ??= 'No name';
_displayProductName(name);
```

#### Displaying Product Categories in German

```dart
final conf = ProductQueryConfiguration(
  barcode,
  language: OpenFoodFactsLanguage.GERMAN,
  fields: [ProductField.CATEGORIES_TAGS_IN_LANGUAGES]
);
final product = await OpenFoodAPIClient.getProductV3(conf);
var categories = product.product?.categoriesTagsInLanguages?[OpenFoodFactsLanguage.GERMAN];

// Erase not translated categories (e.g., "en:cake").
categories = categories?.where((c) => !c.startsWith(RegExp(r'\w+:'))).toList();

_displayProductCategories(categories);
```

#### Updating German Product Categories

```dart
final conf = ProductQueryConfiguration(
  barcode,
  language: OpenFoodFactsLanguage.GERMAN,
  fields: [ProductField.CATEGORIES_TAGS_IN_LANGUAGES]
);
final productResult = await OpenFoodAPIClient.getProductV3(conf);
Product? product = productResult.product;

if (product != null) {
  var categories = product.categoriesTagsInLanguages?[OpenFoodFactsLanguage.GERMAN];

  // Categories that still have language prefixes (e.g., "en:cake").
  final notTranslatedCategories = categories?.where((c) => c.startsWith(RegExp(r'\w+:'))).toList() ?? [];
  // Translated categories only.
  final translatedCategories = categories?.where((c) => !c.startsWith(RegExp(r'\w+:'))).toList() ?? [];

  // Assume _askUserToUpdateCategories is a function that gets updated categories from the user.
  final updatedTranslatedCategories = await _askUserToUpdateCategories(translatedCategories);

  // Set updated German categories AND avoid erasure of the not translated ones.
  product.categoriesTagsInLanguages?[OpenFoodFactsLanguage.GERMAN] =
      (updatedTranslatedCategories ?? []) + notTranslatedCategories;

  await OpenFoodAPIClient.saveProduct(_user, product);
}
```

-----

## Installation

Follow the installing instructions on [pub.dev](https://pub.dev/packages/openfoodfacts/install).

-----

## Authentication

For most read-only queries, no authentication is required. However, it's recommended to set a User-Agent to prevent your requests from being blocked by mistake. For operations that modify or submit data, user authentication is necessary.

### Setup (Optional)

You can define global settings for your application at the beginning of its lifecycle. These can be overridden by specific query configurations:

```dart
import 'package:openfoodfacts/openfoodfacts.dart';

OpenFoodAPIConfiguration.userAgent = UserAgent(
  name: 'Your app name',
  url: 'Your app URL, if applicable'
);

OpenFoodAPIConfiguration.globalLanguages = <OpenFoodFactsLanguage>[
  OpenFoodFactsLanguage.ENGLISH
];

OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
```

-----

## Key Features

### Reading Data

  * **Querying a Product**: Retrieve detailed product information by barcode.
  * **Recommended Daily Intakes**: Access recommended daily nutrient intake amounts, based on EU standards.
  * **Searching for Products**:
      * By name, brand, stores, or ingredients.
      * By categories or PNNS groups (for food).
      * By vegan, vegetarian, or palm oil status (for food).
  * **Autocompletion for User Inputs**: Get suggestions for labels, categories, ingredients, additives, traces, and other tag types to enhance search functionality.
  * **Nutrient Hierarchy**: Retrieve the nutrient hierarchy specific to a country and localized to a chosen language.
  * **Product Freshness**: Check the freshness of product data based on last modified timestamps.

### Writing Data

  * **Managing User Accounts**:
      * **Login**: Authenticate existing users.
      * **Register**: Allow new users to create accounts.
      * **Reset Password**: Send password reset emails to users.
      * **Contribution Data**: Retrieve data about a user's contributions.
  * **Saving Products**: Add new products or edit existing ones, including specifying attributes like product name, quantity, brands, ingredients, and categories.
  * **Images**:
      * **Upload Images**: Send front, ingredients, nutrition, or packaging images for products.
      * **Modify Images**: Rotate or crop existing product images.
      * **Extract Text**: Use OCR to extract text from ingredient lists or packaging images.

### Robotoff Support

[Robotoff](https://openfoodfacts.github.io/robotoff/) is the Open Food Facts AI that analyzes new product pictures to extract data and generate questions for community validation.

  * **Get Insights**: Retrieve random insights or insights specific to a product.
  * **Get Questions**: Fetch random questions or questions for a specific product that need human validation.
  * **Post Insight Annotation**: Submit annotations (e.g., "Yes," "No," "Maybe") to answer Robotoff questions.

### Folksonomy Engine

The [Folksonomy Engine](https://wiki.openfoodfacts.org/Folksonomy_Engine) allows for the addition of various new, individual data properties to products across Open Food Facts and Open Products Facts.

  * **Taxonomies**: Retrieve hierarchical data for various categories like:
      * Packagings, Packaging Shapes, Packaging Materials, Packaging Recycling.
      * NOVA groups (food processing levels).
      * Categories, Additives, Allergens, Countries, Ingredients, Labels, Languages, Origins.

-----

## Contributing Data

To contribute data that modifies or adds to the database, user authentication is required. You can either:

1.  **Let your users log in/create accounts** (Recommended).
2.  **Create a global user** for your app through which all requests are made.

The SDK represents a user as a `User` object, requiring a `userId` and `password`. You should securely store user credentials.

For a user to be considered for contributions, you must set `OpenFoodAPIConfiguration.globalUser` at some point in your app's lifecycle:

```dart
OpenFoodAPIConfiguration.globalUser = User(
  userId: 'myUsername',
  password: 'myPassword',
);
```

-----

## Open Data License

The Open\*Facts databases are licensed under the Open Database License (OdBL). This requires attributing the source and contributing back any additions (photos, data), which this package facilitates.

-----

## Useful Resources

  * **API Documentation Issues**: [github.com/openfoodfacts/api-documentation/issues](https://github.com/openfoodfacts/api-documentation/issues)
  * **SDK Documentation**: [pub.dev/documentation/openfoodfacts/latest/index.html](https://pub.dev/documentation/openfoodfacts/latest/index.html)
  * **Open Food Facts Slack**: [openfoodfacts.slack.com](https://openfoodfacts.slack.com)

-----

## Contribute to the Package

If you find a bug or missing features in this package, please open an issue:

  * **Issue Tracker**: [github.com/openfoodfacts/openfoodfacts-dart/issues](https://github.com/openfoodfacts/openfoodfacts-dart/issues)
  * **Source Code**: [github.com/openfoodfacts/openfoodfacts-dart](https://github.com/openfoodfacts/openfoodfacts-dart)

-----

## Support

For issues beyond the scope of this package, contact Open Food Facts on [Slack](https://openfoodfacts.slack.com) or via email at `contact@openfoodfacts.org`.

-----

### Testing

To run the tests, execute the following command from the root of the repository:

```shell
dart test
```

-----

## Applications Using This SDK

### Official Application

  * **Open Food Facts (Codename Smoothie)**: The official app, available on [Android](https://play.google.com/store/apps/details?id=org.openfoodfacts.scanner) and [iOS](https://apps.apple.com/app/open-food-facts/id588797948). Its source code is also on [GitHub](https://github.com/openfoodfacts/smooth-app).

### Third-Party Applications

  * **Glutten Scan**: Available on [Android](https://play.google.com/store/apps/details?id=com.healthyfood.gluten_free_app) and [iOS](https://apps.apple.com/ch/app/gluten-scanner/id1540660083).
  * **Halal & Healthy**: Available on [Android](https://play.google.com/store/apps/details?id=com.TagIn.Tech.handh) and [iOS](https://apps.apple.com/ch/app/halal-healthy/id1603051382).
  * **Fitness Tracker**: Available on [Android](https://play.google.com/store/apps/details?id=dk.cepk.fitness_tracker).
  * [All public repositories using this package](https://github.com/openfoodfacts/openfoodfacts-dart/network/dependents).

-----
