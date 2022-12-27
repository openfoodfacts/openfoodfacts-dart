# Open Food Facts - Dart

![Pub Version](https://img.shields.io/pub/v/openfoodfacts?&colorB=green)
[![Run sdk tests](https://github.com/openfoodfacts/openfoodfacts-dart/actions/workflows/test-sdk.yml/badge.svg)](https://github.com/openfoodfacts/openfoodfacts-dart/actions/workflows/test-sdk.yml)
[![likes](https://img.shields.io/pub/likes/openfoodfacts?logo=dart)](https://pub.dev/packages/openfoodfacts/score)
[![popularity](https://img.shields.io/pub/popularity/openfoodfacts?logo=dart)](https://pub.dev/packages/openfoodfacts/score)
[![pub points](https://img.shields.io/pub/points/openfoodfacts?logo=dart)](https://pub.dev/packages/openfoodfacts/score)

Dart package for the [Open Food Facts](https://world.openfoodfacts.org/) API. Free and Easy access to more than 2.7 million food products information from all around the world.
Open Food Facts is powered by contributors from around the world and is constantly growing thanks to them.

## General principles

- You can query all sorts of information about products, including many useful computed values.
- If you can't get the information on a specific product, you can get your user to send photos and data, that will then be processed by Open Food Facts AI and contributors to get the computed result you want to show them.
- This package also allows to enter and edit the full span of information to allow your users to get immediate results.

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

All possible configurations can be found [here](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_utils_open_food_api_configuration/OpenFoodAPIConfiguration-class.html)

### Features

Code examples for the following tasks:

- Reading data:
  - [Querying a product](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getProductV3.html)
  - [Recommended Daily Intakes](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_model_recommended_daily_intake/RecommendedDailyIntake-class.html)
  - Search for products
    - [By name](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/searchProducts.html)
    - [By brand, stores, ingredients,](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/searchProducts.html) [All filter](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_model_parameter_tag_filter/TagFilterType.html)
    - [By category](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/searchProducts.html) ([Pnns2](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_utils_pnns_groups/PnnsGroup2.html))
    - [By vegan, vegetarian or/and palm oil status](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/searchProducts.html)
    <!-- TODO: Add detailed description for Personalized search -->
  - [Autocompletion for user inputs](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getAutocompletedSuggestions.html), by giving suggestions for (Labels, categories, ingredients, additives, traces and other [TagType's](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_utils_tag_type/TagType.html))
  - [Get the nutrient hierarchy specific to a country, localized](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/getOrderedNutrients.html)
- Image recognition
  - [extract Ingredients](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/extractIngredients.html)
  - [extract Packaging](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/extractPackaging.html)
- Writing data
  - [Managing user accounts guide (Read this first)](#handle-open-food-facts-accounts)
    - [Let your users login](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/login2.html)
    - [Let your users register on open food facts](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/register.html)
    - [Reset user password](https://openfoodfacts.github.io/openfoodfacts-dart/file-___home_runner_work_openfoodfacts-dart_openfoodfacts-dart_lib_src_open_food_api_client/OpenFoodAPIClient/resetPassword.html)
  - Save product to Open Food Facts
  - Send images
  - Anonymous photo upload
  - Photo operations (rotate, crop, select, unselect with language awareness)
  - Robotoff support
  - Folksonomy Engine (custom properties for products)

## Contributing

### Handle open food facts accounts

Some queries which modify or enter data need a user account to validate this request.
There are multiple ways to handle user accounts:

1. Let your users login / create open food facts user accounts (Recommended)
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

## Open Data Licence

The database in under the OdBL. This means attributing the source and also contributing back any additions (photos, data), which this package makes easy to do.
You can check the terms of use here : [Terms of use](https://world.openfoodfacts.org/terms-of-use).

## List of current features

## Roadmap

- List of new APIs to implement: <https://github.com/openfoodfacts/api-documentation/issues>
- New OpenAPI documentation: <https://openfoodfacts.github.io/openfoodfacts-server/reference/api/>

## Contribute

There are many ways to contribute, and Open Food Facts has a lot of projects beside this package.
Most of our operations are coordinated through our Slack which you can join here : [Open Food Facts Slack](https://openfoodfacts.slack.com).

Regarding this package, we accept pull requests as well feature requests.

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

- Alexander Schacht - [Grumpf86](https://github.com/Grumpf86)
- Primaël Quémerais - [Reefind](https://gitlab.com/Reefind)
- Marcus Cantu - [Cantum2](https://github.com/Cantum2)
- Adrien Faure - [Adfaure](https://github.com/adfaure)
- Peter Tran-Jørgensen - [peterwvj](https://github.com/peterwvj)
- Mohamed Boussaid - [MohamedFBoussaid](https://github.com/MohamedFBoussaid)
