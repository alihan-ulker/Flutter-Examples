import 'package:flutter/material.dart';
import 'package:flutter_bloc_example_3/views/auth/login/widgets/login_button.dart';
import 'package:flutter_bloc_example_3/views/auth/login/widgets/password_textfiled.dart';
import 'package:flutter_bloc_example_3/views/auth/login/widgets/email_field.dart';

class FormWidget extends StatelessWidget {
  FormWidget({Key? key, required this.isLogin}) : super(key: key);

  final GlobalKey _formKey = GlobalKey<FormState>();
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailField(
            isLogin: isLogin,
          ),
          const PasswordTextfiled(),
          const SizedBox(height: 15),
          LoginButton(
            formKey: _formKey,
          ),
        ],
      ),
    );
  }
}
