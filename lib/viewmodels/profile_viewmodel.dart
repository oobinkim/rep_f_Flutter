import 'package:cloud_firestore/cloud_firestore.dart';
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

  // Firestore에 프로필 저장
  Future<void> saveProfile(String uid) async {
    try {
      final profileData = {
        'selectedPurpose': selectedPurpose,
        'businessNumber': businessNumber,
        'NickName': NickName,
        'personalName': personalName,
        'selectedSpecies': selectedSpecies,
      };

      await FirebaseFirestore.instance
          .collection('users') // 상위 컬렉션
          .doc(uid) // 사용자 문서
          .collection('profile') // 하위 컬렉션
          .doc('userProfile') // 프로필 문서
          .set(profileData);

      print("프로필 저장 성공: $profileData");
    } catch (e) {
      print("프로필 저장 실패: $e");
    }
  }
}
