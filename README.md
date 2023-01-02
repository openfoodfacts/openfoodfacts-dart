<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://static.openfoodfacts.org/images/logos/off-logo-horizontal-dark.png?refresh_github_cache=1">
  <source media="(prefers-color-scheme: light)" srcset="https://static.openfoodfacts.org/images/logos/off-logo-horizontal-light.png?refresh_github_cache=1">
  <img height="48" src="https://static.openfoodfacts.org/images/logos/off-logo-horizontal-light.svg">
</picture>

# Open Food Facts - Dart

![Pub Version](https://img.shields.io/pub/v/openfoodfacts?&colorB=green)
[![Run sdk tests](https://github.com/openfoodfacts/openfoodfacts-dart/actions/workflows/test-sdk.yml/badge.svg)](https://github.com/openfoodfacts/openfoodfacts-dart/actions/workflows/test-sdk.yml)
[![likes](https://img.shields.io/pub/likes/openfoodfacts?logo=dart)](https://pub.dev/packages/openfoodfacts/score)
[![popularity](https://img.shields.io/pub/popularity/openfoodfacts?logo=dart)](https://pub.dev/packages/openfoodfacts/score)
[![pub points](https://img.shields.io/pub/points/openfoodfacts?logo=dart)](https://pub.dev/packages/openfoodfacts/score)

Dart package for the [Open Food Facts](https://world.openfoodfacts.org/) API. Free and Easy access to more than 2.7 million food products information from all around the world.
Open Food Facts is powered by contributors from around the world and is constantly growing thanks to them.

## General principles, how does it work ?

We use the ability of the Open Food Facts API to return products results in Json, we then generate easily understandable objects structures to make it simple for you to use.

This plugin also allows you to edit a product or upload a new one to Open Food Facts. Using the same simple product structure you can create a product object or edit an existing one and send it to the API using a single function.

## Migrating from 1.x.x to 2.x.x (breaking changes)

- Now the only entry point is `import 'package:openfoodfacts/openfoodfacts.dart';`
  - replace all your instances of `import 'package:openfoodfacts/...';` with a single `import 'package:openfoodfacts/openfoodfacts.dart';`
- If you used `State` from `product_state.dart`, you have to rename it to `ProductState`
- If you used `Level` from `nutrient_levels.dart`, you have to rename it to `NutrientLevel`
- Removed deprecated classes:
  - `Page`
  - `ProductListQueryConfiguration`
  - `ToBeCompletedConfiguration`
- Removed deprecated fields and methods in `Nutriments`
  - _all_ the single nutrient value _fields_ were removed - use `getValue` and `setValue` instead
  - instead of `getUnit` use `nutrient.typicalUnit`

## Usage

### Installation

Follow the installing instructions on [pub.dev](https://pub.dev/packages/openfoodfacts/install).

### How to authenticate

For most queries no authentication is required! :)
Though we recommend to set a User-Agent to not to be blocked by mistake.

### Setup (Optional)

At the beginning of the app you can define some global settings so that they don't need to be specified in each query. You can override these static values at any time in the app lifecycle.

```dart
import 'package:openfoodfacts/openfoodfacts.dart';

OpenFoodAPIConfiguration.userAgent = UserAgent(name: 'Your app name', url: 'Your url, if applicable');

OpenFoodAPIConfiguration.globalLanguages = <OpenFoodFactsLanguage>[
  OpenFoodFactsLanguage.ENGLISH
];

OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
```

All possible configurations can be found [here](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_utils_open_food_api_configuration/OpenFoodAPIConfiguration-class.html).

### Features

Code examples for the following tasks:

#### Reading data

- [Querying a product](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getProductV3.html)
- [Recommended Daily Intakes](https://pub.dev/documentation/openfoodfacts/latest/openfoodfacts/RecommendedDailyIntake/getRecommendedDailyIntakes.html)
- Search for products
  - [By name](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/searchProducts.html)
  - [By brand, stores, ingredients,](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/searchProducts.html) [All filter](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_model_parameter_tag_filter/TagFilterType.html)
  - [By category](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/searchProducts.html) ([Pnns2](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_utils_pnns_groups/PnnsGroup2.html))
  - [By vegan, vegetarian or/and palm oil status](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/searchProducts.html)
    <!-- TODO: Add detailed description for Personalized search -->
- [Autocompletion for user inputs](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getAutocompletedSuggestions.html), by giving suggestions for (Labels, categories, ingredients, additives, traces and other [TagType's](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_utils_tag_type/TagType.html))
- [Get the nutrient hierarchy specific to a country, localized](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getOrderedNutrients.html)
- [Get product freshness](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getProductFreshness.html)
- [Notes on advanced languages mechanics](https://github.com/openfoodfacts/openfoodfacts-dart/blob/master/DOCUMENTATION.md#notes-on-languages-mechanics)

#### Writing data

- [Managing user accounts guide (Read this first)](#handle-open-food-facts-accounts)
  - [Let your users login](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/login2.html)
  - [Let your users register on Open Food Facts](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/register.html)
  - [Reset user password](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/resetPassword.html)
  - [Get contribution data about a user](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_utils_user_product_search_query_configuration/UserProductSearchQueryConfiguration-class.html)
- [Save product to Open Food Facts (edit or add)](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/saveProduct.html)
- Images
  - [Send images](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/addProductImage.html)
  - [rotate](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/setProductImageAngle.html)
  - [crop](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/setProductImageCrop.html)
  - select, unselect with language awareness
  - [extract Ingredients](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/extractIngredients.html)
  - [extract Packaging](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/extractPackaging.html)

#### Robotoff support

[Robotoff](https://openfoodfacts.github.io/robotoff/) it the Open Food Facts AI which analyze every new pictures to extract new data.

- get Insights
  - [random](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getRandomInsight.html)
  - [for a product](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getProductInsights.html)
- get Questions to confirm
  - [random](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getRandomRobotoffQuestion.html)
  - [for a product](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getRobotoffQuestionsForProduct.html)
- [post Insight Annotation](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/postInsightAnnotation.html)

#### Folksonomy Engine

[Folksonomy](https://wiki.openfoodfacts.org/Folksonomy_Engine) is adding several kinds of new individual data properties to Open Food Facts or Open Products Facts.

- [get Taxonomy Packagings](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getTaxonomyPackagings.html)
- [get Taxonomy Packaging Shapes](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getTaxonomyPackagingShapes.html)
- [get Taxonomy Packaging Materials](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getTaxonomyPackagingMaterials.html)
- [get Taxonomy Packaging Recycling](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getTaxonomyPackagingRecycling.html)
- [get Taxonomy Nova](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getTaxonomyNova.html)
- [get Taxonomy Categories](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getTaxonomyCategories.html)
- [get Taxonomy Additives](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getTaxonomyAdditives.html)
- [get Taxonomy Allergens](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getTaxonomyAllergens.html)
- [get Taxonomy Countries](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getTaxonomyCountries.html)
- [get Taxonomy Ingredients](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getTaxonomyLabels.html)
- [get Taxonomy Labels](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getTaxonomyLabels.html)
- [get Taxonomy Languages](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getTaxonomyLanguages.html)
- [get Taxonomy Origins](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getTaxonomyOrigins.html)
- [get general Taxonomy](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getTaxonomy.html)
- [get taxonomy translation uri](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getTaxonomyTranslationUri.html)

## Contributing data

### Handle Open Food Facts accounts

Some queries which modify or enter data need a user account to validate this request.
There are multiple ways to handle user accounts:

1. Let your users login / create Open Food Facts user accounts (Recommended)
2. Create a global user for your app through which all requests run

Currently there is no OAuth workflow, therefor a user is just a [User](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_model_user/User-class.html) object in this package.
So you need to get the username as well as the password from the users and store it somewhere save. For Flutter apps we recommend using the [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) package

For the user to be taken into account you have mount a global user at one point in your app lifecycle:

```dart
  OpenFoodAPIConfiguration.globalUser = User(
    userId: 'myUsername',
    password: 'myPassword',
  );
```

Regardless if you are using a global app or accounts per user. After mounting this, the user will be added to queries where the user can be attributed.

Some methods in [OpenFoodAPIClient](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient-class.html) require to pass a `User`, there you can access the before mounted user with:

```dart
 OpenFoodAPIClient.thisNeedsAnUser(
  user: OpenFoodAPIConfiguration.globalUser,
  ...
 );
```

Further examples:

- [Create users](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/register.html)
- [Check if the user credentials are correct](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/login2.html)
- [Request a password reset email](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/resetPassword.html)

### If your users do not expect a specific result immediately (eg. Inventory apps)

- Send photos (front/nutrition/ingredients/packaging): most painless thing for your users
- The Open Food Facts AI Robotoff will generate some derived data from the photos
- Overtime, other apps, and the Open Food Facts community will fill the data gaps

### If your users do expect a result immediately (eg Nutrition apps, Scoring apps…)

- Send nutrition facts + category > get the Nutri-Score
- Send ingredients > get the NOVA group (about food ultra-processing), additives, allergens, normalized ingredients, vegan, vegetarian…
- Send category (strict minimum) + labels + origins of ingredients + packaging (photo and text) > get the Eco-Score (about environmental impact)

## Open Data License

The database in under the OdBL. This means attributing the source and also contributing back any additions (photos, data), which this package makes easy to do.
You can check the terms of use here : [Terms of use](https://world.openfoodfacts.org/terms-of-use).

## Useful recourses

- List of new APIs to implement: <https://github.com/openfoodfacts/api-documentation/issues>
- New OpenAPI documentation: <https://openfoodfacts.github.io/openfoodfacts-server/reference/api/>
- Most of our operations are coordinated through our Slack which you can join here : [Open Food Facts Slack](https://openfoodfacts.slack.com).

## Contribute to the package

If found a bug or missing features in this package, please open an issue for it.

- Issue Tracker: github.com/openfoodfacts/openfoodfacts-dart/issues
- Source Code: github.com/openfoodfacts/openfoodfacts-dart

## Support

If you are having issues, that go beyond the scope of this package, please write to us on [Slack](https://openfoodfacts.slack.com) or send us an email at contact@openfoodfacts.org

### Testing

Execute the following command from the root of the repository to run the tests:

``` shell
dart test
```

## Applications using this SDK

### Official application

**Smoothie** is the official developed by Open Food Facts, which will soon be released on Android and iOS. The source code is also available on [GitHub](https://github.com/openfoodfacts/smooth-app).

### Third party applications

Feel free to open a PR to add your application in this list.

- **Glutten Scan**. [Android](https://play.google.com/store/apps/details?id=com.healthyfood.gluten_free_app) / [iOS](https://apps.apple.com/ch/app/gluten-scanner/id1540660083)
- **Halal & Healthy**. [Android](https://play.google.com/store/apps/details?id=com.TagIn.Tech.handh) / [iOS](https://apps.apple.com/ch/app/halal-healthy/id1603051382)
- **Fitness Tracker**. [Android](https://play.google.com/store/apps/details?id=dk.cepk.fitness_tracker)
- [All public repositories using this package](https://github.com/openfoodfacts/openfoodfacts-dart/network/dependents)
  
## Authors

Thanks to [Alexander Schacht](https://github.com/Grumpf86) and [Primaël Quémerais](https://github.com/PrimaelQuemerais) for the initial creation of this package.

## Contributors

[![Drag Racing](https://contrib.rocks/image?repo=openfoodfacts/openfoodfacts-dart)](https://github.com/openfoodfacts/openfoodfacts-dart/graphs/contributors)
