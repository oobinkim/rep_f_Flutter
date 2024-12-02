import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  int currentStep = 0;
  String selectedPurpose = "";
  String businessNumber = "";
  String firstPart = "";
  String middlePart = "";
  String lastPart = "";
  String NickName = "";
  String personalName = "";
  String selectedSpecies = ""; // 단일 선택으로 변경
  PageController pageController = PageController();

  void nextStep() {
    currentStep++;
    pageController.animateToPage(
      currentStep,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
      pageController.animateToPage(
        currentStep,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  void selectPurpose(String purpose) {
    selectedPurpose = purpose;
    notifyListeners();
  }

  void updateBusinessNumberParts(String part, String value) {
    if (part == "first") {
      firstPart = value;
    } else if (part == "middle") {
      middlePart = value;
    } else if (part == "last") {
      lastPart = value;
    }

    if (firstPart.length == 3 &&
        middlePart.length == 2 &&
        lastPart.length == 5) {
      businessNumber = "$firstPart$middlePart$lastPart";
    } else {
      businessNumber = "";
    }
    notifyListeners();
  }

  void updateNickName(String name) {
    NickName = name;
    notifyListeners();
  }

  void updatePersonalName(String name) {
    personalName = name;
    notifyListeners();
  }

  void updateSelectedSpecies(String species) {
    selectedSpecies = species; // 단일 선택 처리
    notifyListeners();
  }

  bool get isPurposeSelected => selectedPurpose.isNotEmpty;
}
