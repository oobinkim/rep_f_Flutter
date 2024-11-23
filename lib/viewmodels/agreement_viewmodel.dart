import 'package:flutter/material.dart';

class AgreementViewModel extends ChangeNotifier {
  void navigateToRegistration(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/registration');
  }
  void navigateToSplash(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/splash');
  }
}
