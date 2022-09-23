enum VeganStatus {
  VEGAN,
  NON_VEGAN,
  MAYBE_VEGAN,
  VEGAN_STATUS_UNKNOWN,
}

extension VeganStatusExtension on VeganStatus {
  static const Map<VeganStatus, String> _tags = {
    VeganStatus.VEGAN: 'en:vegan',
    VeganStatus.NON_VEGAN: 'en:non-vegan',
    VeganStatus.MAYBE_VEGAN: 'en:maybe-vegan',
    VeganStatus.VEGAN_STATUS_UNKNOWN: 'en:vegan-status-unknown',
  };
  String get tag => _tags[this]!;
}

enum VegetarianStatus {
  VEGETARIAN,
  NON_VEGETARIAN,
  MAYBE_VEGETARIAN,
  VEGETARIAN_STATUS_UNKNOWN,
}

extension VegetarianStatusExtension on VegetarianStatus {
  static const Map<VegetarianStatus, String> _tags = {
    VegetarianStatus.VEGETARIAN: 'en:vegetarian',
    VegetarianStatus.NON_VEGETARIAN: 'en:non-vegetarian',
    VegetarianStatus.MAYBE_VEGETARIAN: 'en:maybe-vegetarian',
    VegetarianStatus.VEGETARIAN_STATUS_UNKNOWN: 'en:vegetarian-status-unknown',
  };
  String get tag => _tags[this]!;
}

enum PalmOilFreeStatus {
  PALM_OIL_FREE,
  PALM_OIL,
  MAY_CONTAIN_PALM_OIL,
  PALM_OIL_CONTENT_UNKNOWN,
}

extension PalmOilFreeStatusExtension on PalmOilFreeStatus {
  static const Map<PalmOilFreeStatus, String> _tags = {
    PalmOilFreeStatus.PALM_OIL_FREE: 'en:palm-oil-free',
    PalmOilFreeStatus.PALM_OIL: 'en:palm-oil',
    PalmOilFreeStatus.MAY_CONTAIN_PALM_OIL: 'en:may-contain-palm-oil',
    PalmOilFreeStatus.PALM_OIL_CONTENT_UNKNOWN: 'en:palm-oil-content-unknown',
  };
  String get tag => _tags[this]!;
}

class IngredientsAnalysisTags {
  IngredientsAnalysisTags(List<dynamic> data) {
    veganStatus = _getVeganStatus(data);
    vegetarianStatus = _getVegetarianStatus(data);
    palmOilFreeStatus = _getPalmOilFreeStatus(data);
  }

  static VeganStatus? _getVeganStatus(List<dynamic> data) {
    for (final VeganStatus status in VeganStatus.values) {
      if (data.contains(status.tag)) {
        return status;
      }
    }
    return null;
  }

  static VegetarianStatus? _getVegetarianStatus(List<dynamic> data) {
    for (final VegetarianStatus status in VegetarianStatus.values) {
      if (data.contains(status.tag)) {
        return status;
      }
    }
    return null;
  }

  static PalmOilFreeStatus? _getPalmOilFreeStatus(List<dynamic> data) {
    for (final PalmOilFreeStatus status in PalmOilFreeStatus.values) {
      if (data.contains(status.tag)) {
        return status;
      }
    }
    return null;
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

    if (ingredientsAnalysisTags.veganStatus != null) {
      result.add(ingredientsAnalysisTags.veganStatus!.tag);
    }
    if (ingredientsAnalysisTags.vegetarianStatus != null) {
      result.add(ingredientsAnalysisTags.vegetarianStatus!.tag);
    }
    if (ingredientsAnalysisTags.palmOilFreeStatus != null) {
      result.add(ingredientsAnalysisTags.palmOilFreeStatus!.tag);
    }

    return result;
  }
}
