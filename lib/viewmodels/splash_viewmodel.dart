import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  bool _showButtons = false;

  bool get showButtons => _showButtons;

  void showButtonsAfterDelay() async {
    await Future.delayed(const Duration(seconds: 2));
    _showButtons = true;
    notifyListeners();
  }

  void navigateToAgreement(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/agreement');
  }
}
