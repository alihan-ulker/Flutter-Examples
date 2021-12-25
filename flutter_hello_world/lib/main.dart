import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debug mode off
      debugShowCheckedModeBanner: false,
      title: 'Flutter Hello World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter - Hello World"),
          centerTitle: true,
        ),
        body: const Scaffold(
          body: Center(
            child: Text(
              "Hello World",
              style: TextStyle(fontSize: 32.0),
            ),
          ),
        ),
      ),
    );
  }
}
