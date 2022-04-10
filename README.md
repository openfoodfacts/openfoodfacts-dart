![Pub Version](https://img.shields.io/pub/v/openfoodfacts?&colorB=green)
[![likes](https://badges.bar/openfoodfacts/likes)](https://pub.dev/packages/openfoodfacts/score)
[![popularity](https://badges.bar/openfoodfacts/popularity)](https://pub.dev/packages/openfoodfacts/score)
[![pub points](https://badges.bar/openfoodfacts/pub%20points)](https://pub.dev/packages/openfoodfacts/score)

# Open Food Facts - Dart
Dart package for the Open Food Facts API. Easily access to more than 1.9 million products from all around the world.
Open Food Facts is powered by contributors from around the world and is constantly growing thanks to them.

## How to use ?
You can find the full documentation here: [Documentation](https://github.com/openfoodfacts/openfoodfacts-dart/blob/master/DOCUMENTATION.md).
You can find automated code documentation here:  [Documentation](https://openfoodfacts.github.io/openfoodfacts-dart/).

## General principles
- You can look for information about products, including many useful computed values. 
- If you can't get the information on a specific product, you can get your user to send photos and data, that will then be processed by Open Food Facts AI and contributors to get the computed result you want to show them.
- You can also implement the complete flow so that they get immediately the result with some effort on their side.

## Contributing 

### If your users do not expect a specific result immediately (eg. Inventory apps)
- Send photos (front/nutrition/ingredients/packaging): most painless thing for your users
- The Open Food Facts AI Robotoff will generate some derived data from the photos
- Overtime, other apps, and the Open Food Facts community will fill the data gaps

### If your users do expect a result immediately (eg Nutrition apps, Scoring apps…):
- Send nutrition facts + category > get the Nutri-Score
- Send ingredients > get the NOVA group (about food ultra-processing), additives, allergens, normalized ingredients, vegan, vegetarian…
- Send category (strict minimum) + labels + origins of ingredients + packaging (photo and text) > get the Eco-Score (about environmental impact)

## Open Data Licence
The database in under the OdBL. This means attributing the source and also contributing back any additions (photos, data), which this package makes easy to do.
You can check the terms of use here : [Terms of use](https://world.openfoodfacts.org/terms-of-use).

## List of current features

### GENERAL
- [x] Multilingual (180 languages are supported)
- [x] Create users
- [x] Check if users exist   

### READ
- [x] Product: you can retrieve information about products
- [x] Product images (get product image by field, size and language, current fields are: Front, Ingredients, Nutrition, Packaging)
- [x] Additives, Allergens, Environment impact, Ingredient analysis, Nutrient levels, Nutrition facts (incl. micro-nutrients)
- [x] Language dependant fields (like ingredients, product name, packaging text)
- [x] Eco-Score, Nutri-Score, NOVA groups
- [x] Translated, high-level and customizable product information (Attributes)
- [x] Product completion status
- [x] Folksonomy Engine (custom properties for products)
- [x] Open Food Facts Events (Gamification)

### PERSONALIZATION
- [x] Recommended Daily Intakes
- [x] Translated, high-level and customizable product information (Attributes)
- [x] Autocompleting for the user inputs, by giving suggestions for (Labels, categories, ingredients, additives, traces ...)

### SEARCH
- [x] search products by tags
- [x] search products with / without additives
- [x] search products with keywords
- [x] Personalized search

### WRITE
- [x] Save product to Open Food Facts 
- [x] Send images
- [x] User comments and auth
- [x] Anonymous photo upload
- [x] Photo operations (rotate, crop, select, unselect with language awareness)
### ML
- [x] Robotoff support
- [x] Extract ingredients from ingredients image: User can extract the ingredients text if it is missing
- [x] Get the OCR of the ingredients photo (for validation purposes)

## Roadmap
List of new APIs to implement: https://github.com/openfoodfacts/api-documentation/issues

### READ
- [ ] ???

### WRITE

### Other

## Contribute
There are many ways to contribute, and Open Food Facts has a lot of projects beside this package.
Most of our operations are coordinated through our Slack which you can join here : [Open Food Facts Slack](https://openfoodfacts.slack.com).

Regarding this package, we accept pull requests as well feature requests.

### Testing

Execute the following command from the root of the repository to run the tests:

```
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



## Authors
* Alexander Schacht - [Grumpf86](https://github.com/Grumpf86)
* Primaël Quémerais - [Reefind](https://gitlab.com/Reefind)
* Marcus Cantu - [Cantum2](https://github.com/Cantum2)
* Adrien Faure - [Adfaure](https://github.com/adfaure)
* Peter Tran-Jørgensen - [peterwvj](https://github.com/peterwvj)
* Mohamed Boussaid - [MohamedFBoussaid](https://github.com/MohamedFBoussaid)
