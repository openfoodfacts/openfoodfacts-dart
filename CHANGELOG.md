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
