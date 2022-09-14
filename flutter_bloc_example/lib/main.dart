import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/feature/onboard/on_board_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Color.fromRGBO(11, 23, 84, 1))),
      home: const OnBoardView(),
    );
  }
}
