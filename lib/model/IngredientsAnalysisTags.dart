enum VeganStatus { IS_VEGAN, IS_NOT_VEGAN, MAYBE }

enum VegetarianStatus { IS_VEGETARIAN, IS_NOT_VEGETARIAN, MAYBE }

enum PalmOilFreeStatus { IS_PALM_OIL_FREE, IS_NOT_PALM_OIL_FREE, MAYBE }

class IngredientsAnalysisTags {
  IngredientsAnalysisTags(List<dynamic> data) {
    if (data.contains('en:vegan')) {
      veganStatus = VeganStatus.IS_VEGAN;
    }

    if (data.contains('en:vegetarian')) {
      vegetarianStatus = VegetarianStatus.IS_VEGETARIAN;
    }

    if (data.contains('en:palm-oil-free')) {
      palmOilFreeStatus = PalmOilFreeStatus.IS_PALM_OIL_FREE;
    }

    if (data.contains('en:non-vegan')) {
      veganStatus = VeganStatus.IS_NOT_VEGAN;
    }

    if (data.contains('en:non-vegetarian')) {
      vegetarianStatus = VegetarianStatus.IS_NOT_VEGETARIAN;
    }

    if (data.contains('en:non-palm-oil-free')) {
      palmOilFreeStatus = PalmOilFreeStatus.IS_NOT_PALM_OIL_FREE;
    }

    veganStatus ??= VeganStatus.MAYBE;

    vegetarianStatus ??= VegetarianStatus.MAYBE;

    palmOilFreeStatus ??= PalmOilFreeStatus.MAYBE;
  }

  VeganStatus veganStatus;
  VegetarianStatus vegetarianStatus;
  PalmOilFreeStatus palmOilFreeStatus;

  static IngredientsAnalysisTags fromJson(List<dynamic> data) {
    return data != null ? IngredientsAnalysisTags(data) : null;
  }

  static List<dynamic> toJson(IngredientsAnalysisTags ingredientsAnalysisTags) {
    List<String> result = <String>[];

    if (ingredientsAnalysisTags == null) {
      result.add('en:maybe-vegan');
      result.add('en:maybe-vegetarian');
      result.add('en:maybe-palm-oil-free');
      return result;
    }

    switch (ingredientsAnalysisTags.veganStatus) {
      case VeganStatus.IS_VEGAN:
        result.add('en:vegan');
        break;
      case VeganStatus.IS_NOT_VEGAN:
        result.add('en:non-vegan');
        break;
      case VeganStatus.MAYBE:
        result.add('en:maybe-vegan');
        break;
    }

    switch (ingredientsAnalysisTags.vegetarianStatus) {
      case VegetarianStatus.IS_VEGETARIAN:
        result.add('en:vegetarian');
        break;
      case VegetarianStatus.IS_NOT_VEGETARIAN:
        result.add('en:non-vegetarian');
        break;
      case VegetarianStatus.MAYBE:
        result.add('en:maybe-vegetarian');
        break;
    }

    switch (ingredientsAnalysisTags.palmOilFreeStatus) {
      case PalmOilFreeStatus.IS_PALM_OIL_FREE:
        result.add('en:palm-oil-free');
        break;
      case PalmOilFreeStatus.IS_NOT_PALM_OIL_FREE:
        result.add('en:non-palm-oil-free');
        break;
      case PalmOilFreeStatus.MAYBE:
        result.add('en:maybe-palm-oil-free');
        break;
    }

    return result;
  }
}
