import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  int currentStep = 0; // 현재 단계
  String selectedPurpose = ""; // 선택한 목적 (브리더/업체 or 개인사육자)
  String businessNumber = ""; // 완성된 사업자 등록번호
  String firstPart = ""; // 사업자번호 첫 번째 입력
  String middlePart = ""; // 사업자번호 중간 입력
  String lastPart = ""; // 사업자번호 마지막 입력
  String NickName = ""; // 브리더 이름
  String personalName = ""; // 개인사육자 이름
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

    // 모든 파트가 입력되었는지 확인 후 businessNumber 업데이트
    if (firstPart.length == 3 &&
        middlePart.length == 2 &&
        lastPart.length == 5) {
      businessNumber = "$firstPart$middlePart$lastPart"; // '-' 없이 저장
    } else {
      businessNumber = ""; // 입력이 완성되지 않으면 초기화
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

  bool get isPurposeSelected => selectedPurpose.isNotEmpty;
}
