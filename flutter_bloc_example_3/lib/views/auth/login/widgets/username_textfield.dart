import 'package:flutter/material.dart';

class UsernameTextfield extends StatelessWidget {
  const UsernameTextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: "Username",
      ),
    );
  }
}
