import '../../models/morph_calculator_models/morph_models.dart';
import 'morph_calculator_services.dart';
/*
*다인자 계산
 */
class PolygenicStrategy implements InheritanceStrategy {
  @override
  Map<String, double> calculate(Morph parent1, Morph parent2) {
    return {
      parent1.name: 0.5,
      parent2.name: 0.5
    };
  }
}