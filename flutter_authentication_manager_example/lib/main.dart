import 'package:flutter/material.dart';
import 'package:flutter_authentication_manager_example/core/auth_manager.dart';
import 'package:flutter_authentication_manager_example/core/shared/ui_text.dart';
import 'package:flutter_authentication_manager_example/src/login/login.dart';
import 'package:provider/provider.dart';

//"email": "eve.holt@reqres.in",
//"password": "pistol",
//"url":"https://reqres.in/api/login"

void main() => runApp(MultiProvider(
      providers: [
        Provider<AuthenticationManager>(
          create: (context) => AuthenticationManager(context: context),
        )
      ],
      child: const MyApp(),
    ));

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
      home: const Login(),
    );
  }
}
