import 'package:flutter/material.dart';
import 'package:flutter_file_picker_example/core/shared/ui_color.dart';

final ThemeData mainTheme = ThemeData(
  primaryColor: UIColor.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: Colors.black)),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(secondary: UIColor.gray),
);
