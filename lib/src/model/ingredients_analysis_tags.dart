import 'off_tagged.dart';

enum VeganStatus implements OffTagged {
  VEGAN(offTag: 'en:vegan'),
  NON_VEGAN(offTag: 'en:non-vegan'),
  MAYBE_VEGAN(offTag: 'en:maybe-vegan'),
  VEGAN_STATUS_UNKNOWN(offTag: 'en:vegan-status-unknown');

  const VeganStatus({
    required this.offTag,
  });

  @override
  final String offTag;
}

enum VegetarianStatus implements OffTagged {
  VEGETARIAN(offTag: 'en:vegetarian'),
  NON_VEGETARIAN(offTag: 'en:non-vegetarian'),
  MAYBE_VEGETARIAN(offTag: 'en:maybe-vegetarian'),
  VEGETARIAN_STATUS_UNKNOWN(offTag: 'en:vegetarian-status-unknown');

  const VegetarianStatus({
    required this.offTag,
  });

  @override
  final String offTag;
}

enum PalmOilFreeStatus implements OffTagged {
  PALM_OIL_FREE(offTag: 'en:palm-oil-free'),
  PALM_OIL(offTag: 'en:palm-oil'),
  MAY_CONTAIN_PALM_OIL(offTag: 'en:may-contain-palm-oil'),
  PALM_OIL_CONTENT_UNKNOWN(offTag: 'en:palm-oil-content-unknown');

  const PalmOilFreeStatus({
    required this.offTag,
  });

  @override
  final String offTag;
}

class IngredientsAnalysisTags {
  IngredientsAnalysisTags(List<dynamic> data) {
    veganStatus = _getVeganStatus(data);
    vegetarianStatus = _getVegetarianStatus(data);
    palmOilFreeStatus = _getPalmOilFreeStatus(data);
  }

  static VeganStatus? _getVeganStatus(List<dynamic> data) {
    for (final VeganStatus status in VeganStatus.values) {
      if (data.contains(status.offTag)) {
        return status;
      }
    }
    return null;
  }

  static VegetarianStatus? _getVegetarianStatus(List<dynamic> data) {
    for (final VegetarianStatus status in VegetarianStatus.values) {
      if (data.contains(status.offTag)) {
        return status;
      }
    }
    return null;
  }

  static PalmOilFreeStatus? _getPalmOilFreeStatus(List<dynamic> data) {
    for (final PalmOilFreeStatus status in PalmOilFreeStatus.values) {
      if (data.contains(status.offTag)) {
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
      result.add(ingredientsAnalysisTags.veganStatus!.offTag);
    }
    if (ingredientsAnalysisTags.vegetarianStatus != null) {
      result.add(ingredientsAnalysisTags.vegetarianStatus!.offTag);
    }
    if (ingredientsAnalysisTags.palmOilFreeStatus != null) {
      result.add(ingredientsAnalysisTags.palmOilFreeStatus!.offTag);
    }

    return result;
  }
}
