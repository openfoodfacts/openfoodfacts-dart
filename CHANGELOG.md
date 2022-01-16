### [1.9.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.9.0...v1.9.1) (2022-01-08)


### Bug Fixes

* [#357](https://github.com/openfoodfacts/openfoodfacts-dart/issues/357) - all `Unit`s are now correctly saved ([#358](https://github.com/openfoodfacts/openfoodfacts-dart/issues/358)) ([9eb2872](https://github.com/openfoodfacts/openfoodfacts-dart/commit/9eb2872b0754c193b0c07f66f2da0331e4ffc23b))


### [1.11.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.11.0...v1.11.1) (2022-01-16)


### Bug Fixes

* Rename enum so it doesn't conflict with Size class from geometry.dart ([#366](https://github.com/openfoodfacts/openfoodfacts-dart/issues/366)) ([527b2e7](https://github.com/openfoodfacts/openfoodfacts-dart/commit/527b2e7ea484839ccfc9bb6ffc812b3d966e0924))

## [1.11.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.10.0...v1.11.0) (2022-01-15)


### Features

* KP: Parse Size from server response ([#364](https://github.com/openfoodfacts/openfoodfacts-dart/issues/364)) ([3d402b7](https://github.com/openfoodfacts/openfoodfacts-dart/commit/3d402b7d93e310ae8b31dd18b02b98db695dc9a1))

## [1.10.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.9.1...v1.10.0) (2022-01-13)


### Features

* new method "getOrderedNutrientsJsonString" ([#362](https://github.com/openfoodfacts/openfoodfacts-dart/issues/362)) ([516ccfa](https://github.com/openfoodfacts/openfoodfacts-dart/commit/516ccfa40063aa4d15d1e032438ea1073c945de6))

## [1.9.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.8.1...v1.9.0) (2022-01-07)


### Features

* [#350](https://github.com/openfoodfacts/openfoodfacts-dart/issues/350) - new method getProductFreshness ([#351](https://github.com/openfoodfacts/openfoodfacts-dart/issues/351)) ([979c6af](https://github.com/openfoodfacts/openfoodfacts-dart/commit/979c6afca50aecfe58d0094f9873926dd0ce1fde))


### [1.8.1](https://www.github.com/openfoodfacts/openfoodfacts-dart/compare/v1.8.0...v1.8.1) (2021-12-28)


### Bug Fixes

* Lowercased country code ([#343](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/343)) ([bdf6451](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/bdf645197a81e40c357bd126e09986d195f96e05))


## [1.8.0](https://www.github.com/openfoodfacts/openfoodfacts-dart/compare/v1.7.0...v1.8.0) (2021-12-20)


### Features

* Initial support for Folksonomy Engine (Beta) ([#332](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/332)) ([f7b254e](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/f7b254e80a339c37ce85a1ad7d9f8bc9978be9d8))
* Added globalUser to OpenFoodAPIConfiguration ([#329](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/329)) ([e246d9e](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/e246d9ea34bc271bd0f6a5a507b3b44c4e492cc1))


### Bug Fixes

* Added missing product fields to ProductField enum ([#331](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/331)) ([4bbd66c](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/4bbd66c4d5b1b6e9be460029598125e0e519e2f1))
* Don't pass country code if it's null ([#324](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/324)) ([5f9447c](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/5f9447c474e1a8a5ea9dc18233b2df8374c7bd6c))

## [1.7.0](https://www.github.com/openfoodfacts/openfoodfacts-dart/compare/v1.6.0...v1.7.0) (2021-12-15)


### Features

* [#306](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/306) - unselect product image, added "user" parameter to WRITE methods ([#319](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/319)) ([1c82e33](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/1c82e33a313afd3c4908cf95f96d58f7f738ca1e))



## [1.6.0](https://www.github.com/openfoodfacts/openfoodfacts-dart/compare/v1.5.0...v1.6.0) (2021-12-14)


### Features

* [#307](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/307) - added 21 enum values for advanced search parameters ([#313](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/313)) ([55f3fa5](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/55f3fa583a535ec842db87067019ed2933f75a78))
* Allow to get OpenFoodFactsCountry from countryCode ([#314](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/314)) ([8b6c9bc](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/8b6c9bc956b716fea16ffc198f62421973665caf))


### Bug Fixes

* Parsing of Grade Json field ([#311](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/311)) ([2da4d27](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/2da4d276d5e94d3a1d92a35105d8d1c4a287709c))

## [1.5.0](https://www.github.com/openfoodfacts/openfoodfacts-dart/compare/v1.4.0...v1.5.0) (2021-12-09)

### Features

* [#301](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/301) - new method getProductUri ([#302](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/302)) ([85169f0](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/85169f083ad7bc1c83c67e817de32a942700eb92))
* [#304](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/304) - new method setProductImageAngle and setProductImageCrop ([#309](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/309)) ([c69f3f6](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/c69f3f639f47291a007185c59c89b652bbf52098))


## [1.4.0](https://www.github.com/openfoodfacts/openfoodfacts-dart/compare/v1.3.9...v1.4.0) (2021-11-19)

### Features

* [#233](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/233) - new class OpenFoodFactsCountry, clearer than "cc" ([#292](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/292)) ([3dda3f4](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/3dda3f46e290c71bb6cb23e553163d62ea9159fb))

### [1.3.9](https://www.github.com/openfoodfacts/openfoodfacts-dart/compare/v1.3.8...v1.3.9) (2021-11-17)

### Features

* Add a taxonomy API for labels ([#277](https://github.com/openfoodfacts/openfoodfacts-dart/pull/277)) 
* Add additives, countries, and languages taxonomy APIs ([#278](https://github.com/openfoodfacts/openfoodfacts-dart/pull/278)) 
* Add queries to get the roots from the server ([#287](https://github.com/openfoodfacts/openfoodfacts-dart/pull/287)) 
* Add support for the new "Image Refresh" API ([#289](https://github.com/openfoodfacts/openfoodfacts-dart/pull/289)) 
* Add nutrient order and list ([#272](https://github.com/openfoodfacts/openfoodfacts-dart/pull/272)) 
* Added eco-score and nutri-score categories (ProductImprovement) ([#191](https://github.com/openfoodfacts/openfoodfacts-dart/pull/191)) 

### Bug Fixes

* Update to latest KnowledgePanel API changes  ([#294](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/294)) ([5163db5](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/5163db593f89631e922c3c2085809ef60b3a42d9))
* Add additives, countries, and languages taxonomy APIs ([#274](https://github.com/openfoodfacts/openfoodfacts-dart/pull/274)) 
* Allow to send deviceId to InsightAnnotations API and allow anonymous user ([#286](https://github.com/openfoodfacts/openfoodfacts-dart/pull/286))  

## [1.3.8] - 22.10.2021
- More updates to KnowledgePanel APIs
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
