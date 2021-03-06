import 'package:flutter/material.dart';
import 'package:flutter_file_picker_example/core/shared/ui_text.dart';
import 'package:flutter_file_picker_example/core/shared/ui_theme.dart';
import 'package:flutter_file_picker_example/src/view/home_page.dart';
//import 'package:flutter_file_picker_example/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: UIText.appTitle,
      theme: mainTheme,
      debugShowCheckedModeBanner: false,
      //home: const FilePickerDemo(),
      home: const HomePage(),
    );
  }
}
