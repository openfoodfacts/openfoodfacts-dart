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
  String get name {
    switch (this) {
      case PnnsGroup1.BEVERAGES:
        return 'Beverages';
      case PnnsGroup1.CEREALS_AND_POTATOES:
        return 'Cereals and potatoes';
      case PnnsGroup1.COMPOSITE_FOODS:
        return 'Composite foods';
      case PnnsGroup1.FAT_AND_SAUCES:
        return 'Fat and sauces';
      case PnnsGroup1.FISH_MEAT_AND_EGGS:
        return 'Fish, meat and eggs';
      case PnnsGroup1.FRUITS_AND_VEGETABLES:
        return 'Fruits and vegetables';
      case PnnsGroup1.MILK_AND_DAIRIES:
        return 'Milk and dairies';
      case PnnsGroup1.SALTY_SNACKS:
        return 'Salty snacks';
      case PnnsGroup1.SUGARY_SNACKS:
        return 'Sugary snacks';
      default:
        return 'PNNS group 1';
    }
  }

  List<PnnsGroup2>? get subGroups {
    switch (this) {
      case PnnsGroup1.BEVERAGES:
        return <PnnsGroup2>[
          PnnsGroup2.FRUIT_JUICES,
          PnnsGroup2.SWEETENED_BEVERAGES,
          PnnsGroup2.ALCOHOLIC_BEVERAGES,
          PnnsGroup2.UNSWEETENED_BEVERAGES,
          PnnsGroup2.ARTIFICIALLY_SWEETENED_BEVERAGES,
          PnnsGroup2.WATERS_AND_FLAVORED_WATERS,
          PnnsGroup2.FRUIT_NECTARS,
          PnnsGroup2.TEAS_AND_HERBAL_TEAS_AND_COFFEES
        ];
      case PnnsGroup1.CEREALS_AND_POTATOES:
        return <PnnsGroup2>[
          PnnsGroup2.BREAKFAST_CEREALS,
          PnnsGroup2.PASTRIES,
          PnnsGroup2.POTATOES,
          PnnsGroup2.CEREALS,
          PnnsGroup2.BREAD
        ];
      case PnnsGroup1.COMPOSITE_FOODS:
        return <PnnsGroup2>[
          PnnsGroup2.PIZZA_PIES_AND_QUICHE,
          PnnsGroup2.SANDWICHES,
          PnnsGroup2.SOUPS,
          PnnsGroup2.ONE_DISH_MEALS,
        ];
      case PnnsGroup1.FAT_AND_SAUCES:
        return <PnnsGroup2>[PnnsGroup2.DRESSINGS_AND_SAUCES, PnnsGroup2.FATS];
      case PnnsGroup1.FISH_MEAT_AND_EGGS:
        return <PnnsGroup2>[
          PnnsGroup2.PROCESSED_MEAT,
          PnnsGroup2.MEAT,
          PnnsGroup2.FISH_AND_SEAFOOD,
          PnnsGroup2.OFFALS
        ];
      case PnnsGroup1.FRUITS_AND_VEGETABLES:
        return <PnnsGroup2>[
          PnnsGroup2.FRUITS,
          PnnsGroup2.VEGETABLES,
          PnnsGroup2.DRIED_FRUITS,
          PnnsGroup2.NUTS,
          PnnsGroup2.LEGUMES,
        ];
      case PnnsGroup1.MILK_AND_DAIRIES:
        return <PnnsGroup2>[
          PnnsGroup2.MILK_AND_YOGURT,
          PnnsGroup2.DAIRY_DESSERTS,
          PnnsGroup2.CHEESE,
          PnnsGroup2.PLANT_BASED_MILK_SUBSTITUTES,
        ];
      case PnnsGroup1.SALTY_SNACKS:
        return <PnnsGroup2>[
          PnnsGroup2.APPETIZERS,
          PnnsGroup2.SALTY_AND_FATTY_PRODUCTS,
        ];
      case PnnsGroup1.SUGARY_SNACKS:
        return <PnnsGroup2>[
          PnnsGroup2.SWEETS,
          PnnsGroup2.CHOCOLATE_PRODUCTS,
          PnnsGroup2.ICE_CREAM
        ];
      default:
        return null;
    }
  }
}

extension PnnsGroup2Extension on PnnsGroup2 {
  String get name {
    switch (this) {
      case PnnsGroup2.FRUIT_JUICES:
        return 'Fruit juices';
      case PnnsGroup2.SWEETENED_BEVERAGES:
        return 'Sweetened beverages';
      case PnnsGroup2.ALCOHOLIC_BEVERAGES:
        return 'Alcoholic beverages';
      case PnnsGroup2.UNSWEETENED_BEVERAGES:
        return 'Unsweetened beverages';
      case PnnsGroup2.ARTIFICIALLY_SWEETENED_BEVERAGES:
        return 'Artificially sweetened beverages';
      case PnnsGroup2.WATERS_AND_FLAVORED_WATERS:
        return 'Waters and flavored waters';
      case PnnsGroup2.FRUIT_NECTARS:
        return 'Fruits nectars';
      case PnnsGroup2.TEAS_AND_HERBAL_TEAS_AND_COFFEES:
        return 'Teas and herbal teas and coffees';
      case PnnsGroup2.BREAKFAST_CEREALS:
        return 'Breakfast cereals';
      case PnnsGroup2.PASTRIES:
        return 'Pastries';
      case PnnsGroup2.POTATOES:
        return 'Potatoes';
      case PnnsGroup2.CEREALS:
        return 'Cereals';
      case PnnsGroup2.BREAD:
        return 'Bread';
      case PnnsGroup2.PIZZA_PIES_AND_QUICHE:
        return 'Pizza, pies and quiche';
      case PnnsGroup2.SANDWICHES:
        return 'Sandwiches';
      case PnnsGroup2.SOUPS:
        return 'Soups';
      case PnnsGroup2.ONE_DISH_MEALS:
        return 'One dish meals';
      case PnnsGroup2.DRESSINGS_AND_SAUCES:
        return 'Dressings and sauces';
      case PnnsGroup2.FATS:
        return 'Fats';
      case PnnsGroup2.PROCESSED_MEAT:
        return 'Processed meat';
      case PnnsGroup2.MEAT:
        return 'Meat';
      case PnnsGroup2.FISH_AND_SEAFOOD:
        return 'Fish and seafood';
      case PnnsGroup2.OFFALS:
        return 'Offals';
      case PnnsGroup2.FRUITS:
        return 'Fruits';
      case PnnsGroup2.VEGETABLES:
        return 'Vegetables';
      case PnnsGroup2.DRIED_FRUITS:
        return 'Dried fruits';
      case PnnsGroup2.NUTS:
        return 'Nuts';
      case PnnsGroup2.LEGUMES:
        return 'Legumes';
      case PnnsGroup2.MILK_AND_YOGURT:
        return 'Milk and yogurt';
      case PnnsGroup2.DAIRY_DESSERTS:
        return 'Dairy desserts';
      case PnnsGroup2.CHEESE:
        return 'Cheese';
      case PnnsGroup2.PLANT_BASED_MILK_SUBSTITUTES:
        return 'Plant based milk substitutes';
      case PnnsGroup2.APPETIZERS:
        return 'Appetizers';
      case PnnsGroup2.SALTY_AND_FATTY_PRODUCTS:
        return 'Salty and fatty products';
      case PnnsGroup2.SWEETS:
        return 'Sweets';
      case PnnsGroup2.CHOCOLATE_PRODUCTS:
        return 'Chocolate products';
      case PnnsGroup2.ICE_CREAM:
        return 'Ice cream';
      default:
        return 'PNNS group 2';
    }
  }

  String get id {
    switch (this) {
      case PnnsGroup2.FRUIT_JUICES:
        return 'fruit-juices';
      case PnnsGroup2.SWEETENED_BEVERAGES:
        return 'sweetened-beverages';
      case PnnsGroup2.ALCOHOLIC_BEVERAGES:
        return 'alcoholic-beverages';
      case PnnsGroup2.UNSWEETENED_BEVERAGES:
        return 'unsweetened-beverages';
      case PnnsGroup2.ARTIFICIALLY_SWEETENED_BEVERAGES:
        return 'artificially-sweetened-beverages';
      case PnnsGroup2.WATERS_AND_FLAVORED_WATERS:
        return 'waters-and-flavored-waters';
      case PnnsGroup2.FRUIT_NECTARS:
        return 'fruit-nectars';
      case PnnsGroup2.TEAS_AND_HERBAL_TEAS_AND_COFFEES:
        return 'teas-and-herbal-teas-and-coffees';
      case PnnsGroup2.BREAKFAST_CEREALS:
        return 'breakfast-cereals';
      case PnnsGroup2.PASTRIES:
        return 'pastries';
      case PnnsGroup2.POTATOES:
        return 'potatoes';
      case PnnsGroup2.CEREALS:
        return 'cereals';
      case PnnsGroup2.BREAD:
        return 'bread';
      case PnnsGroup2.PIZZA_PIES_AND_QUICHE:
        return 'pizza-pies-and-quiche';
      case PnnsGroup2.SANDWICHES:
        return 'sandwiches';
      case PnnsGroup2.SOUPS:
        return 'soups';
      case PnnsGroup2.ONE_DISH_MEALS:
        return 'one-dish-meals';
      case PnnsGroup2.DRESSINGS_AND_SAUCES:
        return 'dressings-and-sauces';
      case PnnsGroup2.FATS:
        return 'fats';
      case PnnsGroup2.PROCESSED_MEAT:
        return 'processed-meat';
      case PnnsGroup2.MEAT:
        return 'meat';
      case PnnsGroup2.FISH_AND_SEAFOOD:
        return 'fish-and-seafood';
      case PnnsGroup2.OFFALS:
        return 'offals';
      case PnnsGroup2.FRUITS:
        return 'fruits';
      case PnnsGroup2.VEGETABLES:
        return 'vegetables';
      case PnnsGroup2.DRIED_FRUITS:
        return 'dried-fruits';
      case PnnsGroup2.NUTS:
        return 'nuts';
      case PnnsGroup2.LEGUMES:
        return 'legumes';
      case PnnsGroup2.MILK_AND_YOGURT:
        return 'milk-and-yogurt';
      case PnnsGroup2.DAIRY_DESSERTS:
        return 'dairy-desserts';
      case PnnsGroup2.CHEESE:
        return 'cheese';
      case PnnsGroup2.PLANT_BASED_MILK_SUBSTITUTES:
        return 'plant-based-milk-substitutes';
      case PnnsGroup2.APPETIZERS:
        return 'appetizers';
      case PnnsGroup2.SALTY_AND_FATTY_PRODUCTS:
        return 'salty-and-fatty-products';
      case PnnsGroup2.SWEETS:
        return 'sweets';
      case PnnsGroup2.CHOCOLATE_PRODUCTS:
        return 'chocolate-products';
      case PnnsGroup2.ICE_CREAM:
        return 'ice-cream';
      default:
        return '';
    }
  }
}
