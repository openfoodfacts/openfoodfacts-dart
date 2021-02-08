![Pub Version](https://img.shields.io/pub/v/openfoodfacts?&colorB=green)

# Open Food Facts - Dart
Dart package for the Open Food Facts API. Easily access to more than 1.5 million products from all around the world.
Open Food Facts is powered by global contributors and is constantly growing thanks to them.

## General principles
- You can look for information about products, including many useful computed values. 
- If you can't get the information on a specific product, you can get your user to send photos and data, that will then be processed by Open Food Facts AI and contributors to get the computed result you want to show them.
- You can also implement the complete flow so that they get immediately the result with some effort on their side.

## If your users do expect a result immediately (eg. Inventory apps)
- Send photos (front/nutrition/ingredients): most painless thing for your users
- The Open Food Facts AI Robotoff will generate some derived data from the photos
- Overtime, other apps, and the Open Food Facts community will fill the data gaps

## If your users expect a result immediately:
- Send nutrition facts + category > get Nutri-Score
- Send ingredients > get the NOVA group (about food ultra-processing), additives, allergens, normalized ingredients, vegan, vegetarian…
- Send category + labels > get soon the Eco-Score (about environmental impact)

## Open Data Licence
The database in under the OdBL. This means attributing the source and also contributing back any additions (photos, data), which this package makes easy to do.
You can check the terms of use here : [Terms of use](https://world.openfoodfacts.org/terms-of-use).

## List of current features
- [x] Product: you can retrieve information about products
- [x] Fetch Product images
- [x] Send images: that you can do
- [x] Extract ingredients from ingredients image: User can extract the ingredients text if it is missing

### READ
- [x] Product 
- [x] Product images
- [x] Additives, Allergens, Environment impact, Ingredient analysis, Nutrient levels
- [x] Recommended Daily Intakes
- [x] Personalized search
- [x] Product completion status
- [x] Extract ingredients text from image
### WRITE
- [x] Save product to the Open Food Facts 
- [x] Send images
- [x] User comments and auth
### ML
- [x] Robotoff support

### Other

## Roadmap
TODO: complete me

### READ
- [ ] ???

### WRITE
- [ ] Nutrition table
- [ ] Ingredient list
- [ ] Multilingual fields
- [ ] Regular fields
- [ ] Photo upload
- [ ] Photo operations (rotate, crop, select, unselect with language awareness)

### Other

## Contribute
There are many ways to contribute, and Open Food Facts has a lot of projects beside this package.
Most of our operations are coordinated through our Slack which you can join here : [Open Food Facts Slack](https://openfoodfacts.slack.com).

Regarding this package, we accept pull requests as well feature requests.

### Testing

Execute the following command from the root of the repository to run the tests:

```
flutter test test/
```

## How to use ?
You can find the full documentation here : [Documentation](https://github.com/openfoodfacts/openfoodfacts-dart/blob/master/DOCUMENTATION.md).

## Authors
* Alexander Schacht - [Grumpf86](https://github.com/Grumpf86)
* Primaël Quémerais - [Reefind](https://gitlab.com/Reefind)
* Marcus Cantu - [Cantum2](https://github.com/Cantum2)
* Adrien Faure - [Adfaure](https://github.com/adfaure)
* Peter Tran-Jørgensen - [peterwvj](https://github.com/peterwvj)
* Mohamed Boussaid - [MohamedFBoussaid](https://github.com/MohamedFBoussaid)
