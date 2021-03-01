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
