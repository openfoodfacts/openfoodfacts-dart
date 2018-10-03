# Open Food Facts - Dart

Dart package for the Open Food Facts API.

## Content

The following API services are implemented:

### getProduct
Get the product information for an existing barcode.

### saveProduct
Add a new product or edit an existing one.

### addProductImage
Add an product image of the front, the ingredients or the nutrition.


## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).

## Development

### auto generate the json classes 
By running (in command prompt) *flutter packages pub run build_runner build* in our project root, you can generate json serialization code for our models whenever needed.

### running the unit tests
Adjust the file *test_constants.dart* to provide your own login credentials (OpenFoodFacts).

## Authors
Alexander Schacht - [Grumpf86](https://github.com/Grumpf86 )