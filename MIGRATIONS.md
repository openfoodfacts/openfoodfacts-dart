## Migrating from 2.x.x to 3.x.x (breaking changes)

- Starting with version 3.0.0, we now enforce all clients to provide a valid user agent.
For this, please ensure to set the SDK before using any other functionality:

```dart
OpenFoodAPIConfiguration.userAgent = UserAgent(
  name: '<Name of your app>',
);
```

- `QueryType` has been deleted. Now, for API calls you have to provide a `UriProductHelper` parameter. By default it will point you to openfoodfacts/prod.

- For `RobotoffAPIClient.getRandomInsights` and `RobotoffAPIClient.getQuestions`, a list of countries instead of a single country as parameter.

- Use `OpenFoodFactsCountry.fromOffTag` instead of `CountryHelper.fromJson`.

- `OpenFoodAPIClient.getOrderedNutrients` now uses a `OpenFoodFactsCountry` parameter instead of a 2-letter country code.

- Methods `getProductImageRootUrl` and `getBarcodeSubPath` are moved to `UriProductHelper` from `ImageHelper`

- Method `buildUrl` renamed as `getLocalizedProductImageUrl` in `ImageHelper`

- Removal of deprecated code.

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
