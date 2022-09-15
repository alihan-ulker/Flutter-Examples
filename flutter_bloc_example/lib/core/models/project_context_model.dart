import 'package:flutter/material.dart';

class ProductContext extends ChangeNotifier {
  String newUserName = "";

  void changeName(String name) {
    newUserName = name;
    notifyListeners();
  }
}
