# Changelog

## [1.16.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.15.0...v1.16.0) (2022-04-23)


### Features

* Expose to Attribute related Knowledge-panel panelID ([#456](https://github.com/openfoodfacts/openfoodfacts-dart/issues/456)) ([f49a94c](https://github.com/openfoodfacts/openfoodfacts-dart/commit/f49a94c3c495c13c30f0eddce4260915bae1380c))

## [1.15.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.14.0...v1.15.0) (2022-04-19)


### Features

* Barcodes validation for EAN8 & EAN13 ([#444](https://github.com/openfoodfacts/openfoodfacts-dart/issues/444)) ([0d3ac02](https://github.com/openfoodfacts/openfoodfacts-dart/commit/0d3ac02a1c38a0f46f78ed4facd20a93ac70bf80))
* README.md with a list of known apps using the SDK ([#435](https://github.com/openfoodfacts/openfoodfacts-dart/issues/435)) ([c25dece](https://github.com/openfoodfacts/openfoodfacts-dart/commit/c25dece238e2cfdb36cba54b998ac3da259297f3))
* Support for Product - No nutrition data field ([#423](https://github.com/openfoodfacts/openfoodfacts-dart/issues/423)) ([c6ace40](https://github.com/openfoodfacts/openfoodfacts-dart/commit/c6ace40ebd216ce5029c41831ac8dde3dad38777))
* Username max length ([#442](https://github.com/openfoodfacts/openfoodfacts-dart/issues/442)) ([14eaec0](https://github.com/openfoodfacts/openfoodfacts-dart/commit/14eaec0f5fa7799095cdb749a845f7f17b897e23))


### Bug Fixes

* [#241](https://github.com/openfoodfacts/openfoodfacts-dart/issues/241) Added "energy-kj" ([#418](https://github.com/openfoodfacts/openfoodfacts-dart/issues/418)) ([3f55bfa](https://github.com/openfoodfacts/openfoodfacts-dart/commit/3f55bfaf9a80274c2ba3845f4b3c1ea7d6c31dde))
* [#349](https://github.com/openfoodfacts/openfoodfacts-dart/issues/349) - removed irrelevant "create event" classes and methods ([#424](https://github.com/openfoodfacts/openfoodfacts-dart/issues/424)) ([242c944](https://github.com/openfoodfacts/openfoodfacts-dart/commit/242c94443971fd00bfea8488b72edb139be6d7ce))
* [#414](https://github.com/openfoodfacts/openfoodfacts-dart/issues/414) -  changed get request to post ([#415](https://github.com/openfoodfacts/openfoodfacts-dart/issues/415)) ([e478837](https://github.com/openfoodfacts/openfoodfacts-dart/commit/e4788373a3c41d0b1e6278f53f14f750250f34a4))
* [#447](https://github.com/openfoodfacts/openfoodfacts-dart/issues/447) - new class "PageNumber" replacing  ambiguous "Page" parameter ([#449](https://github.com/openfoodfacts/openfoodfacts-dart/issues/449)) ([584dbcc](https://github.com/openfoodfacts/openfoodfacts-dart/commit/584dbcc34d52d49c5652b3ddec7a163b0811466d))
* actually upload an image on a random product ([#419](https://github.com/openfoodfacts/openfoodfacts-dart/issues/419)) ([bad6238](https://github.com/openfoodfacts/openfoodfacts-dart/commit/bad62386f39a991f6e269e3842dc8e089eaa0aec))
* coordinates_image_size is no subtype of String ([#443](https://github.com/openfoodfacts/openfoodfacts-dart/issues/443)) ([9a66b95](https://github.com/openfoodfacts/openfoodfacts-dart/commit/9a66b95ed3ba3c98bdf4bd01ce035949a0cba9d5))
* getProductRaw tests ([#428](https://github.com/openfoodfacts/openfoodfacts-dart/issues/428)) ([e92a169](https://github.com/openfoodfacts/openfoodfacts-dart/commit/e92a169e10c8c01efa46c0cf36b3debdd20afb1b))
* Removed deprecated Product field imgSmallUrl ([#448](https://github.com/openfoodfacts/openfoodfacts-dart/issues/448)) ([8bb9d97](https://github.com/openfoodfacts/openfoodfacts-dart/commit/8bb9d9765a9c28d70be32625a0ef2a10d74d9632))
* send user credentials in POST requests, fixes [#420](https://github.com/openfoodfacts/openfoodfacts-dart/issues/420) ([#421](https://github.com/openfoodfacts/openfoodfacts-dart/issues/421)) ([0be7396](https://github.com/openfoodfacts/openfoodfacts-dart/commit/0be7396510a2b70cc2a15dae0429cfef030d807f))

## [1.14.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.13.0...v1.14.0) (2022-03-15)


### Features

* [#410](https://github.com/openfoodfacts/openfoodfacts-dart/issues/410) - refactored TaxonomyCountry with simplified fields ([#412](https://github.com/openfoodfacts/openfoodfacts-dart/issues/412)) ([dc77db3](https://github.com/openfoodfacts/openfoodfacts-dart/commit/dc77db313af4fa93e21aa4edc7ed7181a4e15e3b))
* Support for source fields in the Knowledge panel API ([#409](https://github.com/openfoodfacts/openfoodfacts-dart/issues/409)) ([6a065fd](https://github.com/openfoodfacts/openfoodfacts-dart/commit/6a065fdbd1834239758c4548566bc105a8034810))


### Bug Fixes

* [#407](https://github.com/openfoodfacts/openfoodfacts-dart/issues/407) - getProductList now works with unlimited number of barcodes ([#413](https://github.com/openfoodfacts/openfoodfacts-dart/issues/413)) ([fd7ddbc](https://github.com/openfoodfacts/openfoodfacts-dart/commit/fd7ddbc99e5517c383d02dd45764f655bf8c95fa))
* [#410](https://github.com/openfoodfacts/openfoodfacts-dart/issues/410) - removed failing tests about TaxonomyCountry ([#411](https://github.com/openfoodfacts/openfoodfacts-dart/issues/411)) ([25f7a4b](https://github.com/openfoodfacts/openfoodfacts-dart/commit/25f7a4bbfc176028965de75f1ba255cd130b2a4f))
* changelog order ([#405](https://github.com/openfoodfacts/openfoodfacts-dart/issues/405)) ([ca4669c](https://github.com/openfoodfacts/openfoodfacts-dart/commit/ca4669cb801621cb05e840ac6f0671d8a2b3418d))

## [1.13.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.12.0...v1.13.0) (2022-03-04)


### Features

* [#349](https://github.com/openfoodfacts/openfoodfacts-dart/issues/349) - added support for Events API ([#386](https://github.com/openfoodfacts/openfoodfacts-dart/issues/386)) ([ea79ad0](https://github.com/openfoodfacts/openfoodfacts-dart/commit/ea79ad0f3283c50ba54e1767bcece5761c57f939))
* [#379](https://github.com/openfoodfacts/openfoodfacts-dart/issues/379) - added packaging_text_XX ([#380](https://github.com/openfoodfacts/openfoodfacts-dart/issues/380)) ([cf492c5](https://github.com/openfoodfacts/openfoodfacts-dart/commit/cf492c54275424c184457884e951289512de3591))
* [#382](https://github.com/openfoodfacts/openfoodfacts-dart/issues/382) - added a "packaging" tag type ([#383](https://github.com/openfoodfacts/openfoodfacts-dart/issues/383)) ([4479956](https://github.com/openfoodfacts/openfoodfacts-dart/commit/4479956ddf9c1ab97ef5214562a162dd7138a6ac))
* [#394](https://github.com/openfoodfacts/openfoodfacts-dart/issues/394) - additional "root" and "all" configurations for taxonomies ([#396](https://github.com/openfoodfacts/openfoodfacts-dart/issues/396)) ([4686ddb](https://github.com/openfoodfacts/openfoodfacts-dart/commit/4686ddbfffe4f063a2e259718386f689471e09dd))
* [#401](https://github.com/openfoodfacts/openfoodfacts-dart/issues/401) - added packaging taxonomy ([#402](https://github.com/openfoodfacts/openfoodfacts-dart/issues/402)) ([c7dbebe](https://github.com/openfoodfacts/openfoodfacts-dart/commit/c7dbebec0b16026eae2f646cf36d1f34ea35c9f9))
* added the set of nutrient ids supported by Nutriments. ([#385](https://github.com/openfoodfacts/openfoodfacts-dart/issues/385)) ([bf9f79b](https://github.com/openfoodfacts/openfoodfacts-dart/commit/bf9f79bb12254efb255c9a43c46f6f76c583f32b))


### Bug Fixes

* successful unit tests ([#384](https://github.com/openfoodfacts/openfoodfacts-dart/issues/384)) ([ba2b731](https://github.com/openfoodfacts/openfoodfacts-dart/commit/ba2b7311546400401c6ed8cb6370a2316e4fd690))

## [1.12.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.11.1...v1.12.0) (2022-02-02)


### Features

* [#348](https://github.com/openfoodfacts/openfoodfacts-dart/issues/348) - new methods getTaxonomyTranslationUri and getCrowdinUri ([#372](https://github.com/openfoodfacts/openfoodfacts-dart/issues/372)) ([057e0a3](https://github.com/openfoodfacts/openfoodfacts-dart/commit/057e0a30b6c824722c733c4d63ca63bd8cccc434))
* [#369](https://github.com/openfoodfacts/openfoodfacts-dart/issues/369) - more flexibility for product query version ([#374](https://github.com/openfoodfacts/openfoodfacts-dart/issues/374)) ([51fdebc](https://github.com/openfoodfacts/openfoodfacts-dart/commit/51fdebcc46b0fea4bba69cef50817da9b0ef970f))
* [#370](https://github.com/openfoodfacts/openfoodfacts-dart/issues/370) - added "uuid" to configuration ([#378](https://github.com/openfoodfacts/openfoodfacts-dart/issues/378)) ([2be52e0](https://github.com/openfoodfacts/openfoodfacts-dart/commit/2be52e064c42c460ca453461e1ebdaece5b58177))
* [#370](https://github.com/openfoodfacts/openfoodfacts-dart/issues/370) - added app_name and app_version to http queries (as parameters) ([#376](https://github.com/openfoodfacts/openfoodfacts-dart/issues/376)) ([d4c6ef9](https://github.com/openfoodfacts/openfoodfacts-dart/commit/d4c6ef9f46eb8cf51e66d70f2b5838b8b8a8e12b))
* new method getProductString, api V0 and V2, new product and ingredient fields ([#371](https://github.com/openfoodfacts/openfoodfacts-dart/issues/371)) ([82547f6](https://github.com/openfoodfacts/openfoodfacts-dart/commit/82547f63a3c4e59cd6f30c1c018cf5c8d13d0b45))

### [1.11.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.11.0...v1.11.1) (2022-01-16)


### Bug Fixes

* Rename enum so it doesn't conflict with Size class from geometry.dart ([#366](https://github.com/openfoodfacts/openfoodfacts-dart/issues/366)) ([527b2e7](https://github.com/openfoodfacts/openfoodfacts-dart/commit/527b2e7ea484839ccfc9bb6ffc812b3d966e0924))

## [1.11.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.10.0...v1.11.0) (2022-01-15)


### Features

* KP: Parse Size from server response ([#364](https://github.com/openfoodfacts/openfoodfacts-dart/issues/364)) ([3d402b7](https://github.com/openfoodfacts/openfoodfacts-dart/commit/3d402b7d93e310ae8b31dd18b02b98db695dc9a1))

## [1.10.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.9.1...v1.10.0) (2022-01-13)


### Features

* new method "getOrderedNutrientsJsonString" ([#362](https://github.com/openfoodfacts/openfoodfacts-dart/issues/362)) ([516ccfa](https://github.com/openfoodfacts/openfoodfacts-dart/commit/516ccfa40063aa4d15d1e032438ea1073c945de6))

### [1.9.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.9.0...v1.9.1) (2022-01-08)


### Bug Fixes

* [#357](https://github.com/openfoodfacts/openfoodfacts-dart/issues/357) - all `Unit`s are now correctly saved ([#358](https://github.com/openfoodfacts/openfoodfacts-dart/issues/358)) ([9eb2872](https://github.com/openfoodfacts/openfoodfacts-dart/commit/9eb2872b0754c193b0c07f66f2da0331e4ffc23b))


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
