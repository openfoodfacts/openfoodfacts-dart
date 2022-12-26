/// PNNS food groups
///
/// PNNS is the French "Programme National Nutrition Santé"
enum PnnsGroup1 {
  BEVERAGES,
  CEREALS_AND_POTATOES,
  COMPOSITE_FOODS,
  FAT_AND_SAUCES,
  FISH_MEAT_AND_EGGS,
  FRUITS_AND_VEGETABLES,
  MILK_AND_DAIRIES,
  SALTY_SNACKS,
  SUGARY_SNACKS
}

/// PNNS food subgroups
enum PnnsGroup2 {
  FRUIT_JUICES,
  SWEETENED_BEVERAGES,
  ALCOHOLIC_BEVERAGES,
  UNSWEETENED_BEVERAGES,
  ARTIFICIALLY_SWEETENED_BEVERAGES,
  WATERS_AND_FLAVORED_WATERS,
  FRUIT_NECTARS,
  TEAS_AND_HERBAL_TEAS_AND_COFFEES,

  BREAKFAST_CEREALS,
  PASTRIES,
  POTATOES,
  CEREALS,
  BREAD,

  PIZZA_PIES_AND_QUICHE,
  SANDWICHES,
  SOUPS,
  ONE_DISH_MEALS,

  DRESSINGS_AND_SAUCES,
  FATS,

  PROCESSED_MEAT,
  MEAT,
  FISH_AND_SEAFOOD,
  OFFALS,

  FRUITS,
  VEGETABLES,
  DRIED_FRUITS,
  NUTS,
  LEGUMES,

  MILK_AND_YOGURT,
  DAIRY_DESSERTS,
  CHEESE,
  PLANT_BASED_MILK_SUBSTITUTES,

  APPETIZERS,
  SALTY_AND_FATTY_PRODUCTS,

  SWEETS,
  CHOCOLATE_PRODUCTS,
  ICE_CREAM
}

extension PnnsGroup1Extension on PnnsGroup1 {
  static const Map<PnnsGroup1, String> _NAMES = {
    PnnsGroup1.BEVERAGES: 'Beverages',
    PnnsGroup1.CEREALS_AND_POTATOES: 'Cereals and potatoes',
    PnnsGroup1.COMPOSITE_FOODS: 'Composite foods',
    PnnsGroup1.FAT_AND_SAUCES: 'Fat and sauces',
    PnnsGroup1.FISH_MEAT_AND_EGGS: 'Fish, meat and eggs',
    PnnsGroup1.FRUITS_AND_VEGETABLES: 'Fruits and vegetables',
    PnnsGroup1.MILK_AND_DAIRIES: 'Milk and dairies',
    PnnsGroup1.SALTY_SNACKS: 'Salty snacks',
    PnnsGroup1.SUGARY_SNACKS: 'Sugary snacks',
  };

  /// Returns the name of the group, in English
  String get name => _NAMES[this] ?? 'PNNS group 1';

  static const Map<PnnsGroup1, List<PnnsGroup2>> _SUBGROUPS = {
    PnnsGroup1.BEVERAGES: <PnnsGroup2>[
      PnnsGroup2.FRUIT_JUICES,
      PnnsGroup2.SWEETENED_BEVERAGES,
      PnnsGroup2.ALCOHOLIC_BEVERAGES,
      PnnsGroup2.UNSWEETENED_BEVERAGES,
      PnnsGroup2.ARTIFICIALLY_SWEETENED_BEVERAGES,
      PnnsGroup2.WATERS_AND_FLAVORED_WATERS,
      PnnsGroup2.FRUIT_NECTARS,
      PnnsGroup2.TEAS_AND_HERBAL_TEAS_AND_COFFEES
    ],
    PnnsGroup1.CEREALS_AND_POTATOES: <PnnsGroup2>[
      PnnsGroup2.BREAKFAST_CEREALS,
      PnnsGroup2.PASTRIES,
      PnnsGroup2.POTATOES,
      PnnsGroup2.CEREALS,
      PnnsGroup2.BREAD
    ],
    PnnsGroup1.COMPOSITE_FOODS: <PnnsGroup2>[
      PnnsGroup2.PIZZA_PIES_AND_QUICHE,
      PnnsGroup2.SANDWICHES,
      PnnsGroup2.SOUPS,
      PnnsGroup2.ONE_DISH_MEALS,
    ],
    PnnsGroup1.FAT_AND_SAUCES: <PnnsGroup2>[
      PnnsGroup2.DRESSINGS_AND_SAUCES,
      PnnsGroup2.FATS,
    ],
    PnnsGroup1.FISH_MEAT_AND_EGGS: <PnnsGroup2>[
      PnnsGroup2.PROCESSED_MEAT,
      PnnsGroup2.MEAT,
      PnnsGroup2.FISH_AND_SEAFOOD,
      PnnsGroup2.OFFALS
    ],
    PnnsGroup1.FRUITS_AND_VEGETABLES: <PnnsGroup2>[
      PnnsGroup2.FRUITS,
      PnnsGroup2.VEGETABLES,
      PnnsGroup2.DRIED_FRUITS,
      PnnsGroup2.NUTS,
      PnnsGroup2.LEGUMES,
    ],
    PnnsGroup1.MILK_AND_DAIRIES: <PnnsGroup2>[
      PnnsGroup2.MILK_AND_YOGURT,
      PnnsGroup2.DAIRY_DESSERTS,
      PnnsGroup2.CHEESE,
      PnnsGroup2.PLANT_BASED_MILK_SUBSTITUTES,
    ],
    PnnsGroup1.SALTY_SNACKS: <PnnsGroup2>[
      PnnsGroup2.APPETIZERS,
      PnnsGroup2.SALTY_AND_FATTY_PRODUCTS,
    ],
    PnnsGroup1.SUGARY_SNACKS: <PnnsGroup2>[
      PnnsGroup2.SWEETS,
      PnnsGroup2.CHOCOLATE_PRODUCTS,
      PnnsGroup2.ICE_CREAM
    ],
  };

  /// Returns the subgroups of the group
  List<PnnsGroup2>? get subGroups => _SUBGROUPS[this];
}

extension PnnsGroup2Extension on PnnsGroup2 {
  static const Map<PnnsGroup2, String> _NAMES = {
    PnnsGroup2.FRUIT_JUICES: 'Fruit juices',
    PnnsGroup2.SWEETENED_BEVERAGES: 'Sweetened beverages',
    PnnsGroup2.ALCOHOLIC_BEVERAGES: 'Alcoholic beverages',
    PnnsGroup2.UNSWEETENED_BEVERAGES: 'Unsweetened beverages',
    PnnsGroup2.ARTIFICIALLY_SWEETENED_BEVERAGES:
        'Artificially sweetened beverages',
    PnnsGroup2.WATERS_AND_FLAVORED_WATERS: 'Waters and flavored waters',
    PnnsGroup2.FRUIT_NECTARS: 'Fruits nectars',
    PnnsGroup2.TEAS_AND_HERBAL_TEAS_AND_COFFEES:
        'Teas and herbal teas and coffees',
    PnnsGroup2.BREAKFAST_CEREALS: 'Breakfast cereals',
    PnnsGroup2.PASTRIES: 'Pastries',
    PnnsGroup2.POTATOES: 'Potatoes',
    PnnsGroup2.CEREALS: 'Cereals',
    PnnsGroup2.BREAD: 'Bread',
    PnnsGroup2.PIZZA_PIES_AND_QUICHE: 'Pizza, pies and quiche',
    PnnsGroup2.SANDWICHES: 'Sandwiches',
    PnnsGroup2.SOUPS: 'Soups',
    PnnsGroup2.ONE_DISH_MEALS: 'One dish meals',
    PnnsGroup2.DRESSINGS_AND_SAUCES: 'Dressings and sauces',
    PnnsGroup2.FATS: 'Fats',
    PnnsGroup2.PROCESSED_MEAT: 'Processed meat',
    PnnsGroup2.MEAT: 'Meat',
    PnnsGroup2.FISH_AND_SEAFOOD: 'Fish and seafood',
    PnnsGroup2.OFFALS: 'Offals',
    PnnsGroup2.FRUITS: 'Fruits',
    PnnsGroup2.VEGETABLES: 'Vegetables',
    PnnsGroup2.DRIED_FRUITS: 'Dried fruits',
    PnnsGroup2.NUTS: 'Nuts',
    PnnsGroup2.LEGUMES: 'Legumes',
    PnnsGroup2.MILK_AND_YOGURT: 'Milk and yogurt',
    PnnsGroup2.DAIRY_DESSERTS: 'Dairy desserts',
    PnnsGroup2.CHEESE: 'Cheese',
    PnnsGroup2.PLANT_BASED_MILK_SUBSTITUTES: 'Plant based milk substitutes',
    PnnsGroup2.APPETIZERS: 'Appetizers',
    PnnsGroup2.SALTY_AND_FATTY_PRODUCTS: 'Salty and fatty products',
    PnnsGroup2.SWEETS: 'Sweets',
    PnnsGroup2.CHOCOLATE_PRODUCTS: 'Chocolate products',
    PnnsGroup2.ICE_CREAM: 'Ice cream',
  };

  static const Map<PnnsGroup2, String> _IDS = {
    PnnsGroup2.FRUIT_JUICES: 'fruit-juices',
    PnnsGroup2.SWEETENED_BEVERAGES: 'sweetened-beverages',
    PnnsGroup2.ALCOHOLIC_BEVERAGES: 'alcoholic-beverages',
    PnnsGroup2.UNSWEETENED_BEVERAGES: 'unsweetened-beverages',
    PnnsGroup2.ARTIFICIALLY_SWEETENED_BEVERAGES:
        'artificially-sweetened-beverages',
    PnnsGroup2.WATERS_AND_FLAVORED_WATERS: 'waters-and-flavored-waters',
    PnnsGroup2.FRUIT_NECTARS: 'fruit-nectars',
    PnnsGroup2.TEAS_AND_HERBAL_TEAS_AND_COFFEES:
        'teas-and-herbal-teas-and-coffees',
    PnnsGroup2.BREAKFAST_CEREALS: 'breakfast-cereals',
    PnnsGroup2.PASTRIES: 'pastries',
    PnnsGroup2.POTATOES: 'potatoes',
    PnnsGroup2.CEREALS: 'cereals',
    PnnsGroup2.BREAD: 'bread',
    PnnsGroup2.PIZZA_PIES_AND_QUICHE: 'pizza-pies-and-quiche',
    PnnsGroup2.SANDWICHES: 'sandwiches',
    PnnsGroup2.SOUPS: 'soups',
    PnnsGroup2.ONE_DISH_MEALS: 'one-dish-meals',
    PnnsGroup2.DRESSINGS_AND_SAUCES: 'dressings-and-sauces',
    PnnsGroup2.FATS: 'fats',
    PnnsGroup2.PROCESSED_MEAT: 'processed-meat',
    PnnsGroup2.MEAT: 'meat',
    PnnsGroup2.FISH_AND_SEAFOOD: 'fish-and-seafood',
    PnnsGroup2.OFFALS: 'offals',
    PnnsGroup2.FRUITS: 'fruits',
    PnnsGroup2.VEGETABLES: 'vegetables',
    PnnsGroup2.DRIED_FRUITS: 'dried-fruits',
    PnnsGroup2.NUTS: 'nuts',
    PnnsGroup2.LEGUMES: 'legumes',
    PnnsGroup2.MILK_AND_YOGURT: 'milk-and-yogurt',
    PnnsGroup2.DAIRY_DESSERTS: 'dairy-desserts',
    PnnsGroup2.CHEESE: 'cheese',
    PnnsGroup2.PLANT_BASED_MILK_SUBSTITUTES: 'plant-based-milk-substitutes',
    PnnsGroup2.APPETIZERS: 'appetizers',
    PnnsGroup2.SALTY_AND_FATTY_PRODUCTS: 'salty-and-fatty-products',
    PnnsGroup2.SWEETS: 'sweets',
    PnnsGroup2.CHOCOLATE_PRODUCTS: 'chocolate-products',
    PnnsGroup2.ICE_CREAM: 'ice-cream',
  };

  /// Returns the name of the subgroup, in English
  String get name => _NAMES[this] ?? 'PNNS group 2';

  /// Returns the id of the subgroup
  String get id => _IDS[this] ?? '';
}
