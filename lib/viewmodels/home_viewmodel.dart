import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  void navigateToRegisterReptile(BuildContext context) {
    Navigator.pushNamed(context, '/register_reptile');
  }
}
