import 'package:flutter/material.dart';
import 'package:flutter_authentication_manager_example/core/shared/ui_text.dart';
import 'package:flutter_authentication_manager_example/src/login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: UIText.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
    );
  }
}
