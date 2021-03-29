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
    veganStatus = _getVeganStatus(data);
    vegetarianStatus = _getVegetarianStatus(data);
    palmOilFreeStatus = _getPalmOilFreeStatus(data);
  }

  static const List<String> _VEGAN_TAGS = [
    'en:vegan',
    'en:non-vegan',
    'en:maybe-vegan',
    'en:vegan-status-unknown',
  ];

  static const List<VeganStatus> _VEGAN_STATUSES = [
    VeganStatus.VEGAN,
    VeganStatus.NON_VEGAN,
    VeganStatus.MAYBE_VEGAN,
    VeganStatus.VEGAN_STATUS_UNKNOWN,
  ];

  static const List<String> _VEGETARIAN_TAGS = [
    'en:vegetarian',
    'en:non-vegetarian',
    'en:maybe-vegetarian',
    'en:vegetarian-status-unknown',
  ];

  static const List<VegetarianStatus> _VEGETARIAN_STATUSES = [
    VegetarianStatus.VEGETARIAN,
    VegetarianStatus.NON_VEGETARIAN,
    VegetarianStatus.MAYBE_VEGETARIAN,
    VegetarianStatus.VEGETARIAN_STATUS_UNKNOWN,
  ];

  static const List<String> _PALM_OIL_FREE_TAGS = [
    'en:palm-oil-free',
    'en:palm-oil',
    'en:may-contain-palm-oil',
    'en:palm-oil-content-unknown',
  ];

  static const List<PalmOilFreeStatus> _PALM_OIL_FREE_STATUSES = [
    PalmOilFreeStatus.PALM_OIL_FREE,
    PalmOilFreeStatus.PALM_OIL,
    PalmOilFreeStatus.MAY_CONTAIN_PALM_OIL,
    PalmOilFreeStatus.PALM_OIL_CONTENT_UNKNOWN,
  ];

  static VeganStatus? _getVeganStatus(List<dynamic> data) {
    VeganStatus? result;
    _VEGAN_TAGS.asMap().forEach((key, value) {
      if (data.contains(value)) {
        result = _VEGAN_STATUSES[key];
      }
    });
    return result;
  }

  static VegetarianStatus? _getVegetarianStatus(List<dynamic> data) {
    VegetarianStatus? result;
    _VEGETARIAN_TAGS.asMap().forEach((key, value) {
      if (data.contains(value)) {
        result = _VEGETARIAN_STATUSES[key];
      }
    });
    return result;
  }

  static PalmOilFreeStatus? _getPalmOilFreeStatus(List<dynamic> data) {
    PalmOilFreeStatus? result;
    _PALM_OIL_FREE_TAGS.asMap().forEach((key, value) {
      if (data.contains(value)) {
        result = _PALM_OIL_FREE_STATUSES[key];
      }
    });
    return result;
  }

  VeganStatus? veganStatus;
  VegetarianStatus? vegetarianStatus;
  PalmOilFreeStatus? palmOilFreeStatus;

  static IngredientsAnalysisTags? fromJson(List<dynamic>? data) {
    return data != null ? IngredientsAnalysisTags(data) : null;
  }

  static List<String> toJson(IngredientsAnalysisTags? ingredientsAnalysisTags) {
    List<String> result = <String>[];

    if (ingredientsAnalysisTags == null) {
      return result;
    }

    _VEGAN_STATUSES.asMap().forEach((key, value) {
      if (ingredientsAnalysisTags.veganStatus == value) {
        result.add(_VEGAN_TAGS[key]);
      }
    });

    _VEGETARIAN_STATUSES.asMap().forEach((key, value) {
      if (ingredientsAnalysisTags.vegetarianStatus == value) {
        result.add(_VEGETARIAN_TAGS[key]);
      }
    });

    _PALM_OIL_FREE_STATUSES.asMap().forEach((key, value) {
      if (ingredientsAnalysisTags.palmOilFreeStatus == value) {
        result.add(_PALM_OIL_FREE_TAGS[key]);
      }
    });

    return result;
  }
}
