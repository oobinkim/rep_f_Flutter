import '../models/morph_calculator_models/morph_models.dart';
import '../services/morph_calculator_services.dart';
/*
*우성 계산
 */
class DominantStrategy implements InheritanceStrategy {
  @override
  Map<String, double> calculate(Morph parent1, Morph parent2) {
    return {
      "Het ${parent2.name}": 0.50,
      parent1.name: 0.50
    };
  }
}