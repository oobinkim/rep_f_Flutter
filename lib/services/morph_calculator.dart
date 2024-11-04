import '../models/morph_calculator_models/morph_models.dart';
import '../services/morph_calculator_services.dart';
/*
* 모프 계산기 로직
* */

class MorphCalculator {
  InheritanceStrategy? _strategy;

  void setStrategy(InheritanceType inheritanceType) {
    switch (inheritanceType) {
      case InheritanceType.dominant:
        _strategy = DominantStrategy();
        break;
      case InheritanceType.recessive:
        _strategy = RecessiveStrategy();
        break;
      case InheritanceType.polygenic:
        _strategy = PolygenicStrategy();
        break;
      case InheritanceType.codominant:
        _strategy = CodominantStrategy();
        break;
    }
  }

  Map<String, double> calculateProbability(Morph parent1, Morph parent2) {
    setStrategy(parent1.inheritanceType);
    return _strategy?.calculate(parent1, parent2) ?? {};
  }
}