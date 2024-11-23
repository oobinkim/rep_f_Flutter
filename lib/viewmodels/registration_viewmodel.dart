import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationViewModel extends ChangeNotifier {
  int currentStep = 0; // 현재 단계
  PageController pageController = PageController(); // PageView 컨트롤러

  // 사용자 입력 데이터
  String name = '';
  String birthDate = ''; // 생년월일 앞 6자리
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

  // Firestore에 기본 데이터 저장
  Future<void> register(String uid) async {
    isLoading = true;
    notifyListeners();

    try {
      // Firestore에 기본 데이터 저장
      final userData = {
        'userName': name,
        'birthDate': birthDate,
        'gender': gender,
        'phoneNumber': phoneNumber,
        'carrier': carrier,
        'createdAt': FieldValue.serverTimestamp(),
      };

      await FirebaseFirestore.instance.collection('users').doc(uid).set(userData);

      errorMessage = '';
      print("사용자 등록 성공: $userData");
    } catch (e) {
      errorMessage = "회원가입 중 오류가 발생했습니다: ${e.toString()}";
      print(errorMessage);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Firestore에 userType 업데이트
  Future<void> updateUserType(String uid, String userType) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({'userType': userType});

      print("사용자 타입 업데이트 성공: $userType");
    } catch (e) {
      print("사용자 타입 업데이트 실패: ${e.toString()}");
    }
  }

  void navigateToAgreement(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/agreement');
  }
}


