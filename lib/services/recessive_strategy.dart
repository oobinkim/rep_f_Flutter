import '../models/morph_models.dart';
import '../services/morph_calculator_services.dart';
/*
*열성 계산
 */
class RecessiveStrategy implements InheritanceStrategy {
  @override
  Map<String, double> calculate(Morph parent1, Morph parent2) {
    return {
      parent1.name: 0.25,
      "Het ${parent1.name}": 0.50,
      "Normal": 0.25
    };
  }
}