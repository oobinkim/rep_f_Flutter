import 'package:flutter/material.dart';
import '../services/user_services/user_services.dart';
import '../models/user_models/user_models.dart';

class RegistrationViewModel extends ChangeNotifier {
  final UserService _userService = UserService();

  String email = '';
  String password = '';
  String userName = '';
  String userType = 'regular'; // 기본값: 일반 사용자

  String errorMessage = '';
  bool isLoading = false;

  // 회원가입 로직
  Future<UserModel?> register() async {
    isLoading = true;
    notifyListeners();

    try {
      final user = await _userService.registerUser(
        email: email,
        password: password,
        userName: userName,
        userType: userType,
      );

      errorMessage = '';
      return user;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
