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
  WATERS_AND_FLAVOURED_WATERS,
  FRUIT_NECTAR,
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

  DRESSING_AND_SAUCES,
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
        break;
      case PnnsGroup1.CEREALS_AND_POTATOES:
        return 'Cereals and potatoes';
        break;
      case PnnsGroup1.COMPOSITE_FOODS:
        return 'Composite foods';
        break;
      case PnnsGroup1.FAT_AND_SAUCES:
        return 'Fat and sauces';
        break;
      case PnnsGroup1.FISH_MEAT_AND_EGGS:
        return 'Fish, meat and eggs';
        break;
      case PnnsGroup1.FRUITS_AND_VEGETABLES:
        return 'Fruits and vegetables';
        break;
      case PnnsGroup1.MILK_AND_DAIRIES:
        return 'Milk and dairies';
        break;
      case PnnsGroup1.SALTY_SNACKS:
        return 'Salty snacks';
        break;
      case PnnsGroup1.SUGARY_SNACKS:
        return 'Sugary snacks';
        break;
      default:
        return 'PNNS group 1';
        break;
    }
  }

  List<PnnsGroup2> get subGroups {
    switch (this) {
      case PnnsGroup1.BEVERAGES:
        return <PnnsGroup2>[
          PnnsGroup2.FRUIT_JUICES,
          PnnsGroup2.SWEETENED_BEVERAGES,
          PnnsGroup2.ALCOHOLIC_BEVERAGES,
          PnnsGroup2.UNSWEETENED_BEVERAGES,
          PnnsGroup2.ARTIFICIALLY_SWEETENED_BEVERAGES,
          PnnsGroup2.WATERS_AND_FLAVOURED_WATERS,
          PnnsGroup2.FRUIT_NECTAR,
          PnnsGroup2.TEAS_AND_HERBAL_TEAS_AND_COFFEES
        ];
        break;
      case PnnsGroup1.CEREALS_AND_POTATOES:
        return <PnnsGroup2>[
          PnnsGroup2.BREAKFAST_CEREALS,
          PnnsGroup2.PASTRIES,
          PnnsGroup2.POTATOES,
          PnnsGroup2.CEREALS,
          PnnsGroup2.BREAD
        ];
        break;
      case PnnsGroup1.COMPOSITE_FOODS:
        return <PnnsGroup2>[
          PnnsGroup2.PIZZA_PIES_AND_QUICHE,
          PnnsGroup2.SANDWICHES,
          PnnsGroup2.SOUPS,
          PnnsGroup2.ONE_DISH_MEALS,
        ];
        break;
      case PnnsGroup1.FAT_AND_SAUCES:
        return <PnnsGroup2>[PnnsGroup2.DRESSING_AND_SAUCES, PnnsGroup2.FATS];
        break;
      case PnnsGroup1.FISH_MEAT_AND_EGGS:
        return <PnnsGroup2>[
          PnnsGroup2.PROCESSED_MEAT,
          PnnsGroup2.MEAT,
          PnnsGroup2.FISH_AND_SEAFOOD,
          PnnsGroup2.OFFALS
        ];
        break;
      case PnnsGroup1.FRUITS_AND_VEGETABLES:
        return <PnnsGroup2>[
          PnnsGroup2.FRUITS,
          PnnsGroup2.VEGETABLES,
          PnnsGroup2.DRIED_FRUITS,
          PnnsGroup2.NUTS,
          PnnsGroup2.LEGUMES,
        ];
        break;
      case PnnsGroup1.MILK_AND_DAIRIES:
        return <PnnsGroup2>[
          PnnsGroup2.MILK_AND_YOGURT,
          PnnsGroup2.DAIRY_DESSERTS,
          PnnsGroup2.CHEESE,
          PnnsGroup2.PLANT_BASED_MILK_SUBSTITUTES,
        ];
        break;
      case PnnsGroup1.SALTY_SNACKS:
        return <PnnsGroup2>[
          PnnsGroup2.APPETIZERS,
          PnnsGroup2.SALTY_AND_FATTY_PRODUCTS,
        ];
        break;
      case PnnsGroup1.SUGARY_SNACKS:
        return <PnnsGroup2>[
          PnnsGroup2.SWEETS,
          PnnsGroup2.CHOCOLATE_PRODUCTS,
          PnnsGroup2.ICE_CREAM
        ];
        break;
      default:
        return null;
        break;
    }
  }
}

extension PnnsGroup2Extension on PnnsGroup2 {
  String get name {
    switch (this) {
      case PnnsGroup2.FRUIT_JUICES:
        return 'Fruit juices';
        break;
      case PnnsGroup2.SWEETENED_BEVERAGES:
        return 'Sweetened beverages';
        break;
      case PnnsGroup2.ALCOHOLIC_BEVERAGES:
        return 'Alcoholic beverages';
        break;
      case PnnsGroup2.UNSWEETENED_BEVERAGES:
        return 'unsweetened beverages';
        break;
      case PnnsGroup2.ARTIFICIALLY_SWEETENED_BEVERAGES:
        return 'Artificially sweetened beverages';
        break;
      case PnnsGroup2.WATERS_AND_FLAVOURED_WATERS:
        return 'Waters and flavoured waters';
        break;
      case PnnsGroup2.FRUIT_NECTAR:
        return 'Fruits nectar';
        break;
      case PnnsGroup2.TEAS_AND_HERBAL_TEAS_AND_COFFEES:
        return 'Teas and herbal teas and coffees';
        break;
      case PnnsGroup2.BREAKFAST_CEREALS:
        return 'Breakfast cereals';
        break;
      case PnnsGroup2.PASTRIES:
        return 'Pastries';
        break;
      case PnnsGroup2.POTATOES:
        return 'Potatoes';
        break;
      case PnnsGroup2.CEREALS:
        return 'Cereals';
        break;
      case PnnsGroup2.BREAD:
        return 'Bread';
        break;
      case PnnsGroup2.PIZZA_PIES_AND_QUICHE:
        return 'Pizza, pies and quiche';
        break;
      case PnnsGroup2.SANDWICHES:
        return 'Sandwiches';
        break;
      case PnnsGroup2.SOUPS:
        return 'Soups';
        break;
      case PnnsGroup2.ONE_DISH_MEALS:
        return 'One dish meals';
        break;
      case PnnsGroup2.DRESSING_AND_SAUCES:
        return 'Dressing and sauces';
        break;
      case PnnsGroup2.FATS:
        return 'Fats';
        break;
      case PnnsGroup2.PROCESSED_MEAT:
        return 'Processed meat';
        break;
      case PnnsGroup2.MEAT:
        return 'Meat';
        break;
      case PnnsGroup2.FISH_AND_SEAFOOD:
        return 'Fish and seafood';
        break;
      case PnnsGroup2.OFFALS:
        return 'Offals';
        break;
      case PnnsGroup2.FRUITS:
        return 'Fruits';
        break;
      case PnnsGroup2.VEGETABLES:
        return 'Vegetables';
        break;
      case PnnsGroup2.DRIED_FRUITS:
        return 'Dried fruits';
        break;
      case PnnsGroup2.NUTS:
        return 'Nuts';
        break;
      case PnnsGroup2.LEGUMES:
        return 'Legumes';
        break;
      case PnnsGroup2.MILK_AND_YOGURT:
        return 'Milk and yogurt';
        break;
      case PnnsGroup2.DAIRY_DESSERTS:
        return 'Dairy desserts';
        break;
      case PnnsGroup2.CHEESE:
        return 'Cheese';
        break;
      case PnnsGroup2.PLANT_BASED_MILK_SUBSTITUTES:
        return 'Plant based milk substitutes';
        break;
      case PnnsGroup2.APPETIZERS:
        return 'Appetizers';
        break;
      case PnnsGroup2.SALTY_AND_FATTY_PRODUCTS:
        return 'Salty and fatty products';
        break;
      case PnnsGroup2.SWEETS:
        return 'Sweets';
        break;
      case PnnsGroup2.CHOCOLATE_PRODUCTS:
        return 'Chocolate products';
        break;
      case PnnsGroup2.ICE_CREAM:
        return 'Ice cream';
        break;
      default:
        return 'PNNS group 2';
        break;
    }
  }

  String get id {
    switch (this) {
      case PnnsGroup2.FRUIT_JUICES:
        return 'fruit-juices';
        break;
      case PnnsGroup2.SWEETENED_BEVERAGES:
        return 'sweetened-beverages';
        break;
      case PnnsGroup2.ALCOHOLIC_BEVERAGES:
        return 'alcoholic-beverages';
        break;
      case PnnsGroup2.UNSWEETENED_BEVERAGES:
        return 'unsweetened-beverages';
        break;
      case PnnsGroup2.ARTIFICIALLY_SWEETENED_BEVERAGES:
        return 'artificially-sweetened-beverages';
        break;
      case PnnsGroup2.WATERS_AND_FLAVOURED_WATERS:
        return 'waters-and-flavoured-waters';
        break;
      case PnnsGroup2.FRUIT_NECTAR:
        return 'fruits-nectar';
        break;
      case PnnsGroup2.TEAS_AND_HERBAL_TEAS_AND_COFFEES:
        return 'teas-and-herbal-teas-and-coffees';
        break;
      case PnnsGroup2.BREAKFAST_CEREALS:
        return 'breakfast-cereals';
        break;
      case PnnsGroup2.PASTRIES:
        return 'pastries';
        break;
      case PnnsGroup2.POTATOES:
        return 'potatoes';
        break;
      case PnnsGroup2.CEREALS:
        return 'cereals';
        break;
      case PnnsGroup2.BREAD:
        return 'bread';
        break;
      case PnnsGroup2.PIZZA_PIES_AND_QUICHE:
        return 'pizza-pies-and-quiche';
        break;
      case PnnsGroup2.SANDWICHES:
        return 'sandwiches';
        break;
      case PnnsGroup2.SOUPS:
        return 'soups';
        break;
      case PnnsGroup2.ONE_DISH_MEALS:
        return 'one-dish-meals';
        break;
      case PnnsGroup2.DRESSING_AND_SAUCES:
        return 'dressing-and-sauces';
        break;
      case PnnsGroup2.FATS:
        return 'fats';
        break;
      case PnnsGroup2.PROCESSED_MEAT:
        return 'processed-meat';
        break;
      case PnnsGroup2.MEAT:
        return 'meat';
        break;
      case PnnsGroup2.FISH_AND_SEAFOOD:
        return 'fish-and-seafood';
        break;
      case PnnsGroup2.OFFALS:
        return 'offals';
        break;
      case PnnsGroup2.FRUITS:
        return 'fruits';
        break;
      case PnnsGroup2.VEGETABLES:
        return 'vegetables';
        break;
      case PnnsGroup2.DRIED_FRUITS:
        return 'dried-fruits';
        break;
      case PnnsGroup2.NUTS:
        return 'nuts';
        break;
      case PnnsGroup2.LEGUMES:
        return 'legumes';
        break;
      case PnnsGroup2.MILK_AND_YOGURT:
        return 'milk-and-yogurt';
        break;
      case PnnsGroup2.DAIRY_DESSERTS:
        return 'dairy-desserts';
        break;
      case PnnsGroup2.CHEESE:
        return 'cheese';
        break;
      case PnnsGroup2.PLANT_BASED_MILK_SUBSTITUTES:
        return 'plant-based-milk-substitutes';
        break;
      case PnnsGroup2.APPETIZERS:
        return 'appetizers';
        break;
      case PnnsGroup2.SALTY_AND_FATTY_PRODUCTS:
        return 'salty-and-fatty-products';
        break;
      case PnnsGroup2.SWEETS:
        return 'sweets';
        break;
      case PnnsGroup2.CHOCOLATE_PRODUCTS:
        return 'chocolate-products';
        break;
      case PnnsGroup2.ICE_CREAM:
        return 'ice-cream';
        break;
      default:
        return '';
        break;
    }
  }
}
