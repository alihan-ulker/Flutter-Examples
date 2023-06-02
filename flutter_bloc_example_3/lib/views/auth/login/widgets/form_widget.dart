import 'package:flutter/material.dart';
import 'package:flutter_bloc_example_3/views/auth/login/widgets/login_button.dart';
import 'package:flutter_bloc_example_3/views/auth/login/widgets/password_textfiled.dart';
import 'package:flutter_bloc_example_3/views/auth/login/widgets/username_textfield.dart';

class FormWidget extends StatelessWidget {
  FormWidget({Key? key}) : super(key: key);

  final GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          UsernameTextfield(),
          PasswordTextfiled(),
          LoginButton(),
        ],
      ),
    );
  }
}
