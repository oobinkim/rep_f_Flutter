import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  Future<void> navigateToNextScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacementNamed(context, '/registration'); // 회원가입 화면으로 이동
  }
}
