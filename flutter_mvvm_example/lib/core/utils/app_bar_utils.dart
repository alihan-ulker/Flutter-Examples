import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/core/shared/ui_text.dart';

AppBar appBarStyle() {
  return AppBar(
    title: Text(
      UIText.appTitle,
      style: const TextStyle(
          fontWeight: FontWeight.bold, color: Color(0xff3a9d94)),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    backgroundColor: Colors.white,
    centerTitle: true,
  );
}
