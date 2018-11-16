# Open Food Facts - Dart

Dart package for the Open Food Facts API.

## Content

The following API services are implemented:

### getProduct(barcode, language)
Get the product information for an existing barcode.
Prepare ingredients, images and product name depending on the specified language.

### getProductRaw(barcode)
Get the product information for an existing barcode without additional preparation.

### saveProduct(user, product)
Add a new product or edit an existing one, using the specified *Open Food Facts* user credentials.

### addProductImage(user, image)
Add an product image of the front, the ingredients or the nutrition, using the specified *Open Food Facts* user credentials.



## Development

### Getting Started

For help getting started with Flutter, view our online [flutter docs](https://flutter.io/).
For help on editing package code, view the [package docs](https://flutter.io/developing-packages/).

### auto generate the json classes 
By running (in command prompt) *flutter packages pub run build_runner build* in our project root, you can generate json serialization code for our models whenever needed.

### running the unit tests
Adjust the file *test_constants.dart* to provide your own login credentials (OpenFoodFacts).

### publish the package to pub.dartlang.org
run *flutter packages pub publish* in the project directory

## Authors
* Alexander Schacht - [Grumpf86](https://github.com/Grumpf86 )
* Niklas Casper - [phanlipo](https://github.com/phanlipo)