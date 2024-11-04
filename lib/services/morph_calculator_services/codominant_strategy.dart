import '../../models/morph_calculator_models/morph_models.dart';
import 'morph_calculator_services.dart';
/*
*공우성 계산
 */
class CodominantStrategy implements InheritanceStrategy {
  @override
  Map<String, double> calculate(Morph parent1, Morph parent2) {
    return {
      "${parent1.name}/${parent2.name}": 0.50,
      parent1.name: 0.25,
      parent2.name: 0.25
    };
  }
}