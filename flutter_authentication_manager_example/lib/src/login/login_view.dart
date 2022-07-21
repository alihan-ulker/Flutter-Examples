import 'package:flutter/material.dart';
import 'package:flutter_authentication_manager_example/core/shared/ui_text.dart';
import 'package:flutter_authentication_manager_example/src/login/login_view_model.dart';

class LoginView extends LoginViewModel {
  final EdgeInsets paddingLow = const EdgeInsets.all(8.0);

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UIText.appTitle),
      ),
      body: Padding(
        padding: paddingLow,
        child: Center(
          child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: buildWrapFormBody()),
        ),
      ),
    );
  }

  Wrap buildWrapFormBody() {
    return Wrap(
      runSpacing: 10,
      alignment: WrapAlignment.end,
      children: [
        TextFormField(
            controller: controllerEmail,
            decoration: InputDecoration(
                labelText: UIText.emailText,
                border: const OutlineInputBorder())),
        TextFormField(
          obscureText: _isObscure,
          controller: controllerPassword,
          decoration: InputDecoration(
              labelText: UIText.passwordText,
              border: const OutlineInputBorder(),
              suffix: IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )),
        ),
        FloatingActionButton(
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              fetchUserLogin(controllerEmail.text, controllerPassword.text);
            }
          },
          child: const Icon(Icons.check),
        ),
      ],
    );
  }
}
