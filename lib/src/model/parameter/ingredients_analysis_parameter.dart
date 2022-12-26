import '../../interface/parameter.dart';
import '../ingredients_analysis_tags.dart';

/// Ingredients Analysis search API parameter.
class IngredientsAnalysisParameter extends Parameter {
  @override
  String getName() => 'ingredients_analysis_tags';

  @override
  String getValue() {
    final List<String> result = <String>[];
    if (veganStatus != null) {
      result.add(veganStatus!.offTag);
    }
    if (vegetarianStatus != null) {
      result.add(vegetarianStatus!.offTag);
    }
    if (palmOilFreeStatus != null) {
      result.add(palmOilFreeStatus!.offTag);
    }
    if (result.isEmpty) {
      return '';
    }
    return result.join(',');
  }

  final VeganStatus? veganStatus;
  final VegetarianStatus? vegetarianStatus;
  final PalmOilFreeStatus? palmOilFreeStatus;

  const IngredientsAnalysisParameter({
    this.veganStatus,
    this.vegetarianStatus,
    this.palmOilFreeStatus,
  });
}
