import 'package:flutter/material.dart';

class PasswordTextfiled extends StatelessWidget {
  const PasswordTextfiled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.key),
        hintText: "Password",
      ),
    );
  }
}
