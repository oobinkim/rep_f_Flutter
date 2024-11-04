import '../models/morph_calculator_models/morph_models.dart';
import '../services/morph_calculator_services/morph_calculator_services.dart';
import 'package:flutter/foundation.dart';

class MorphCalculatorViewModel extends ChangeNotifier {
  List<Morph> morphs = [];
  String searchText = "";
  Morph? selectedParent1;
  Morph? selectedParent2;
  Map<String, double> result = {};

  final MorphCalculator morphCalculator = MorphCalculator();

  MorphCalculatorViewModel() {
    morphs = MorphManager().getMorphs();
  }

  List<Morph> get filteredMorphs {
    if (searchText.isEmpty) {
      return morphs;
    } else {
      return morphs.where((morph) =>
          morph.name.toLowerCase().contains(searchText.toLowerCase())).toList();
    }
  }

  void selectParent1(Morph morph) {
    selectedParent1 = morph;
    searchText = "";
    notifyListeners();
  }

  void selectParent2(Morph morph) {
    selectedParent2 = morph;
    searchText = "";
    notifyListeners();
  }

  void calculateProbability() {
    if (selectedParent1 != null && selectedParent2 != null) {
      result = morphCalculator.calculateProbability(
        selectedParent1!,
        selectedParent2!,
      );
      notifyListeners();
    }
  }
}