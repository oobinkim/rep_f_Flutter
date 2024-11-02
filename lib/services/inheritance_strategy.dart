import '../models/morph_models.dart';

abstract class InheritanceStrategy {
  Map<String, double> calculate(Morph parent1, Morph parent2);
}