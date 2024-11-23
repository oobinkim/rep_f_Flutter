import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationViewModel extends ChangeNotifier {
  int currentStep = 0; // 현재 단계
  PageController pageController = PageController(); // PageView 컨트롤러

  // 사용자 입력 데이터
  String name = '';
  String idNumber = ''; // 생년월일 앞 6자리
  String gender = ''; // 성별 (M: 남자, F: 여자)
  String phoneNumber = '';
  String carrier = '';
  String authCode = '';

  // 로딩 상태 및 에러 메시지
  bool isLoading = false;
  String errorMessage = '';

  // 다음 단계로 이동
  void nextStep() {
    if (currentStep < 3) {
      currentStep++;
      pageController.animateToPage(
        currentStep,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  // 이전 단계로 이동
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

  // Firestore에 데이터 저장
  Future<void> register() async {
    isLoading = true;
    notifyListeners();

    try {
      await FirebaseFirestore.instance.collection('users').add({
        'name': name,
        'idNumber': idNumber,
        'gender': gender,
        'phoneNumber': phoneNumber,
        'carrier': carrier,
        'authCode': authCode,
        'createdAt': FieldValue.serverTimestamp(),
      });
      errorMessage = '';
    } catch (e) {
      errorMessage = "회원가입 중 오류가 발생했습니다: ${e.toString()}";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
