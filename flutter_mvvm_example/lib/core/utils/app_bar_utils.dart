import 'package:flutter/material.dart';

AppBar appBarStyle() {
  return AppBar(
    title: const Text(
      "Json Todos",
      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff3a9d94)),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    backgroundColor: Colors.white,
    centerTitle: true,
  );
}
