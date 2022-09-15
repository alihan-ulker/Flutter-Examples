import 'package:flutter/material.dart';

//login ekraninda ki kapi resmi icin
//fotografin yolunu enum a atarak kullandik
enum ImageEnums { door }

extension ImageEnumsExtension on ImageEnums {
  String get _toPath => "assets/images/ic_$name.png";
  Image get toImage => Image.asset(_toPath);
}
