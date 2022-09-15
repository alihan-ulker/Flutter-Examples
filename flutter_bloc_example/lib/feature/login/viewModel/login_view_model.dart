import 'package:flutter/material.dart';

//login provider fonksiyonlari
class LoginViewModel extends ChangeNotifier {
  bool isCheckBoxOk = false;
  String? _inputText;

  bool isLoading = false;

//Remember me ye tiklaninca checkBox degisikligi kontrolu
  void checkBoxChange(bool value) {
    isCheckBoxOk = value;
    //degisikligin dinlenmesi icin
    notifyListeners();
  }

//login butonuna basildiginda
  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

//login button a basildiginda
//Circular a duration verip
//Login butonu kapatir
//circular calisir
  Future<bool> controlTextValue() async {
    _changeLoading();
    await Future.delayed(const Duration(seconds: 1));
    _changeLoading();

    return _inputText != null;
  }
}
