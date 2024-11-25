import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  String selectedPurpose = ""; // 선택한 목적

  void selectPurpose(String purpose) {
    selectedPurpose = purpose;
    notifyListeners();
  }

  bool get isPurposeSelected => selectedPurpose.isNotEmpty;
}
