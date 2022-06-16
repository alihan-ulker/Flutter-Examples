import 'package:flutter/material.dart';
import 'package:main_page/core/shared/ui_font.dart';

class UIStyle {
  static TextStyle demibold14({required Color color}) =>
      TextStyle(fontSize: 14, color: color, fontFamily: UIFont.demiBold);

  static TextStyle demibold32({required Color color}) =>
      TextStyle(fontSize: 32, color: color, fontFamily: UIFont.demiBold);
}
