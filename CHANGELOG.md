## [1.3.8] - 22.10.2021
- More updates to KnowledgePanel APIs
## [0.4.0](https://www.github.com/openfoodfacts/openfoodfacts-dart/compare/v0.3.15...v0.4.0) (2021-10-22)


### Features

* add agribalyse score to EcoscoreData ([#160](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/160)) ([4565f73](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/4565f73184bfbdcf3bc8f7117d840c9a9c698453))
* add ecoscoreData.missingDataWarning field support ([e1ccb26](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/e1ccb26fcc9d1cbd82d146de48f6fed4ec1929f2))


### Bug Fixes

* add carbohydratesUnit and fatUnit in the Nutriments class ([8020b38](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/8020b38a8800e8b9fd1d0229131715061e621641))
* address path warning in example/pubspec.yaml ([1a8e415](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/1a8e415bd895f595f500e4388301345c85e3091f))
* clean up imports ([41af6dd](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/41af6ddc375bf3df05a5a99313b3124c016db59b))
* failing test ([b256809](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/b256809fa93564b53a622fa973479fd1520f6a8c))
* improve error messages when saving products ([e5f766d](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/e5f766d1808bf96d369e626c261d3e8a4115c750)), closes [#247](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/247)
* make tests pass ([695c4cd](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/695c4cd27d8b50a883075812bb5f13730915dc4b))
* no user is required when searching products ([136c7ed](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/136c7ed5d26f713c70ba2f4f8fcbbd0eef5dd3ab))
* Nutriments JSON conversion bug related to micro gram unit ([#267](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/267)) ([9123647](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/9123647115e6a4df7fffbeeb697c204315e06ff7)), closes [#265](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/265)
* relax and correct test assertions ([#266](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/266)) ([bde86da](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/bde86da2ef2cb3229cb48c097994842a300e2e37))
* remove unused dependency, async_loader ([08d2d75](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/08d2d75d63f508e86cf56af7804b92658f4913e7))
* test assertions ([ea9ef50](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/ea9ef5032edca135b36284604664f13be9848e9b))
* test instructions ([6a339c9](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/6a339c9c790bce40bb8e9b545e4b201805c78910))
* tweak handling of status codes based on PR feedback ([0324b91](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/0324b916e5ecd7b06b0532599f2eed3ac61c3212))
* update expected test results. ([79714c3](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/79714c32e4c60a1d6f8c52deeec0c41b5288fa1c)), closes [#146](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/146)
* write API for nutrient units ([3339810](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/3339810b43e3adcc76e27ffc444e3ee0fe144e40)), closes [#224](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/224)

## [1.3.7] - 12.10.2021
- Update KnowledgePanel API to comply to the latest Backend changes.
## [1.3.6] - 10.10.2021
- Fix issue with `Nutriments` JSON conversion related to microgram units
- Support password reset
- Add `page`, `pageSize` and `sortOption` in `ProductListQueryConfiguration`
## [1.3.5] - 26.09.2021
- Improve wrong username/password error messages in `Status`
## [1.3.4] - 24.09.2021
- Add ability to check whether a product attribute is marked as important in user's personal preferences
## [1.3.3] - 16.09.2021
- Add ability to request the `product_name_languages` and `ingredients_text_languages` fields
- Introduce `OpenFoodAPISettings` to improve API configuration support
- Allow user agent to be passed via HTTP header
- Added `getProductImprovements` to the product model
- Add missing `carbohydratesUnit` and `fatUnit` fields in the `Nutriements` class
- Fix alchohol tags in the `Nutriments` class
- Fix write API for nutrient fields
## [1.3.2] - 25.07.2021
- Fixed completely toJson and fromJson for the fields in multiple languages
## [1.3.1] - 22.07.2021
- Fixed toJson and fromJson for the fields in multiple languages
## [1.3.0] - 21.07.2021
- Added explicit parameter WithoutAdditives to replace ContainsAdditives (deprecated)
- Added new InvalidBarcodes class
- Simplified product search tests
- Added several nutrients
- Added ability to request and set multiple translated product fields at once (breaking change)
- Added support for product list queries
- Added PnnsGroup2 filter to ProductSearchQueryConfiguration, deprecated PnnsGroupQueryConfiguration
- Deprecated useless parameters OutputFormat and SearchSimple
- Added new feature to get the Ecoscore description in HTML
- Added comments to several classes and methods

## [1.2.0] - 08.07.2021
- `product_name_de`, `productNameEN`, ... are now deprecated. Use `productNameTranslated` instead
- Added the `agribalyse` field in `EcoscoreData`
- Added support for the `missing_data_warning` field, to inform users that the ecoscore may be improved
- Added support for user management
- Added [dart-doc documentation](https://openfoodfacts.github.io/openfoodfacts-dart/)
- Added suggestion for states, languages, labels, categories and more.

## [1.1.0-beta] - 30.03.2021
- Renamed SendImage imageUrl parameter to imageUri as it is an Uri (breaking change)
- New product preferences and matching classes for personalized search (thanks to monsieurtanuki)
- Added missing values for IngredientsAnalysisTags, and renamed some values to match API names (breaking change)
- Fixed image upload and added PACKAGING image type

## [1.0.2-beta] - 11.03.2021
- Added support for new fields (images URLs, vegan/vegetarian/from palm oil ingredients, categories, labels and packaging)
- Fixed test mode for addProductImage

## [1.0.1-beta] - 08.03.2021
- API method for searching products does not require a user being passed

## [1.0.0-beta] - 07.03.2021
- Migrated SDK to null safety
- Updated test instructions in README.md
- Improved Github Action validation

## [0.3.15+3] - 01.03.2021
- Greatly improved code quality and readability

## [0.3.15+2] - 08.02.2021
- fix additional issue with EcoScoreData JSON generation
- use Github action to test changes
- fix test output (avoid chatty tests)
- add support for OCR ingredients

## [0.3.15+1] - 04.02.2021
- fix issue with images URLs

## [0.3.15] - 04.02.2021
- Refactored tests to use the Open Food Facts test database (thanks to Mohamed Boussaid)
- Added packaging image type
- Allow setting the country code cc field
- Added countries and countries tags to Product (thanks to Mohamed Boussaid)
- Allow anonymous photo upload
- Fixed product JSON generation for Eco-Score data (thanks to Peter Tran-Jørgensen)

## [0.3.14+1] - 07.01.2021
- Refactored Attribute & AttributeGroup
- Removed ProductFields.ECOSCORE_ALPHA as deprecated

## [0.3.14] - 01.01.2021
- Added support for Ecoscore (thanks to Frédéric Julian)

## [0.3.13+2] - 2.12.2020
- nullable product name hotfix

## [0.3.13+1] - 24.11.2020
- product upload hotfix

## [0.3.13] - 20.11.2020
- Extended micronutrients support (thanks to Ilia (Elliot) Tikhomirov)
- product attribute: lastModified

## [0.3.12+2] - 26.10.2020
- Fixed save product. NULL values won't be sent.

## [0.3.12+1] - 27.09.2020
- Fixed image upload

## [0.3.12] - 27.09.2020
- Added AttributeGroups

## [0.3.11+1] - 19.09.2020
- Fixed SearchResult

## [0.3.11] - 19.09.2020
- Added userPreferences
- Product image upload fixed (Thanks to Peter Tran-Jørgensen)

## [0.3.10] - 02.08.2020
- Added energyKcal and energyKcal100g

## [0.3.9] - 30.07.2020
- Added EnvironmentImpactLevels
- Rewrote NutrientLevels

## [0.3.8] - 27.07.2020
- Fixed typos in PnnsGroup2 ids

## [0.3.7] - 17.07.2020
- Added allergens
- Introduced PNNS groups and PnnsGroup2 queries

## [0.3.6] - 12.07.2020
- fixed Json product generation (additives, selectedImages)

## [0.3.5] - 28.06.2020
- fixed servingQuantity issue introduced in 0.3.4

## [0.3.4] - 25.06.2020
- selectedImages toJson implementation
- codebase improvements

## [0.3.3] - 25.06.2020
- ingredient percentage parsing fixed

## [0.3.2] - 19.05.2020
- dart:ui - dependencies removed
- search result decoding and parsing errors fixed

## [0.3.1] - 30.04.2020
- Added documentation form version 0.3.0
- Updated README.md

## [0.3.0] - 30.04.2020
- Support for more than 180 languages
- New query / search principle - _ProductQueryConfiguration_ : 
In order to optimize the queries you can now set the return language and fields list through _ProductQueryConfiguration_ (Default Behaviour)
- _getProductRaw()_ is still available (Old Behaviour)

## [0.2.1] - 14.04.2020
- expose robotoff and helper classes

## [0.2.0] - 13.04.2020
- added robotoff support, new service methods:
  *getProductInsights()*,
  *getRobotoffQuestionsForProduct()*,
  *getRandomRobotoffQuestion()*,
  *postInsightAnnotation()*,
  *getIngredientSpellingCorrection()*,
- added images field
- added documentation.md

## [0.1.16] - 05.03.2020
- added brandsTags to get brands as a list

## [0.1.15] - 24.02.2020
- added serving size and nutriment serving sizes

## [0.1.14] - 25.01.2020
- search products by tags
- search products with / without additives
- search products with keywords

## [0.1.13] - 24.11.2019
- added support for Spanish

## [0.1.12] - 18.11.2019
- nutrient levels added

## [0.1.11] - 9.10.2019
- additives management implemented
- added Nutriscore to product
- bugfix: ingredientText language dependent

## [0.1.10] - 5.10.2019
- nutriments management implemented

## [0.1.9] - 21.09.2019
- get product image by field, size and language

## [0.1.8] - 13.09.2019
- http: 0.12.0

## [0.1.7] - 13.09.2019
- Bugfix: search result page - json parse error fixed (string vs. int)
- json_annotation: 3.0.0
- build_runner: 1.6.9
- json_serializable: 3.2.2

## [0.1.6] - 06.06.2019
- Bugfix: ingredients percent json parse error fixed (string vs. int)

## [0.1.5] - 28.05.2019
- *getProduct()* fixed null-pointer for non existing product. 
- *searchProducts()* english URL now working. (-> world)

## [0.1.4] - 19.05.2019
- *getProduct()* chooses a language dependent host (world, de, ..)
- Bugfix: *getProduct()* won't fail if no images are provided 

## [0.1.3] - 5.05.2019
- *searchProducts()* with language support

## [0.1.2] - 5.05.2019
- Ingredients.dart more type safe (THX to dynamic) 

## [0.1.1] - 5.05.2019
- class SearchResult now visible

## [0.1.0] - 4.05.2019.
- service method *searchProducts()* implemented. 

## [0.0.10] - 28.03.2019
the test package dependency has been moved to flutter_test.

## [0.0.9] - 16.03.2019.
dependency version upgrade to:
- json_annotation: 2.0.0
- build_runner: 1.2.6
- json_serializable: 2.0.2

## [0.0.8] - 16.11.2018.
- getProduct() provides ingredients and images for a given language.
- getProductRaw() provides *all* data fields without preparation.

## [0.0.6] - 27.10.2018.
- set dependency versions as range

## [0.0.5] - 25.10.2018.
- upgrade of http 0.12.0
- upgrade of build_runner 1.0.0

## [0.0.4] - 16.10.2018.
- class *Image* changed to *ProductImage* for a easier namespace resolving.

## [0.0.3] - 12.10.2018.
- model of selected product images changed.

## [0.0.2] - 3.10.2018.

- Service *saveProduct()* can handle to add and to edit a product.
- Added traces to a product

## [0.0.1] - 18.09.2018.

initial version with these API services:
- add a new product
- add a new product image
- get an existing product
