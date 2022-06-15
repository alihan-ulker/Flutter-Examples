import 'package:flutter/material.dart';

class ViewLogin extends StatelessWidget {
  const ViewLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Login Page",
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
