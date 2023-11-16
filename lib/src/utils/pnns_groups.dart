import 'package:openfoodfacts/src/model/off_tagged.dart';

/// PNNS food groups
///
/// PNNS is the French "Programme National Nutrition Santé"
enum PnnsGroup1 {
  BEVERAGES(
    name: 'Beverages',
    subGroups: <PnnsGroup2>[
      PnnsGroup2.FRUIT_JUICES,
      PnnsGroup2.SWEETENED_BEVERAGES,
      PnnsGroup2.ALCOHOLIC_BEVERAGES,
      PnnsGroup2.UNSWEETENED_BEVERAGES,
      PnnsGroup2.ARTIFICIALLY_SWEETENED_BEVERAGES,
      PnnsGroup2.WATERS_AND_FLAVORED_WATERS,
      PnnsGroup2.FRUIT_NECTARS,
      PnnsGroup2.TEAS_AND_HERBAL_TEAS_AND_COFFEES,
    ],
  ),
  CEREALS_AND_POTATOES(
    name: 'Cereals and potatoes',
    subGroups: <PnnsGroup2>[
      PnnsGroup2.BREAKFAST_CEREALS,
      PnnsGroup2.PASTRIES,
      PnnsGroup2.POTATOES,
      PnnsGroup2.CEREALS,
      PnnsGroup2.BREAD,
    ],
  ),
  COMPOSITE_FOODS(
    name: 'Composite foods',
    subGroups: <PnnsGroup2>[
      PnnsGroup2.PIZZA_PIES_AND_QUICHE,
      PnnsGroup2.SANDWICHES,
      PnnsGroup2.SOUPS,
      PnnsGroup2.ONE_DISH_MEALS,
    ],
  ),
  FAT_AND_SAUCES(
    name: 'Fat and sauces',
    subGroups: <PnnsGroup2>[
      PnnsGroup2.DRESSINGS_AND_SAUCES,
      PnnsGroup2.FATS,
    ],
  ),
  FISH_MEAT_AND_EGGS(
    name: 'Fish, meat and eggs',
    subGroups: <PnnsGroup2>[
      PnnsGroup2.PROCESSED_MEAT,
      PnnsGroup2.MEAT,
      PnnsGroup2.FISH_AND_SEAFOOD,
      PnnsGroup2.OFFALS
    ],
  ),
  FRUITS_AND_VEGETABLES(
    name: 'Fruits and vegetables',
    subGroups: <PnnsGroup2>[
      PnnsGroup2.FRUITS,
      PnnsGroup2.VEGETABLES,
      PnnsGroup2.DRIED_FRUITS,
      PnnsGroup2.NUTS,
      PnnsGroup2.LEGUMES,
    ],
  ),
  MILK_AND_DAIRIES(
    name: 'Milk and dairies',
    subGroups: <PnnsGroup2>[
      PnnsGroup2.MILK_AND_YOGURT,
      PnnsGroup2.DAIRY_DESSERTS,
      PnnsGroup2.CHEESE,
      PnnsGroup2.PLANT_BASED_MILK_SUBSTITUTES,
    ],
  ),
  SALTY_SNACKS(
    name: 'Salty snacks',
    subGroups: <PnnsGroup2>[
      PnnsGroup2.APPETIZERS,
      PnnsGroup2.SALTY_AND_FATTY_PRODUCTS,
    ],
  ),
  SUGARY_SNACKS(
    name: 'Sugary snacks',
    subGroups: <PnnsGroup2>[
      PnnsGroup2.SWEETS,
      PnnsGroup2.CHOCOLATE_PRODUCTS,
      PnnsGroup2.ICE_CREAM
    ],
  );

  const PnnsGroup1({
    required this.name,
    required this.subGroups,
  });

  /// Name in English
  final String name;

  /// Subgroups of the group
  final List<PnnsGroup2> subGroups;
}

/// PNNS food subgroups.
enum PnnsGroup2 implements OffTagged {
  FRUIT_JUICES(
    offTag: 'fruit-juices',
    name: 'Fruit juices',
  ),
  SWEETENED_BEVERAGES(
    offTag: 'sweetened-beverages',
    name: 'Sweetened beverages',
  ),
  ALCOHOLIC_BEVERAGES(
    offTag: 'alcoholic-beverages',
    name: 'Alcoholic beverages',
  ),
  UNSWEETENED_BEVERAGES(
    offTag: 'unsweetened-beverages',
    name: 'Unsweetened beverages',
  ),
  ARTIFICIALLY_SWEETENED_BEVERAGES(
    offTag: 'artificially-sweetened-beverages',
    name: 'Artificially sweetened beverages',
  ),
  WATERS_AND_FLAVORED_WATERS(
    offTag: 'waters-and-flavored-waters',
    name: 'Waters and flavored waters',
  ),
  FRUIT_NECTARS(
    offTag: 'fruit-nectars',
    name: 'Fruits nectars',
  ),
  TEAS_AND_HERBAL_TEAS_AND_COFFEES(
    offTag: 'teas-and-herbal-teas-and-coffees',
    name: 'Teas and herbal teas and coffees',
  ),

  BREAKFAST_CEREALS(
    offTag: 'breakfast-cereals',
    name: 'Breakfast cereals',
  ),
  PASTRIES(
    offTag: 'pastries',
    name: 'Pastries',
  ),
  POTATOES(
    offTag: 'potatoes',
    name: 'Potatoes',
  ),
  CEREALS(
    offTag: 'cereals',
    name: 'Cereals',
  ),
  BREAD(
    offTag: 'bread',
    name: 'Bread',
  ),

  PIZZA_PIES_AND_QUICHE(
    offTag: 'pizza-pies-and-quiche',
    name: 'Pizza, pies and quiche',
  ),
  SANDWICHES(
    offTag: 'sandwiches',
    name: 'Sandwiches',
  ),
  SOUPS(
    offTag: 'soups',
    name: 'Soups',
  ),
  ONE_DISH_MEALS(
    offTag: 'one-dish-meals',
    name: 'One dish meals',
  ),

  DRESSINGS_AND_SAUCES(
    offTag: 'dressings-and-sauces',
    name: 'Dressings and sauces',
  ),
  FATS(
    offTag: 'fats',
    name: 'Fats',
  ),

  PROCESSED_MEAT(
    offTag: 'processed-meat',
    name: 'Processed meat',
  ),
  MEAT(
    offTag: 'meat',
    name: 'Meat',
  ),
  FISH_AND_SEAFOOD(
    offTag: 'fish-and-seafood',
    name: 'Fish and seafood',
  ),
  OFFALS(
    offTag: 'offals',
    name: 'Offals',
  ),

  FRUITS(
    offTag: 'fruits',
    name: 'Fruits',
  ),
  VEGETABLES(
    offTag: 'vegetables',
    name: 'Vegetables',
  ),
  DRIED_FRUITS(
    offTag: 'dried-fruits',
    name: 'Dried fruits',
  ),
  NUTS(
    offTag: 'nuts',
    name: 'Nuts',
  ),
  LEGUMES(
    offTag: 'legumes',
    name: 'Legumes',
  ),

  MILK_AND_YOGURT(
    offTag: 'milk-and-yogurt',
    name: 'Milk and yogurt',
  ),
  DAIRY_DESSERTS(
    offTag: 'dairy-desserts',
    name: 'Dairy desserts',
  ),
  CHEESE(
    offTag: 'cheese',
    name: 'Cheese',
  ),
  PLANT_BASED_MILK_SUBSTITUTES(
    offTag: 'plant-based-milk-substitutes',
    name: 'Plant based milk substitutes',
  ),

  APPETIZERS(
    offTag: 'appetizers',
    name: 'Appetizers',
  ),
  SALTY_AND_FATTY_PRODUCTS(
    offTag: 'salty-and-fatty-products',
    name: 'Salty and fatty products',
  ),

  SWEETS(
    offTag: 'sweets',
    name: 'Sweets',
  ),
  CHOCOLATE_PRODUCTS(
    offTag: 'chocolate-products',
    name: 'Chocolate products',
  ),
  ICE_CREAM(
    offTag: 'ice-cream',
    name: 'Ice cream',
  );

  const PnnsGroup2({
    required this.offTag,
    required this.name,
  });

  @override
  final String offTag;

  /// Name in English
  final String name;

  /// Returns the id of the subgroup
  // TODO: deprecated from 2023-11-15; remove when old enough
  @Deprecated('Use offTag instead')
  String get id => offTag;
}
