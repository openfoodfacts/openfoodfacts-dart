enum VeganStatus {
  VEGAN,
  NON_VEGAN,
  MAYBE_VEGAN,
  VEGAN_STATUS_UNKNOWN,
}

enum VegetarianStatus {
  VEGETARIAN,
  NON_VEGETARIAN,
  MAYBE_VEGETARIAN,
  VEGETARIAN_STATUS_UNKNOWN,
}

enum PalmOilFreeStatus {
  PALM_OIL_FREE,
  PALM_OIL,
  MAY_CONTAIN_PALM_OIL,
  PALM_OIL_CONTENT_UNKNOWN,
}

class IngredientsAnalysisTags {
  IngredientsAnalysisTags(List<dynamic> data) {
    if (data.contains('en:vegan')) {
      veganStatus = VeganStatus.VEGAN;
    }
    if (data.contains('en:non-vegan')) {
      veganStatus = VeganStatus.NON_VEGAN;
    }
    if (data.contains('en:maybe-vegan')) {
      veganStatus = VeganStatus.MAYBE_VEGAN;
    }
    if (data.contains('en:vegan-status-unknown')) {
      veganStatus = VeganStatus.VEGAN_STATUS_UNKNOWN;
    }

    if (data.contains('en:vegetarian')) {
      vegetarianStatus = VegetarianStatus.VEGETARIAN;
    }
    if (data.contains('en:non-vegetarian')) {
      vegetarianStatus = VegetarianStatus.NON_VEGETARIAN;
    }
    if (data.contains('en:maybe-vegetarian')) {
      vegetarianStatus = VegetarianStatus.MAYBE_VEGETARIAN;
    }
    if (data.contains('en:vegetarian-status-unknown')) {
      vegetarianStatus = VegetarianStatus.VEGETARIAN_STATUS_UNKNOWN;
    }

    if (data.contains('en:palm-oil-free')) {
      palmOilFreeStatus = PalmOilFreeStatus.PALM_OIL_FREE;
    }
    if (data.contains('en:palm-oil')) {
      palmOilFreeStatus = PalmOilFreeStatus.PALM_OIL;
    }
    if (data.contains('en:may-contain-palm-oil')) {
      palmOilFreeStatus = PalmOilFreeStatus.MAY_CONTAIN_PALM_OIL;
    }
    if (data.contains('en:palm-oil-content-unknown')) {
      palmOilFreeStatus = PalmOilFreeStatus.PALM_OIL_CONTENT_UNKNOWN;
    }

    veganStatus ??= VeganStatus.VEGAN_STATUS_UNKNOWN;

    vegetarianStatus ??= VegetarianStatus.VEGETARIAN_STATUS_UNKNOWN;

    palmOilFreeStatus ??= PalmOilFreeStatus.PALM_OIL_CONTENT_UNKNOWN;
  }

  VeganStatus? veganStatus;
  VegetarianStatus? vegetarianStatus;
  PalmOilFreeStatus? palmOilFreeStatus;

  static IngredientsAnalysisTags? fromJson(List<dynamic>? data) {
    return data != null ? IngredientsAnalysisTags(data) : null;
  }

  static List<dynamic> toJson(
      IngredientsAnalysisTags? ingredientsAnalysisTags) {
    List<String> result = <String>[];

    if (ingredientsAnalysisTags == null) {
      result.add('en:maybe-vegan');
      result.add('en:maybe-vegetarian');
      result.add('en:maybe-palm-oil-free');
      return result;
    }

    switch (ingredientsAnalysisTags.veganStatus) {
      case VeganStatus.VEGAN:
        result.add('en:vegan');
        break;
      case VeganStatus.NON_VEGAN:
        result.add('en:non-vegan');
        break;
      case VeganStatus.MAYBE_VEGAN:
        result.add('en:maybe-vegan');
        break;
      case VeganStatus.VEGAN_STATUS_UNKNOWN:
        result.add('en:vegan-status-unknown');
        break;
      default:
        break;
    }

    switch (ingredientsAnalysisTags.vegetarianStatus) {
      case VegetarianStatus.VEGETARIAN:
        result.add('en:vegetarian');
        break;
      case VegetarianStatus.NON_VEGETARIAN:
        result.add('en:non-vegetarian');
        break;
      case VegetarianStatus.MAYBE_VEGETARIAN:
        result.add('en:maybe-vegetarian');
        break;
      case VegetarianStatus.VEGETARIAN_STATUS_UNKNOWN:
        result.add('en:vegetarian-status-unknown');
        break;
      default:
        break;
    }

    switch (ingredientsAnalysisTags.palmOilFreeStatus) {
      case PalmOilFreeStatus.PALM_OIL_FREE:
        result.add('en:palm-oil-free');
        break;
      case PalmOilFreeStatus.PALM_OIL:
        result.add('en:palm-oil');
        break;
      case PalmOilFreeStatus.MAY_CONTAIN_PALM_OIL:
        result.add('en:may-contain-palm-oil');
        break;
      case PalmOilFreeStatus.PALM_OIL_CONTENT_UNKNOWN:
        result.add('en:palm-oil-content-unknown');
        break;
      default:
        break;
    }

    return result;
  }
}
