import 'package:flutter/material.dart';

class RegisterReptileViewModel extends ChangeNotifier {
  String _name = '';
  String _gender = '';
  String _hatchDate = '';
  String _lastMatingDate = '';
  bool _isHatchUnknown = false;
  bool _isMatingUnknown = false;
  bool _isMatingNotDone = false;

  // 이름 관련
  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  // 성별 관련
  void setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  String get gender => _gender;

  // 해칭일 관련
  String get hatchDate => _hatchDate;

  set hatchDate(String value) {
    _hatchDate = value;
    notifyListeners();
  }

  bool get isHatchUnknown => _isHatchUnknown;

  void toggleHatchUnknown(bool? value) {
    _isHatchUnknown = value ?? false;
    notifyListeners();
  }

  // 마지막 메이팅일 관련
  String get lastMatingDate => _lastMatingDate;

  set lastMatingDate(String value) {
    _lastMatingDate = value;
    notifyListeners();
  }

  bool get isMatingUnknown => _isMatingUnknown;

  void toggleMatingUnknown(bool? value) {
    _isMatingUnknown = value ?? false;
    notifyListeners();
  }

  bool get isMatingNotDone => _isMatingNotDone;

  void toggleMatingNotDone(bool? value) {
    _isMatingNotDone = value ?? false;
    notifyListeners();
  }
}
